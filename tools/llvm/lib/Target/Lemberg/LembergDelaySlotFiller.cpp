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
#include "llvm/CodeGen/MachineBranchProbabilityInfo.h"
#include "llvm/Target/TargetInstrInfo.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

STATISTIC(FilledSlots, "Number of no-op delay slot cycles");
STATISTIC(HiddenSlots, "Number of hidden delay slot cycles");
STATISTIC(NowSlots, "Number of non-delayed branches");

namespace {

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

	virtual void getAnalysisUsage(AnalysisUsage &AU) const;

	void fillDelaySlot(MachineBasicBlock::iterator &II, MachineBasicBlock &MBB, bool recurse, bool split);

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

void Filler::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<MachineBranchProbabilityInfo>();
    MachineFunctionPass::getAnalysisUsage(AU);
}

void Filler::fillDelaySlot(MachineBasicBlock::iterator &II, MachineBasicBlock &MBB, bool recurse, bool split) {

	const LembergSubtarget *LST = ((LembergTargetMachine &)TM).getSubtargetImpl();
	const InstrItineraryData &IID = LST->getInstrItins();
	const InstrItinerary *IITab = IID.Itineraries;
	const InstrStage *IIStages = IID.Stages;

	const MachineBranchProbabilityInfo *MBPI = &getAnalysis<MachineBranchProbabilityInfo>();
		
	DebugLoc DL = II->getDebugLoc();

	MachineBasicBlock::iterator insertII = next(II);

	unsigned ClusterCount = TM.getSubtarget<LembergSubtarget>().getClusters();

	unsigned Opcode = II->getOpcode();

	unsigned maxSlots = LembergSubtarget::DelaySlots;
	if (Opcode == Lemberg::CALLga
		|| Opcode == Lemberg::CALL
		|| Opcode == Lemberg::RET) {
		maxSlots = LembergSubtarget::DelaySlots+1;
	}
	if (Opcode == Lemberg::JUMPp) {
		maxSlots = 0;
	}

	if (fullOpt
		&& II != MBB.begin()
		&& (Opcode == Lemberg::JUMP
			|| Opcode == Lemberg::JUMPpred
			|| Opcode == Lemberg::JUMPtrue
			|| Opcode == Lemberg::JUMPfalse
			|| Opcode == Lemberg::JUMPeqz
			|| Opcode == Lemberg::JUMPnez
			|| Opcode == Lemberg::JUMPltz
			|| Opcode == Lemberg::JUMPgez
			|| Opcode == Lemberg::JUMPgtz
			|| Opcode == Lemberg::JUMPlez
			|| Opcode == Lemberg::JUMPp
			|| Opcode == Lemberg::CALLga
			|| Opcode == Lemberg::CALL
			|| Opcode == Lemberg::RET)) {

 	    unsigned targReg = 0;
		if (Opcode == Lemberg::JUMPp
			|| Opcode == Lemberg::CALL) {
		  targReg = II->getOperand(2).getReg();
		}

		unsigned condReg = 0;
		switch (Opcode) {
		case Lemberg::JUMPpred:
		case Lemberg::JUMPp:
		case Lemberg::CALL:
		case Lemberg::RET:
			condReg = II->getOperand(1).getReg();
			break;
		case Lemberg::JUMPtrue:
		case Lemberg::JUMPfalse:
		case Lemberg::JUMPeqz:
		case Lemberg::JUMPnez:
		case Lemberg::JUMPltz:
		case Lemberg::JUMPgez:
		case Lemberg::JUMPgtz:
		case Lemberg::JUMPlez:
			condReg = II->getOperand(0).getReg();
			break;
		}

		unsigned BrSchedClass = II->getDesc().getSchedClass();
		unsigned BrSlot = IIStages[IITab[BrSchedClass].FirstStage].getUnits();	

		MachineBasicBlock::iterator J = prior(II), newII = II;				
		unsigned movedSlots = 0;
		bool conflictsLoad = false;
		for (unsigned i = 0; i <= maxSlots; ++i) {
			// look for a bundle with space in it
			unsigned bundleSize = 0;
			bool conflicts = false;
			bool conflictsHere = false;
			bool conflictsSplit = !split;
			bool loadUse = false;
			bool loadDef = false;			
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
				// do not move past target definition
				if (targReg && J->definesRegister(targReg)) {
					conflicts = true;
				}
				// avoid conflicts with other delay slots
				if (J->getDesc().hasDelaySlot()) {
					unsigned ConflictOpcode = J->getOpcode();

					if (recurse) {

						if (Opcode == Lemberg::JUMP
							&& ((!(II->getFlag((MachineInstr::MIFlag)(1 << 7)))
								 && (ConflictOpcode == Lemberg::JUMPeqz
									 || ConflictOpcode == Lemberg::JUMPeqz_now
									 || ConflictOpcode == Lemberg::JUMPnez
									 || ConflictOpcode == Lemberg::JUMPnez_now
									 || ConflictOpcode == Lemberg::JUMPltz
									 || ConflictOpcode == Lemberg::JUMPltz_now
									 || ConflictOpcode == Lemberg::JUMPgez
									 || ConflictOpcode == Lemberg::JUMPgez_now
									 || ConflictOpcode == Lemberg::JUMPgtz
									 || ConflictOpcode == Lemberg::JUMPgtz_now
									 || ConflictOpcode == Lemberg::JUMPlez
									 || ConflictOpcode == Lemberg::JUMPlez_now))
								|| ConflictOpcode == Lemberg::JUMPtrue
								|| ConflictOpcode == Lemberg::JUMPtrue_now
								|| ConflictOpcode == Lemberg::JUMPfalse
								|| ConflictOpcode == Lemberg::JUMPfalse_now
								|| ConflictOpcode == Lemberg::JUMPpred
								|| ConflictOpcode == Lemberg::JUMPpred_now
								|| ConflictOpcode == Lemberg::JUMPp)) {

						    const BranchProbability &Prob =
							  MBPI->getEdgeProbability(&MBB, II->getOperand(0).getMBB());

							MachineBasicBlock *ConfTarget;
							if (ConflictOpcode == Lemberg::JUMPp) {
							  ConfTarget = NULL;
							} else if (ConflictOpcode == Lemberg::JUMPpred
								|| ConflictOpcode == Lemberg::JUMPpred_now) {
							  ConfTarget = J->getOperand(2).getMBB();
							} else {
							  ConfTarget = J->getOperand(1).getMBB();
							}

							const BranchProbability &ConfProb =
							  ConfTarget == NULL ? BranchProbability::getZero() :
							  MBPI->getEdgeProbability(&MBB, ConfTarget);
							MachineInstr *MI = J;
							if (ConfProb > Prob) {
								// Move up conflicting branch first
							    fillDelaySlot(J, MBB, false, true);
							} else {
								// Remove so we can schedule across this branch
								MBB.erase(next(J)); // remove SEP
								MI = MBB.remove(J);
							}

							// Change to reversed branch and move up
							MachineOperand Dest = II->getOperand(0);
							II->RemoveOperand(0);
							
							unsigned ConvOpcode = 0;
							switch (ConflictOpcode) {
							case Lemberg::JUMPeqz:
							case Lemberg::JUMPeqz_now:
							  ConvOpcode = Lemberg::JUMPnez;
							  break;
							case Lemberg::JUMPnez:
							case Lemberg::JUMPnez_now:
							  ConvOpcode = Lemberg::JUMPeqz;
							  break;
							case Lemberg::JUMPltz:
							case Lemberg::JUMPltz_now:
							  ConvOpcode = Lemberg::JUMPgez;
							  break;
							case Lemberg::JUMPgez:
							case Lemberg::JUMPgez_now:
							  ConvOpcode = Lemberg::JUMPltz;
							  break;
							case Lemberg::JUMPgtz:
							case Lemberg::JUMPgtz_now:
							  ConvOpcode = Lemberg::JUMPlez;
							  break;
							case Lemberg::JUMPlez:
							case Lemberg::JUMPlez_now:
							  ConvOpcode = Lemberg::JUMPgtz;
							  break;
							case Lemberg::JUMPtrue:
							case Lemberg::JUMPtrue_now:
							  ConvOpcode = Lemberg::JUMPfalse;
							  break;
							case Lemberg::JUMPfalse:
							case Lemberg::JUMPfalse_now:
							  ConvOpcode = Lemberg::JUMPtrue;
							  break;
							case Lemberg::JUMPpred:
							case Lemberg::JUMPpred_now:
							case Lemberg::JUMPp:
							  ConvOpcode = Lemberg::JUMPpred;
							  break;
							}

							MCInstrDesc *NMID = new MCInstrDesc();
							*NMID = TII->get(ConvOpcode);
							NMID->SchedClass = J->getDesc().getSchedClass();
							II->setDesc(*NMID);
							
							if (ConflictOpcode == Lemberg::JUMPpred
								|| ConflictOpcode == Lemberg::JUMPpred_now
								|| ConflictOpcode == Lemberg::JUMPp) {
							  int Cond = J->getOperand(0).getImm() == 0 ? 1 : 0;
							  II->addOperand(MachineOperand::CreateImm(Cond));
							  II->addOperand(J->getOperand(1));
							  II->addOperand(Dest);
							} else {
							  II->addOperand(J->getOperand(0));
							  II->addOperand(Dest);
							}
							
							if (ConfProb > Prob) {
							    // Handle this branch
							    fillDelaySlot(II, MBB, false, false);
								if (ConflictOpcode == Lemberg::JUMPtrue
									|| ConflictOpcode == Lemberg::JUMPtrue_now
									|| ConflictOpcode == Lemberg::JUMPfalse
									|| ConflictOpcode == Lemberg::JUMPfalse_now
									|| ConflictOpcode == Lemberg::JUMPpred
									|| ConflictOpcode == Lemberg::JUMPpred_now
									|| ConflictOpcode == Lemberg::JUMPp) {
								  if (next(II) != J) II = J;
								} else {
								  // We already scheduled J, don't look at it again
								  II = J;
								}
							} else {
							    // Handle other branch
							    fillDelaySlot(II, MBB, false, true);
								// Insert this branch again
								MBB.push_back(MI);
								BuildMI(&MBB, DebugLoc(), TII->get(Lemberg::SEP));
								// Move up branch
								fillDelaySlot(J, MBB, false, false);

								if (ConflictOpcode == Lemberg::JUMPtrue
									|| ConflictOpcode == Lemberg::JUMPtrue_now
									|| ConflictOpcode == Lemberg::JUMPfalse
									|| ConflictOpcode == Lemberg::JUMPfalse_now
									|| ConflictOpcode == Lemberg::JUMPpred
									|| ConflictOpcode == Lemberg::JUMPpred_now
									|| ConflictOpcode == Lemberg::JUMPp) {
								  if (next(J) == II) II = J;
								}
							}
							return;
						} else {
							conflicts = true;
						}
					} else {
						if ((Opcode == Lemberg::JUMPpred 
							 && (ConflictOpcode == Lemberg::JUMPpred
								 || ConflictOpcode == Lemberg::JUMPpred_now
								 || ConflictOpcode == Lemberg::JUMPp))
							|| ((Opcode == Lemberg::JUMPtrue
								 || Opcode == Lemberg::JUMPtrue_now)
								&& (ConflictOpcode == Lemberg::JUMPfalse
									|| ConflictOpcode == Lemberg::JUMPfalse_now))
							|| ((Opcode == Lemberg::JUMPfalse
								 || Opcode == Lemberg::JUMPfalse_now)
								&& (ConflictOpcode == Lemberg::JUMPtrue
									|| ConflictOpcode == Lemberg::JUMPtrue_now))) {
							/* no real conflict in these cases, but don't split */
						    conflictsSplit = true;
						} else {
							conflicts = true;
						}
					}
				}
				// $rb and $ro must be saved before calls
				if (Opcode == Lemberg::CALLga || Opcode == Lemberg::CALL) {
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

				if (Opcode == Lemberg::CALLga || Opcode == Lemberg::CALL 
					|| Opcode == Lemberg::RET) {
					// call/return must not be moved into loads of memory results
				    if (J->readsRegister(Lemberg::R31)) {
					    loadUse = true;
						conflictsSplit = true;
					}
				    if (J->definesRegister(Lemberg::R31)) {
					    loadDef = true;
					}
					// call/return needs the memunit
					if (J->getDesc().mayLoad() || J->getDesc().mayStore()) {
						conflictsHere = true;
					}
				}
						
				// avoid clashes with other ops in same slot
				if (Opcode == Lemberg::JUMPeqz
					|| Opcode == Lemberg::JUMPnez
					|| Opcode == Lemberg::JUMPltz
					|| Opcode == Lemberg::JUMPgez
					|| Opcode == Lemberg::JUMPgtz
					|| Opcode == Lemberg::JUMPlez) {
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

			// Load ended here and no new load started
			if (loadDef && !loadUse) {
			  conflictsLoad = false;
			}

			if (conflicts) {
				break;
			}

			// okay, we found some room for the jump
			if (bundleSize < ClusterCount && !conflictsHere && !conflictsLoad && J != II) {
				// remove what would be consecutive separators
				if (next(II)->getOpcode() == Lemberg::SEP
					&& prior(II)->getOpcode() == Lemberg::SEP) {
					prior(II)->eraseFromParent();
				}
				MBB.insertAfter(J, II->removeFromParent());
				newII = next(J);
				movedSlots = i;
			} else if (i < maxSlots && !conflictsLoad && !conflictsSplit && J != II) {
			    // insert as new bundle
				if (next(II)->getOpcode() == Lemberg::SEP
					&& prior(II)->getOpcode() == Lemberg::SEP) {
					prior(II)->eraseFromParent();
				}
				if (J->getOpcode() == Lemberg::SEP) {
				  BuildMI(MBB, J, DebugLoc(), TII->get(Lemberg::SEP));
				  MBB.insert(J, II->removeFromParent());
				  newII = prior(J);
				  J = prior(newII);
				} else {
				  MBB.insert(J, II->removeFromParent());
				  BuildMI(MBB, J, DebugLoc(), TII->get(Lemberg::SEP));
				  newII = prior(prior(J));
				  J = newII;
				}
				movedSlots = i+1;
			}

			// Load started here
			if (loadUse) {
			  conflictsLoad = true;
			}

			if (J == MBB.begin()) {
				break;
			}
		}
		MachineInstr *N = next(newII);
		if (N->getOpcode() == Lemberg::NOP) {
			N->eraseFromParent();
		}

		HiddenSlots += movedSlots;

		if (movedSlots == 0) {
			// nothing can be hidden, branch _now_ if possible
			unsigned OpcodeNow = 0;
			switch (Opcode) {
			case Lemberg::JUMP: OpcodeNow = Lemberg::JUMP_now; break;
			case Lemberg::JUMPtrue: OpcodeNow = Lemberg::JUMPtrue_now; break;
			case Lemberg::JUMPfalse: OpcodeNow = Lemberg::JUMPfalse_now; break;
			case Lemberg::JUMPeqz: OpcodeNow = Lemberg::JUMPeqz_now; break;
			case Lemberg::JUMPnez: OpcodeNow = Lemberg::JUMPnez_now; break;
			case Lemberg::JUMPltz: OpcodeNow = Lemberg::JUMPltz_now; break;
			case Lemberg::JUMPgez: OpcodeNow = Lemberg::JUMPgez_now; break;
			case Lemberg::JUMPgtz: OpcodeNow = Lemberg::JUMPgtz_now; break;
			case Lemberg::JUMPlez: OpcodeNow = Lemberg::JUMPlez_now; break;
			case Lemberg::JUMPpred: OpcodeNow = Lemberg::JUMPpred_now; break;
			}
			// found a replacement
			if (OpcodeNow != 0) {
				MCInstrDesc *NMID = new MCInstrDesc();
				*NMID = TII->get(OpcodeNow);
				NMID->SchedClass = II->getDesc().getSchedClass();
				II->setDesc(*NMID);
				movedSlots = maxSlots;
				NowSlots++;
			}
		}
		// fill remaining slots
		if (movedSlots < maxSlots) {
			for (unsigned i = 0; i < maxSlots-movedSlots; i++) {
				BuildMI(MBB, insertII, DebugLoc(), TII->get(Lemberg::SEP));
				BuildMI(MBB, insertII, DebugLoc(), TII->get(Lemberg::NOP));
				FilledSlots++;
			}
		}
	} else {		
		unsigned minSlots = 0;
		if (II == MBB.begin()) {
			// nothing can be hidden, branch _now_ if possible
			unsigned OpcodeNow = 0;
			switch (Opcode) {
			case Lemberg::JUMP: OpcodeNow = Lemberg::JUMP_now; break;
			case Lemberg::JUMPtrue: OpcodeNow = Lemberg::JUMPtrue_now; break;
			case Lemberg::JUMPfalse: OpcodeNow = Lemberg::JUMPfalse_now; break;
			case Lemberg::JUMPeqz: OpcodeNow = Lemberg::JUMPeqz_now; break;
			case Lemberg::JUMPnez: OpcodeNow = Lemberg::JUMPnez_now; break;
			case Lemberg::JUMPltz: OpcodeNow = Lemberg::JUMPltz_now; break;
			case Lemberg::JUMPgez: OpcodeNow = Lemberg::JUMPgez_now; break;
			case Lemberg::JUMPgtz: OpcodeNow = Lemberg::JUMPgtz_now; break;
			case Lemberg::JUMPlez: OpcodeNow = Lemberg::JUMPlez_now; break;
			case Lemberg::JUMPpred: OpcodeNow = Lemberg::JUMPpred_now; break;
			}
			// found a replacement
			if (OpcodeNow != 0) {
				MCInstrDesc *NMID = new MCInstrDesc();
				*NMID = TII->get(OpcodeNow);
				NMID->SchedClass = II->getDesc().getSchedClass();
				II->setDesc(*NMID);
				minSlots = maxSlots;
				NowSlots++;
			}
		}
		for (unsigned i = minSlots; i < maxSlots; i++) {
			BuildMI(MBB, insertII, DebugLoc(), TII->get(Lemberg::SEP));
			BuildMI(MBB, insertII, DebugLoc(), TII->get(Lemberg::NOP));
			FilledSlots++;
		}
	}
}

/// runOnMachineBasicBlock - Fill in delay slots for the given basic block.
bool Filler::
runOnMachineBasicBlock(MachineBasicBlock &MBB) 
{
	bool Changed = false;
	for (MachineBasicBlock::iterator II = MBB.end(); II != MBB.begin(); ) {
		--II;
		if (II->getDesc().hasDelaySlot()) {
		    fillDelaySlot(II, MBB, true, true);
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

