//===- LembergInstrInfo.cpp - Lemberg Instruction Information ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Lemberg implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "LembergInstrInfo.h"
#include "LembergSubtarget.h"
#include "Lemberg.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#define GET_INSTRINFO_CTOR
#include "LembergGenInstrInfo.inc"

using namespace llvm;

LembergInstrInfo::LembergInstrInfo(LembergSubtarget &ST)
  : LembergGenInstrInfo(Lemberg::ADJCALLSTACKDOWN, Lemberg::ADJCALLSTACKUP),
    RI(ST, *this),
    Subtarget(ST) {}

static bool inClass(const TargetRegisterClass &Test,
                    unsigned Reg,
                    const TargetRegisterClass *RC,
					const llvm::TargetRegisterInfo *RI) {

  if (RI->isPhysicalRegister(Reg))
    return Test.contains(Reg);
  else
    return &Test==RC || Test.hasSubClass(RC);
}

void LembergInstrInfo::copyPhysReg(MachineBasicBlock &MBB,
								   MachineBasicBlock::iterator I,
								   DebugLoc DL,
								   unsigned DestReg, unsigned SrcReg,
								   bool KillSrc) const {

	// General-purpose registers
	if (Lemberg::ARegClass.contains(DestReg) &&
		Lemberg::ARegClass.contains(SrcReg)) {
		BuildMI(MBB, I, DL, get(Lemberg::MOVEaa), DestReg)
			.addImm(-1).addReg(0)
			.addReg(SrcReg, getKillRegState(KillSrc));
		return;
	}

	// Floating-point registers
	if (Lemberg::FRegClass.contains(DestReg) &&
		Lemberg::FRegClass.contains(SrcReg)) {
		BuildMI(MBB, I, DL, get(Lemberg::FMOV), DestReg)
			.addImm(-1).addReg(0)
			.addReg(SrcReg, getKillRegState(KillSrc));
		return;
	}
	if (Lemberg::DRegClass.contains(DestReg) &&
		Lemberg::DRegClass.contains(SrcReg)) {
		BuildMI(MBB, I, DL, get(Lemberg::DMOV), DestReg)
			.addImm(-1).addReg(0)
			.addReg(SrcReg, getKillRegState(KillSrc));
		return;
	}
	if (Lemberg::ARegClass.contains(DestReg) &&
		Lemberg::FRegClass.contains(SrcReg)) {
		BuildMI(MBB, I, DL, get(Lemberg::MOVEfa), DestReg)
			.addImm(-1).addReg(0)
			.addReg(SrcReg, getKillRegState(KillSrc));
		return;
	}
	if (Lemberg::FRegClass.contains(DestReg) &&
		Lemberg::ARegClass.contains(SrcReg)) {
		BuildMI(MBB, I, DL, get(Lemberg::MOVEaf), DestReg)
			.addImm(-1).addReg(0)
			.addReg(SrcReg, getKillRegState(KillSrc));
		return;
	}

	// Condition flags
	if (Lemberg::CRegClass.contains(DestReg) &&
		Lemberg::CRegClass.contains(SrcReg)) {
		BuildMI(MBB, I, DL, get(Lemberg::MOVCC), DestReg)
			.addImm(-1).addReg(0)
			.addReg(SrcReg, getKillRegState(KillSrc));
		return;
	}

	// Other special registers
	if (Lemberg::ARegClass.contains(DestReg) &&
		Lemberg::XRegClass.contains(SrcReg)) {
		BuildMI(MBB, I, DL, get(Lemberg::MOVExa), DestReg)
			.addImm(-1).addReg(0)
			.addReg(SrcReg, getKillRegState(KillSrc));
		return;
	}

	if (Lemberg::XRegClass.contains(DestReg) &&
		Lemberg::ARegClass.contains(SrcReg)) {
		BuildMI(MBB, I, DL, get(Lemberg::MOVEax), DestReg)
			.addImm(-1).addReg(0)
			.addReg(SrcReg, getKillRegState(KillSrc));
		return;
	}

  llvm_unreachable("Cannot copy registers");
}

/// isStoreToStackSlot - If the specified machine instruction is a direct
/// store to a stack slot, return the virtual or physical register number of
/// the source reg along with the FrameIndex of the loaded stack slot.  If
/// not, return 0.  This predicate must return 0 if the instruction has
/// any side effects other than storing to the stack slot.
unsigned LembergInstrInfo::isStoreToStackSlot(const MachineInstr *MI,
											  int &FrameIndex) const {
  switch (MI->getOpcode()) {
  default: break;
  case Lemberg::STORE32s_pseudo:
  case Lemberg::STORE32s_xpseudo:
  // case Lemberg::STORE64s_xpseudo:
    if (MI->getOperand(2).isFI() &&
        MI->getOperand(1).isImm() &&
        MI->getOperand(1).getImm() == 0) {
      FrameIndex = MI->getOperand(2).getIndex();
      return MI->getOperand(0).getReg();
    }
    break;
  }
  return 0;
}

