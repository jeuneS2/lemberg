//===-- LembergBranchSelector.cpp - Emit long conditional branches--*- C++ -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains a pass that scans a machine function to
// determine which conditional branches need a larger displacement to
// reach their target basic block than provided by the opcode. It does
// this in two passes; a calculation of basic block positions pass,
// and a branch opcode replacement pass. This pass should be run just
// before the pinner pass so we do not break cluster requirements.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "branch-select"
#include "Lemberg.h"
#include "LembergInstrInfo.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/MathExtras.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

STATISTIC(NumExpanded, "Number of branches expanded to long format");

namespace {
	struct BranchSelector : public MachineFunctionPass {
		static char ID;
		BranchSelector() : MachineFunctionPass(ID) {}

		/// BlockSizes - The sizes of the basic blocks in the function.
		std::vector<unsigned> BlockSizes;

		virtual bool runOnMachineFunction(MachineFunction &Fn);

		virtual const char *getPassName() const {
			return "Lemberg Branch Selector";
		}
	};
	char BranchSelector::ID = 0;
}

/// createLembergBranchSelectionPass - returns an instance of the Branch Selection Pass
FunctionPass *llvm::createLembergBranchSelectorPass(LembergTargetMachine &tm, 
													CodeGenOpt::Level OptLevel) {
	return new BranchSelector();
}

bool BranchSelector::runOnMachineFunction(MachineFunction &Fn) {

	const LembergInstrInfo *TII =
		static_cast<const LembergInstrInfo*>(Fn.getTarget().getInstrInfo());

	// Give the blocks of the function a dense, in-order, numbering.
	Fn.RenumberBlocks();
	BlockSizes.resize(Fn.getNumBlockIDs());

	// Measure each MBB and compute a size for the entire function.
	unsigned FuncSize = 0;
	for (MachineFunction::iterator MFI = Fn.begin(), E = Fn.end(); MFI != E; ++MFI) {
		MachineBasicBlock *MBB = MFI;
	  
		unsigned BlockSize = 0;
		for (MachineBasicBlock::iterator MBBI = MBB->begin(), EE = MBB->end(); MBBI != EE; ++MBBI) {
			BlockSize += 4;
			if (MBBI->getDesc().hasDelaySlot()) {
				BlockSize += 3;
			}
		}	  

		BlockSizes[MBB->getNumber()] = BlockSize;
		FuncSize += BlockSize;
	}
  
	// If the entire function is smaller than the displacement of a branch field,
	// we know we don't need to shrink any branches in this function.  This is a
	// common case.
	if (FuncSize < (1 << 9)) {
		BlockSizes.clear();
		return false;
	}
  
	// For each conditional branch, if the offset to its destination is larger
	// than the offset field allows, transform it into a long branch sequence
	// like this:
	//   short branch:
	//     brz xx rX, MBB
	//   longer branch:
	//     cmpxx rX, 0 -> c3
	//     if c3 br MBB
	//
	bool MadeChange = true;
	bool EverMadeChange = false;
	while (MadeChange) {
		// Iteratively expand branches until we reach a fixed point.
		MadeChange = false;
  
		for (MachineFunction::iterator MFI = Fn.begin(), E = Fn.end(); MFI != E; ++MFI) {
			MachineBasicBlock &MBB = *MFI;
			unsigned MBBStartOffset = 0;

			for (MachineBasicBlock::iterator I = MBB.begin(), E = MBB.end(); I != E; ++I) {
				if ((I->getOpcode() != Lemberg::JUMPeqz)
					&& (I->getOpcode() != Lemberg::JUMPnez)
					&& (I->getOpcode() != Lemberg::JUMPltz)
					&& (I->getOpcode() != Lemberg::JUMPgez)
					&& (I->getOpcode() != Lemberg::JUMPgtz)
					&& (I->getOpcode() != Lemberg::JUMPlez)
					&& (I->getOpcode() != Lemberg::JUMP)) {

					MBBStartOffset += 4;
					if (I->getDesc().hasDelaySlot()) {
						MBBStartOffset += 3;
					}

					continue;
				}
        
				// Determine the offset from the current branch to the destination
				// block.
				MachineBasicBlock *Dest =
					I->getOpcode() == Lemberg::JUMP ?
					I->getOperand(0).getMBB() : I->getOperand(1).getMBB();				
		  
				int BranchSize;
				if (Dest->getNumber() <= MBB.getNumber()) {
					// If this is a backwards branch, the delta is the offset from the
					// start of this block to this branch, plus the sizes of all blocks
					// from this block to the dest.
					BranchSize = MBBStartOffset;
			  
					for (unsigned i = Dest->getNumber(), e = MBB.getNumber(); i != e; ++i)
						BranchSize += BlockSizes[i];
				} else {
					// Otherwise, add the size of the blocks between this block and the
					// dest to the number of bytes left in this block.
					BranchSize = -MBBStartOffset;
			  
					for (unsigned i = MBB.getNumber(), e = Dest->getNumber(); i != e; ++i)
						BranchSize += BlockSizes[i];
				}
		  
				// If this branch is in range, ignore it.
				if (isInt<10>(BranchSize)) {
					continue;
				}

				if (I->getOpcode() == Lemberg::JUMP) {
					// Set a flag to mark long branch that must not be converted to short format
					I->setFlag((MachineInstr::MIFlag)(1 << 7));
					continue;
				}
		  
				// Otherwise, we have to expand it to a longer branch.
				MachineInstr *OldBranch = I;
				DebugLoc DL = OldBranch->getDebugLoc();
		  
				unsigned Reg = I->getOperand(0).getReg();
				unsigned Opcode = 0;
				switch (I->getOpcode()) {
				case Lemberg::JUMPeqz: Opcode = Lemberg::CMPEQaic; break;
				case Lemberg::JUMPnez: Opcode = Lemberg::CMPNEaic; break;
				case Lemberg::JUMPltz: Opcode = Lemberg::CMPLTaic; break;
				case Lemberg::JUMPgez: Opcode = Lemberg::CMPGEaic; break;
				case Lemberg::JUMPgtz: Opcode = Lemberg::CMPGTaic; break;
				case Lemberg::JUMPlez: Opcode = Lemberg::CMPLEaic; break;
				}

				// Create branch with larger displacement
				BuildMI(MBB, I, DL, TII->get(Opcode), Lemberg::C3)
					.addImm(-1).addReg(0)
					.addReg(Reg).addImm(0);

				I = BuildMI(MBB, I, DL, TII->get(Lemberg::JUMPtrue))
					.addReg(Lemberg::C3).addMBB(Dest);				
          
				// Remove the old branch from the function.
				OldBranch->eraseFromParent();

				// We increased the block by one instruction
				BlockSizes[MBB.getNumber()] += 4;

				++NumExpanded;
				MadeChange = true;
			}
		}
		EverMadeChange |= MadeChange;
	}
  
	BlockSizes.clear();
	return true;
}

