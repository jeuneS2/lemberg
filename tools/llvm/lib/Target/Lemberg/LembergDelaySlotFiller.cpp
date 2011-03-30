//===-- DelaySlotFiller.cpp - Lemberg delay slot filler -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Simple pass to fills delay slots with NOPs.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "delay-slot-filler"

#include "Lemberg.h"
#include "LembergTargetMachine.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Target/TargetInstrInfo.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

STATISTIC(FilledSlots, "Number of no-op delay slot cycles");
STATISTIC(HiddenSlots, "Number of hidden delay slot cycles");
STATISTIC(NopSlots,    "Number of NOPs inserted");

namespace {

  static const unsigned ClusterCount = 4;

  struct Filler : public MachineFunctionPass {

    TargetMachine &TM;
    const TargetInstrInfo *TII;

    static char ID;
    Filler(TargetMachine &tm) 
      : MachineFunctionPass(ID), TM(tm), TII(tm.getInstrInfo()) { }

    virtual const char *getPassName() const {
      return "Lemberg Delay Slot Filler";
    }

    bool runOnMachineBasicBlock(MachineBasicBlock &MBB);
    bool runOnMachineFunction(MachineFunction &F) {
      bool Changed = false;
      for (MachineFunction::iterator FI = F.begin(), FE = F.end();
           FI != FE; ++FI)
        Changed |= runOnMachineBasicBlock(*FI);
      return Changed;
    }

  };
  char Filler::ID = 0;
} // end of anonymous namespace

/// runOnMachineBasicBlock - Fill in delay slots for the given basic block.
/// Currently, we fill delay slots with NOPs. We assume there are three
/// delay slots per delayed instruction.
bool Filler::
runOnMachineBasicBlock(MachineBasicBlock &MBB) 
{
	bool Changed = false;
	for (MachineBasicBlock::iterator II = MBB.end(); II != MBB.begin(); ) {

		--II;
		
		if (II->getDesc().hasDelaySlot()) {
			DebugLoc DL = II->getDebugLoc();

			MachineBasicBlock::iterator insertII = next(II);

			unsigned Opcode = II->getOpcode();

			unsigned maxSlots = 3;
			if (Opcode == Lemberg::CALL
				|| Opcode == Lemberg::CALLga
				|| Opcode == Lemberg::RET
				|| Opcode == Lemberg::JUMPp) {
				maxSlots = 4;
			}

			// we only need to consider the condition flag for moving
			if (II != MBB.begin()
				&& (Opcode == Lemberg::JUMP
					|| Opcode == Lemberg::JUMPpred
					|| Opcode == Lemberg::JUMPtrue
					|| Opcode == Lemberg::JUMPfalse
					|| Opcode == Lemberg::CALLga
				    || Opcode == Lemberg::RET)) {

				unsigned condReg = 0;
				switch (Opcode) {
				case Lemberg::JUMPpred:
				case Lemberg::RET:					
					condReg = II->getOperand(1).getReg();
					break;
				case Lemberg::JUMPtrue:
				case Lemberg::JUMPfalse:
					condReg = II->getOperand(0).getReg();
					break;
				}

				MachineBasicBlock::iterator J = prior(II), newII = II;				
				unsigned movedSlots = 0;
				for (unsigned i = 0; i <= maxSlots; ++i) {
					// look for a bundle with space in it
					unsigned bundleSize = 0;
					bool conflicts = false;
					bool conflictsLate = false;
					bool conflictsHere = false;
					--J;
					while (J->getOpcode() != Lemberg::SEP) {
						
						// do not move past condition definition
						if (condReg && J->definesRegister(condReg)) {							
							conflicts = true;
						}
						// avoid conflicts with other delay slots
						if (J->getDesc().hasDelaySlot()) {
							conflicts = true;
						}
						// do not move across multi-cycle nops
						if (J->getOpcode() == Lemberg::NOP
							&& J->getOperand(0).getImm() != 0) {
							conflicts = true;
						}
						// $rb and $ro must be saved before calls
						if (Opcode == Lemberg::CALLga) {
							if (J->getOpcode() == Lemberg::MOVExa
								&& (J->getOperand(3).getReg() == Lemberg::RB
									|| J->getOperand(3).getReg() == Lemberg::RO)) {
								conflicts = true;
							}
						}
						// $rb and $ro must be set for return
						if (Opcode == Lemberg::RET) {
							if (J->getOpcode() == Lemberg::MOVEax
								&& (J->getOperand(0).getReg() == Lemberg::RB
									|| J->getOperand(0).getReg() == Lemberg::RO)) {
								conflicts = true;
							}
						}						

						if (Opcode == Lemberg::CALLga || Opcode == Lemberg::RET) {
							// call/return must not be moved across loads of memory results
							if (J->getOpcode() == Lemberg::LDXa
								|| J->getOpcode() == Lemberg::LDXi) {
								conflictsLate = true;
							}
							// call/return needs the memunit
							if (J->getDesc().mayLoad() || J->getDesc().mayStore()) {
								conflictsHere = true;
							}
						}

						++bundleSize;

						if (J == MBB.begin()) break;
						--J;
					}

					if (conflicts) {
						break;
					}

					// okay, we found some room for the jump
					if (bundleSize < ClusterCount && !conflictsHere && J != II) {
						// remove what would be consecutive separators
						if (next(II)->getOpcode() == Lemberg::SEP
							&& prior(II)->getOpcode() == Lemberg::SEP) {
							prior(II)->eraseFromParent();
						}
						MBB.insert(next(J), II->removeFromParent());
						newII = next(J);
						movedSlots = i;
					}

					if (J == MBB.begin() || conflictsLate) {
						break;
					}
				}
				MachineInstr *N = next(newII);
				if (N->getOpcode() == Lemberg::NOP) {
					assert(N->getOperand(0).getImm() == 0 
						   && "Cannot share cycle with multicacle NOP");
					N->eraseFromParent();
				}

				HiddenSlots += movedSlots;
				// fill remaining slots
				if (movedSlots < maxSlots) {
					BuildMI(MBB, insertII, DL, TII->get(Lemberg::SEP));
					BuildMI(MBB, insertII, DL, TII->get(Lemberg::NOP))
						.addImm(maxSlots-movedSlots-1);
					++NopSlots;
					FilledSlots += maxSlots-movedSlots;
				}
			} else {
				BuildMI(MBB, insertII, DL, TII->get(Lemberg::SEP));
				BuildMI(MBB, insertII, DL, TII->get(Lemberg::NOP))
					.addImm(maxSlots-1);
				++NopSlots;
				FilledSlots += maxSlots;
			}
			Changed = true;
		}
	}
	return Changed;
}

/// createLembergDelaySlotFillerPass - Returns a pass that fills in delay
/// slots in Lemberg MachineFunctions
FunctionPass *llvm::createLembergDelaySlotFillerPass(LembergTargetMachine &tm, 
													 CodeGenOpt::Level OptLevel) {
  return new Filler(tm);
}