/// isLoadFromStackSlot - If the specified machine instruction is a direct
/// load from a stack slot, return the virtual or physical register number of
/// the destination along with the FrameIndex of the loaded stack slot.  If
/// not, return 0.  This predicate must return 0 if the instruction has
/// any side effects other than loading from the stack slot.
unsigned LembergInstrInfo::isLoadFromStackSlot(const MachineInstr *MI,
											   int &FrameIndex) const {
  switch (MI->getOpcode()) {
  default: break;
  case Lemberg::LOAD32s_pseudo:
  case Lemberg::LOAD32s_xpseudo:
  // case Lemberg::LOAD64s_xpseudo:
    if (MI->getOperand(2).isFI() &&
        MI->getOperand(1).isImm() &&
        MI->getOperand(1).getImm() == 0) {
      FrameIndex = MI->getOperand(2).getIndex();
      return MI->getOperand(0).getReg();
    }
    break;
  }
  return 0;
}

void
LembergInstrInfo::storeRegToStackSlot(MachineBasicBlock &MBB,
									  MachineBasicBlock::iterator I,
									  unsigned SrcReg,
									  bool isKill,
									  int FI,
									  const TargetRegisterClass *RC,
									  const llvm::TargetRegisterInfo *TRI) const {

  DebugLoc DL = I != MBB.end() ? I->getDebugLoc() : DebugLoc();

  bool inLoad = false;
  for (MachineBasicBlock::iterator MI = I, E = MBB.end(); MI != E; ++MI) {
	if (MI->readsRegister(Lemberg::R31)) {
	  inLoad = true;
	  break;
	} else if (MI->mayLoad()) {
	  break;
	}
  }

  // R31 must appear to remain unchanged
  if (inLoad) {
	unsigned EmergencyReg = RI.getEmergencyRegister();
	// __mem_emergency must be addressably with 11 bits
	BuildMI(MBB, I, DL, get(Lemberg::LOADsym11lo), EmergencyReg)
	  .addImm(-1).addReg(0)
	  .addExternalSymbol("__mem_emergency");
	BuildMI(MBB, I, DL, get(Lemberg::STORE32ap))
	  .addImm(-1).addReg(0)
	  .addReg(Lemberg::R31).addReg(EmergencyReg);
  }

  if (inClass(Lemberg::ARegClass, SrcReg, RC, TRI)) {
	// A normal register
	BuildMI(MBB, I, DL, get(Lemberg::STORE32s_pseudo))
	  .addReg(SrcReg, getKillRegState(isKill))
	  .addImm(0).addFrameIndex(FI);
  } else if (inClass(Lemberg::XRegClass, SrcReg, RC, TRI)) {
	// A special register
	BuildMI(MBB, I, DL, get(Lemberg::STORE32s_xpseudo))
	  .addReg(SrcReg, getKillRegState(isKill))
	  .addImm(0).addFrameIndex(FI);
  } else if (inClass(Lemberg::DRegClass, SrcReg, RC, TRI)) {
	// Split loads of doubles
	BuildMI(MBB, I, DL, get(Lemberg::STORE64s_xpseudo))
	  .addReg(SrcReg, getKillRegState(isKill))
	  .addImm(0).addFrameIndex(FI);
  } else {
	llvm_unreachable((std::string("Cannot store regclass to stack slot: ")+
					  RC->getName()).c_str());
  }

  if (inLoad) {
	BuildMI(MBB, I, DL, get(Lemberg::LOAD32d_ga))
	  .addExternalSymbol("__mem_emergency");
  }
}

