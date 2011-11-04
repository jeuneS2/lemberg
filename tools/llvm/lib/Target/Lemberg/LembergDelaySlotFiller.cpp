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

namespace {

  static const unsigned ClusterCount = 4;

  struct Filler : public MachineFunctionPass {

    TargetMachine &TM;
    const TargetInstrInfo *TII;
    bool fullOpt;

    static char ID;
	Filler(TargetMachine &tm, CodeGenOpt::Level OptLevel) 
		: MachineFunctionPass(ID), TM(tm), TII(tm.getInstrInfo()) {
		fullOpt = OptLevel > CodeGenOpt::None;
	}

    virtual const char *getPassName() const {
      return "Lemberg Delay Slot Filler";
    }

	  void fillDelaySlot(MachineBasicBlock::iterator &II, MachineBasicBlock &MBB, bool recurse);

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

void Filler::fillDelaySlot(MachineBasicBlock::iterator &II, MachineBasicBlock &MBB, bool recurse) {

	const LembergSubtarget *LST = ((LembergTargetMachine &)TM).getSubtargetImpl();
	const InstrItineraryData &IID = LST->getInstrItins();
	const InstrItinerary *IITab = IID.Itineraries;
	const InstrStage *IIStages = IID.Stages;
		
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

	if (fullOpt
		&& II != MBB.begin()
		&& (Opcode == Lemberg::JUMP
			|| Opcode == Lemberg::JUMPpred
			|| Opcode == Lemberg::JUMPtrue
			|| Opcode == Lemberg::JUMPfalse
			|| Opcode == Lemberg::JUMPeqz
			|| Opcode == Lemberg::JUMPnez
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
		case Lemberg::JUMPeqz:
		case Lemberg::JUMPnez:
			condReg = II->getOperand(0).getReg();
			break;
		}

		unsigned BrSchedClass = II->getDesc().getSchedClass();
		unsigned BrSlot = IIStages[IITab[BrSchedClass].FirstStage].getUnits();				

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
						
				// do not move past inline asm
				if (J->isInlineAsm()) {							
					conflicts = true;
				}
				// do not move past condition definition
				if (condReg && J->definesRegister(condReg)) {							
					conflicts = true;
				}
				// avoid conflicts with other delay slots
				if (J->getDesc().hasDelaySlot()) {
					unsigned ConflictOpcode = J->getOpcode();

					if (recurse) {

						if (Opcode == Lemberg::JUMP
							&& (ConflictOpcode == Lemberg::JUMPeqz
								|| ConflictOpcode == Lemberg::JUMPnez)) {

							// Move up conflicting branch first
							fillDelaySlot(J, MBB, false);
							// Change to reversed branch and move up
							MachineOperand Dest = II->getOperand(0);
							II->RemoveOperand(0);
							
							TargetInstrDesc *NTID = new TargetInstrDesc();
							*NTID = TII->get(ConflictOpcode == Lemberg::JUMPeqz 
											 ? Lemberg::JUMPnez : Lemberg::JUMPeqz);
							NTID->SchedClass = J->getDesc().getSchedClass();
							II->setDesc(*NTID);
							
							II->addOperand(J->getOperand(0));
							II->addOperand(Dest);
							
							fillDelaySlot(II, MBB, false);
							// We already scheduled J, don't look at it again
							II = J;
							return;
						} else if (Opcode == Lemberg::JUMP
							&& (ConflictOpcode == Lemberg::JUMPtrue
								|| ConflictOpcode == Lemberg::JUMPfalse)) {

							// Move up conflicting branch first
							fillDelaySlot(J, MBB, false);
							// Change to reversed branch and move up
							MachineOperand Dest = II->getOperand(0);
							II->RemoveOperand(0);
							
							II->setDesc(TII->get(ConflictOpcode == Lemberg::JUMPtrue 
											 ? Lemberg::JUMPfalse : Lemberg::JUMPfalse));
							II->addOperand(J->getOperand(0));
							II->addOperand(Dest);
							
							fillDelaySlot(II, MBB, false);
							// Continue after the one that's scheduled highest
							if (next(II) != J) II = J;
							return;
						} else if (Opcode == Lemberg::JUMP
								   && ConflictOpcode == Lemberg::JUMPpred) {

							// Move up conflicting branch first
							fillDelaySlot(J, MBB, false);
							// Change to reversed branch and move up
							MachineOperand Dest = II->getOperand(0);
							II->RemoveOperand(0);
									
							II->setDesc(TII->get(Lemberg::JUMPpred));							
							int Cond = J->getOperand(0).getImm() == 0 ? 1 : 0;
							II->addOperand(MachineOperand::CreateImm(Cond));
							II->addOperand(J->getOperand(1));
							II->addOperand(Dest);
							
							fillDelaySlot(II, MBB, false);
							// Continue after the one that's scheduled highest
							if (next(II) != J) II = J;
							return;
						} else {
							conflicts = true;
						}
					} else {
						if ((Opcode == Lemberg::JUMPpred 
							 && ConflictOpcode == Lemberg::JUMPpred)
							|| (Opcode == Lemberg::JUMPtrue
								&& ConflictOpcode == Lemberg::JUMPfalse)
							|| (Opcode == Lemberg::JUMPfalse
								&& ConflictOpcode == Lemberg::JUMPtrue)) {
							/* no conflict in these cases */
						} else {
							conflicts = true;
						}
					}
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
						
				// avoid clashes with other ops in same slot
				if (Opcode == Lemberg::JUMPeqz || Opcode == Lemberg::JUMPnez) {
					unsigned SchedClass = J->getDesc().getSchedClass();
					unsigned Slot = IIStages[IITab[SchedClass].FirstStage].getUnits();
					if (Slot == BrSlot
						&& !Lemberg::GRegClass.contains(condReg)) {
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
				   && "Cannot share cycle with multicycle NOP");
			N->eraseFromParent();
		}

		HiddenSlots += movedSlots;
		// fill remaining slots
		if (movedSlots < maxSlots) {
			for (unsigned i = 0; i < maxSlots-movedSlots; i++) {
				BuildMI(MBB, insertII, DebugLoc(), TII->get(Lemberg::SEP));
				BuildMI(MBB, insertII, DebugLoc(), TII->get(Lemberg::NOP)).addImm(0);
				FilledSlots++;
			}
		}
	} else {
		for (unsigned i = 0; i < maxSlots; i++) {
			BuildMI(MBB, insertII, DebugLoc(), TII->get(Lemberg::SEP));
			BuildMI(MBB, insertII, DebugLoc(), TII->get(Lemberg::NOP)).addImm(0);
			FilledSlots++;
		}
	}
}

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
			fillDelaySlot(II, MBB, true);
			Changed = true;
		}
	}
	return Changed;
}

/// createLembergDelaySlotFillerPass - Returns a pass that fills in delay
/// slots in Lemberg MachineFunctions
FunctionPass *llvm::createLembergDelaySlotFillerPass(LembergTargetMachine &tm, 
													 CodeGenOpt::Level OptLevel) {
	return new Filler(tm, OptLevel);
}