void
LembergInstrInfo::loadRegFromStackSlot(MachineBasicBlock &MBB,
									   MachineBasicBlock::iterator I,
									   unsigned DestReg,
									   int FI,
									   const TargetRegisterClass *RC,
									   const llvm::TargetRegisterInfo *TRI) const {

  DebugLoc DL = I != MBB.end() ? I->getDebugLoc() : DebugLoc();

  bool inLoad = false;
  for (MachineBasicBlock::iterator MI = I, E = MBB.end(); MI != E; ++MI) {
	if (MI->readsRegister(Lemberg::R31)) {
	  inLoad = true;
	  break;
	} else if (MI->mayLoad()) {
	  break;
	}
  }

  // R31 must appear to remain unchanged
  if (inLoad) {
	unsigned EmergencyReg = RI.getEmergencyRegister();
	// __mem_emergency must be addressably with 11 bits
	BuildMI(MBB, I, DL, get(Lemberg::LOADsym11lo), EmergencyReg)
	  .addImm(-1).addReg(0)
	  .addExternalSymbol("__mem_emergency");
	BuildMI(MBB, I, DL, get(Lemberg::STORE32ap))
	  .addImm(-1).addReg(0)
	  .addReg(Lemberg::R31).addReg(EmergencyReg);
  }

  if (inClass(Lemberg::ARegClass, DestReg, RC, TRI)) {
	// A normal register
	BuildMI(MBB, I, DL, get(Lemberg::LOAD32s_pseudo), DestReg)
	  .addImm(0).addFrameIndex(FI);
  } else if (inClass(Lemberg::XRegClass, DestReg, RC, TRI)) {
	// A special register
	BuildMI(MBB, I, DL, get(Lemberg::LOAD32s_xpseudo), DestReg)
	  .addImm(0).addFrameIndex(FI);
  } else if (inClass(Lemberg::DRegClass, DestReg, RC, TRI)) {
	// Split loads of doubles
	BuildMI(MBB, I, DL, get(Lemberg::LOAD64s_xpseudo), DestReg)
	  .addImm(0).addFrameIndex(FI);
  } else {
	llvm_unreachable((std::string("Cannot load regclass from stack slot: ")+
					  RC->getName()).c_str());
  }

  if (inLoad) {
	BuildMI(MBB, I, DL, get(Lemberg::LOAD32d_ga))
	  .addExternalSymbol("__mem_emergency");
  }
}


void LembergInstrInfo::reMaterialize(MachineBasicBlock &MBB,
									 MachineBasicBlock::iterator I,
									 unsigned DestReg,
									 unsigned SubIdx,
									 const MachineInstr *Orig,
									 const TargetRegisterInfo &TRI) const {

  MachineInstr *MI = MBB.getParent()->CloneMachineInstr(Orig);
  MI->substituteRegister(MI->getOperand(0).getReg(), DestReg, SubIdx, TRI);

  // Make sure registers end up in the right register class
  if (MI->getOpcode() == Lemberg::LOADga
	  || MI->getOpcode() == Lemberg::LOADuimm19s2) {
	  assert((TRI.isVirtualRegister(DestReg) || Lemberg::AImmRegClass.contains(DestReg))
			 && "Cannot rematerialize this instruction to arbitrary physical register");
	  if (TRI.isVirtualRegister(DestReg)) {
		  MBB.getParent()->getRegInfo().setRegClass(DestReg, Lemberg::AImmRegisterClass);
	  }
  }

  MBB.insert(I, MI);
}

// Branch analysis.
bool
LembergInstrInfo::AnalyzeBranch(MachineBasicBlock &MBB,
								MachineBasicBlock *&TBB,
                                MachineBasicBlock *&FBB,
                                SmallVectorImpl<MachineOperand> &Cond,
                                bool AllowModify) const {

	// If the block has no terminators, it just falls into the block after it.
	MachineBasicBlock::iterator I = MBB.end();
	if (I == MBB.begin() || !isUnpredicatedTerminator(--I))
		return false;

	// Get the last instruction in the block.
	MachineInstr *LastInst = I;

	// If there is only one terminator instruction, process it.
	unsigned LastOpc = LastInst->getOpcode();
	if (I == MBB.begin() || !isUnpredicatedTerminator(--I)) {
		if (LastOpc == Lemberg::JUMP) {
			TBB = LastInst->getOperand(0).getMBB();
			return false;
		}
		if (LastOpc == Lemberg::JUMPtrue) {
			TBB = LastInst->getOperand(1).getMBB();
			Cond.push_back(LastInst->getOperand(0));
			Cond.push_back(MachineOperand::CreateImm(1));
			return false;
		}
		if (LastOpc == Lemberg::JUMPfalse) {
			TBB = LastInst->getOperand(1).getMBB();
			Cond.push_back(LastInst->getOperand(0));
			Cond.push_back(MachineOperand::CreateImm(0));
			return false;
		}
		if (LastOpc == Lemberg::JUMPpred) {
			TBB = LastInst->getOperand(2).getMBB();
			Cond.push_back(LastInst->getOperand(1));
			Cond.push_back(LastInst->getOperand(0));
			return false;
		}

		return true;  // Can't handle indirect branch.
	}

	// Get the instruction before it if it's a terminator.
	MachineInstr *SecondLastInst = I;
	
	// If there are three terminators, we don't know what sort of block this is.
	if (SecondLastInst && I != MBB.begin() &&
		isUnpredicatedTerminator(--I)) {
		return true;
	}
  
	// If the block ends with JUMP, JUMPtrue, JUMPfalse, or JUMPpred, handle it.
	if (LastInst->getOpcode() == Lemberg::JUMP) {
		if (SecondLastInst->getOpcode() == Lemberg::JUMPtrue) {
			TBB =  SecondLastInst->getOperand(1).getMBB();
			Cond.push_back(SecondLastInst->getOperand(0));
			Cond.push_back(MachineOperand::CreateImm(1));
			FBB = LastInst->getOperand(0).getMBB();
			return false;
		}
		if (SecondLastInst->getOpcode() == Lemberg::JUMPfalse) {
			TBB =  SecondLastInst->getOperand(1).getMBB();
			Cond.push_back(SecondLastInst->getOperand(0));
			Cond.push_back(MachineOperand::CreateImm(0));
			FBB = LastInst->getOperand(0).getMBB();
			return false;
		}
		if (SecondLastInst->getOpcode() == Lemberg::JUMPpred) {
			TBB = SecondLastInst->getOperand(2).getMBB();
			Cond.push_back(SecondLastInst->getOperand(1));
			Cond.push_back(SecondLastInst->getOperand(0));
			FBB = LastInst->getOperand(0).getMBB();
			return false;
		}
	}

	// Replace an unconditional jump with a fall-through after JUMPxxz
	// We pretend we cannot analyze them, because we cannot use xxz as predicates
	if ((SecondLastInst->getOpcode() == Lemberg::JUMPeqz ||
		 SecondLastInst->getOpcode() == Lemberg::JUMPnez ||
		 SecondLastInst->getOpcode() == Lemberg::JUMPltz ||
		 SecondLastInst->getOpcode() == Lemberg::JUMPgez ||
		 SecondLastInst->getOpcode() == Lemberg::JUMPgtz ||
		 SecondLastInst->getOpcode() == Lemberg::JUMPlez) &&
		LastInst->getOpcode() == Lemberg::JUMP &&
		AllowModify) {

		MachineBasicBlock *Target = LastInst->getOperand(0).getMBB();
		MachineBasicBlock *RevTarget = SecondLastInst->getOperand(1).getMBB();
		if (MBB.isLayoutSuccessor(Target)) {
			LastInst->eraseFromParent();
		} else if (MBB.isLayoutSuccessor(RevTarget)) {			
			unsigned ConvOpcode = 0;
			switch (SecondLastInst->getOpcode()) {
			case Lemberg::JUMPeqz:
			  ConvOpcode = Lemberg::JUMPnez;
			  break;
			case Lemberg::JUMPnez:
			  ConvOpcode = Lemberg::JUMPeqz;
			  break;
			case Lemberg::JUMPltz:
			  ConvOpcode = Lemberg::JUMPgez;
			  break;
			case Lemberg::JUMPgez:
			  ConvOpcode = Lemberg::JUMPltz;
			  break;
			case Lemberg::JUMPgtz:
			  ConvOpcode = Lemberg::JUMPlez;
			  break;
			case Lemberg::JUMPlez:
			  ConvOpcode = Lemberg::JUMPgtz;
			  break;
			}
 		    LastInst->eraseFromParent();
			SecondLastInst->setDesc(get(ConvOpcode));
			SecondLastInst->getOperand(1).setMBB(Target);
		}

		return true;
	}

	// If the block ends with two JUMPs, handle it. The second one is
	// not executed, so remove it.
	if (SecondLastInst->getOpcode() == Lemberg::JUMP && 
		LastInst->getOpcode() == Lemberg::JUMP) {
		TBB = SecondLastInst->getOperand(0).getMBB();
		I = LastInst;
		if (AllowModify)
			I->eraseFromParent();
		return false;
	}

	// Otherwise, can't handle this.
	return true;
}

unsigned LembergInstrInfo::RemoveBranch(MachineBasicBlock &MBB) const {
	
  MachineBasicBlock::iterator I = MBB.end();
  if (I == MBB.begin()) return 0;
  --I;
  if (I->getOpcode() != Lemberg::JUMP &&
	  I->getOpcode() != Lemberg::JUMPtrue &&
	  I->getOpcode() != Lemberg::JUMPfalse &&
	  I->getOpcode() != Lemberg::JUMPpred &&
	  I->getOpcode() != Lemberg::JUMPeqz &&
	  I->getOpcode() != Lemberg::JUMPnez &&
	  I->getOpcode() != Lemberg::JUMPltz &&
	  I->getOpcode() != Lemberg::JUMPgez &&
	  I->getOpcode() != Lemberg::JUMPgtz &&
	  I->getOpcode() != Lemberg::JUMPlez)
    return 0;

  // Remove the branch.
  I->eraseFromParent();

  I = MBB.end();

  if (I == MBB.begin()) return 1;
  --I;
  if (I->getOpcode() != Lemberg::JUMPtrue &&
	  I->getOpcode() != Lemberg::JUMPfalse &&
	  I->getOpcode() != Lemberg::JUMPpred &&
	  I->getOpcode() != Lemberg::JUMPeqz &&
	  I->getOpcode() != Lemberg::JUMPnez &&
	  I->getOpcode() != Lemberg::JUMPltz &&
	  I->getOpcode() != Lemberg::JUMPgez &&
	  I->getOpcode() != Lemberg::JUMPgtz &&
	  I->getOpcode() != Lemberg::JUMPlez)
    return 1;

  // Remove the branch.
  I->eraseFromParent();
  return 2;
}

unsigned LembergInstrInfo::InsertBranch(MachineBasicBlock &MBB,
										MachineBasicBlock *TBB, 
										MachineBasicBlock *FBB,
										const SmallVectorImpl<MachineOperand> &Cond,
										DebugLoc DL) const {

  // Shouldn't be a fall through.
  assert(TBB && "InsertBranch must not be told to insert a fallthrough");
  assert((Cond.size() == 2 || Cond.size() == 0) &&
         "Lemberg branch conditions can two components!");

  if (FBB == 0) { // One way branch.
    if (Cond.empty()) {
		// Unconditional branch?
		BuildMI(&MBB, DL, get(Lemberg::JUMP)).addMBB(TBB);
    } else {
		BuildMI(&MBB, DL, get(Lemberg::JUMPpred))
			.addImm(Cond[1].getImm()).addReg(Cond[0].getReg()).addMBB(TBB);
	}
    return 1;
  } else {
	  // Two-way conditional branch.
	  BuildMI(&MBB, DL, get(Lemberg::JUMPpred))
		  .addImm(Cond[1].getImm()).addReg(Cond[0].getReg()).addMBB(TBB);
	  BuildMI(&MBB, DL, get(Lemberg::JUMP)).addMBB(FBB);
	  return 2;
  }
}

bool LembergInstrInfo::
ReverseBranchCondition(SmallVectorImpl<MachineOperand> &Cond) const {
  assert(Cond.size() == 2 && "Invalid Lemberg branch condition!");

  unsigned Code = 0;
  switch (Cond[1].getImm()) {
  case 0: Code = 1; break;
  case 1: Code = 0; break;
  default: llvm_unreachable("Cannot reverse condition");
  }

  // Invert condition flag
  Cond[1].setImm(Code);
  return false;
}

bool LembergInstrInfo::
PredicateInstruction(MachineInstr *MI,
                     const SmallVectorImpl<MachineOperand> &Pred) const {

  if (Pred[1].getImm() == 0 || Pred[1].getImm() == 1) {
	  int PIdx = MI->findFirstPredOperandIdx();
	  if (PIdx != -1) {
		  MI->getOperand(PIdx).setImm(Pred[1].getImm());
		  MI->getOperand(PIdx+1).setReg(Pred[0].getReg());
		  return true;
	  }
  }
	  
  return false;
}

bool LembergInstrInfo::
SubsumesPredicate(const SmallVectorImpl<MachineOperand> &Pred1,
                  const SmallVectorImpl<MachineOperand> &Pred2) const {

  // empty predicate "subsumes" all others
  if (Pred1.size() == 0 && Pred2.size() == 2)
    return true;

  // something strange
  if (Pred1.size() != 2 || Pred2.size() != 2)
    return false;

  // equal predicates subsume each other
  return (Pred1[0].getReg() == Pred2[0].getReg())
	  && (Pred1[1].getImm() == Pred2[1].getImm());
}

bool LembergInstrInfo::
DefinesPredicate(MachineInstr *MI, std::vector<MachineOperand> &Pred) const {

  const MCInstrDesc &MID = MI->getDesc();

  bool Found = false;

  for (unsigned i = 0, e = MID.getNumDefs(); i != e; ++i) {
    const MachineOperand &MO = MI->getOperand(i);
    if (MO.isReg() && Lemberg::CRegClass.contains(MO.getReg())) {
      Pred.push_back(MO);
      Found = true;
    }
  }

  return Found;
}
