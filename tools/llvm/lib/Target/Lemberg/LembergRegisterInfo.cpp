//===- LembergRegisterInfo.cpp - Lemberg Register Information ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Lemberg implementation of the TargetRegisterInfo
// class.
//
//===----------------------------------------------------------------------===//

#include "Lemberg.h"
#include "LembergRegisterInfo.h"
#include "llvm/Function.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/Target/TargetFrameInfo.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Target/TargetInstrInfo.h"
#include "llvm/ADT/BitVector.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

LembergRegisterInfo::LembergRegisterInfo(LembergSubtarget &st, const TargetInstrInfo &tii)
	: LembergGenRegisterInfo(Lemberg::ADJCALLSTACKDOWN, Lemberg::ADJCALLSTACKUP),
    Subtarget(st),
	TII(tii) {
	LastLargeFrame = new FrameReuseInfo();
}

const unsigned*
LembergRegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
  using namespace Lemberg;
  static const unsigned CalleeSavedRegs[] = {
	  R10, R11, R12, R13,
	  R0_23, R1_23, R2_23, R3_23,
	  R0_24, R1_24, R2_24, R3_24,
	  R0_25, R1_25, R2_25, R3_25,
	  R0_26, R1_26, R2_26, R3_26,
	  R0_27, R1_27, R2_27, R3_27,
	  R0_28, R1_28, R2_28, R3_28,
	  R0_29, R1_29, R2_29, R3_29,
	  R0_30, R1_30, R2_30, R3_30,
	  F10, F11, F12, F13, F14, F15,
	  D5, D6, D7,
	  0 };
  return  CalleeSavedRegs;
}

const TargetRegisterClass* const *LembergRegisterInfo::
getCalleeSavedRegClasses(const MachineFunction *MF) const {
  using namespace Lemberg;
  static const TargetRegisterClass * const CalleeSavedRegClasses[] = {
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &ARegClass, &ARegClass, &ARegClass, &ARegClass,
	  &FRegClass, &FRegClass, &FRegClass, &FRegClass, &FRegClass, &FRegClass,
	  &DRegClass, &DRegClass, &DRegClass,
	  0 };
  return CalleeSavedRegClasses;
}

const TargetRegisterClass* LembergRegisterInfo::
getPointerRegClass(unsigned Kind) const {
	return Lemberg::ARegisterClass;
}

BitVector
LembergRegisterInfo::getReservedRegs(const MachineFunction &MF) const {
  using namespace Lemberg;
  BitVector Reserved(getNumRegs());
  Reserved.set(R14);
  Reserved.set(R15);
  Reserved.set(R0_31);
  Reserved.set(R1_31);
  Reserved.set(R2_31);
  Reserved.set(R3_31);
  Reserved.set(MEM);
  Reserved.set(MEMHU);
  Reserved.set(MEMHS);
  Reserved.set(MEMBU);
  Reserved.set(MEMBS);
  Reserved.set(RB);
  Reserved.set(RO);
  Reserved.set(BA);
  return Reserved;
}

// hasFP - Return true if the specified function should have a dedicated frame
// pointer register.  This is true if the function has variable sized allocas or
// if frame pointer elimination is disabled.
bool LembergRegisterInfo::hasFP(const MachineFunction &MF) const {
  const MachineFrameInfo *MFI = MF.getFrameInfo();
  return NoFramePointerElim || MFI->hasCalls() || MFI->hasVarSizedObjects();
}

bool LembergRegisterInfo::
requiresRegisterScavenging(const MachineFunction &MF) const {
  return true;
}

bool LembergRegisterInfo::
requiresFrameIndexScavenging(const MachineFunction &MF) const {
  return true;
}

bool LembergRegisterInfo::
saveScavengerRegister(MachineBasicBlock &MBB,
					  MachineBasicBlock::iterator I,
					  MachineBasicBlock::iterator &UseMI,
					  const TargetRegisterClass *RC, unsigned Reg) const {
  // Adjust UseMI so we do not restore scavenger register between a load and a ldx
  if ((UseMI->getDesc().getOpcode() == Lemberg::LDXa)
	  || (UseMI->getDesc().getOpcode() == Lemberg::LDXi)) {
	  while (!UseMI->getDesc().mayLoad()) {
		  --UseMI;
	  }
  }
  return false;
}

// just here to avoid misplacement of scavening slot
bool LembergRegisterInfo::
needsStackRealignment(const MachineFunction &MF) const {
  return true;
}

unsigned LembergRegisterInfo::
BuildLargeFrameOffset (MachineFunction &MF,
					   MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
					   long Offset) const {

	assert(isInt<22>(Offset) && "Offset too big for loading");

	// Look if we already built this offset before
	if (Offset == LastLargeFrame->Offset
		&& MBB.begin() == LastLargeFrame->Begin
		&& LastLargeFrame->Register != 0) {
		// Quit after a few instructions as not to confuse the register scavenger
		unsigned MaxLookup = 4;
		for (MachineBasicBlock::iterator II = MBBI, IE = MBB.begin(); MaxLookup-- > 0; --II) {
			// Do not search beyond definitions, kills, and calls
			if (II != LastLargeFrame->Killer
				&& (II->definesRegister(LastLargeFrame->Register)
					|| II->killsRegister(LastLargeFrame->Register)
					|| II->getDesc().isCall())) {
				break;
			}
			// We found the original user/killer
			if (II == LastLargeFrame->Killer) {
				// Remove kill information
				for (unsigned i = II->getNumOperands(); i > 0; --i) {
					MachineOperand &MO = II->getOperand(i-1);
					if (MO.isReg() && MO.getReg() == LastLargeFrame->Register) {
						MO.setIsKill(false);
					}
				}
				return LastLargeFrame->Register;
			}
			// Force exit at begin of basic block
			if (II == IE)
				break;
		}
	}

	// Build large frame offset from scratch
	DebugLoc DL = MBB.findDebugLoc(MBBI);
	unsigned ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);

	LastLargeFrame->Register = ScratchReg;
	LastLargeFrame->Offset = Offset;
	LastLargeFrame->Begin = MBB.begin();

	if (isUInt<5>(Offset >> 2) && ((Offset & 0x03) == 0)) {
		BuildMI(MBB, MBBI, DL, TII.get(Lemberg::S2ADDaia), ScratchReg)
			.addImm(-1).addReg(0)
			.addReg(getFrameRegister(MF))
			.addImm(Offset >> 2);		
	} else {
		if (isUInt<11>(Offset)) {
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset);
		} else if (isInt<11>(Offset)) {
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset);
		} else {
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset & 0x7ff);
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADimm11mi), ScratchReg)
				.addImm(-1).addReg(0)
				.addReg(ScratchReg)
				.addImm((Offset >> 11) & 0x7ff);
		}
		BuildMI(MBB, MBBI, DL, TII.get(Lemberg::ADDaaa), ScratchReg)
			.addImm(-1).addReg(0)
			.addReg(getFrameRegister(MF))
			.addReg(ScratchReg);
	}

	return ScratchReg;
}

void LembergRegisterInfo::
BuildStackLoad(MachineFunction &MF,
			   MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
			   unsigned DestReg, long Offset) const {

	assert(isInt<11>(Offset) && "Offset too big for stack load");

	DebugLoc DL = MBB.findDebugLoc(MBBI);
	BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOAD32spi))
		.addImm(-1).addReg(0)
		.addReg(getStackRegister()).addImm(Offset);
	BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LDXi), DestReg)
		.addImm(-1).addReg(0)
		.addReg(Lemberg::MEM).addImm(0);
}

void LembergRegisterInfo::
BuildStackStore(MachineFunction &MF,
				MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
				unsigned SrcReg, long Offset) const {

	assert(isUInt<5>(Offset >> 2) && (Offset & 0x03) == 0
		   && "Wrong offset for stack store");

	DebugLoc DL = MBB.findDebugLoc(MBBI);
	BuildMI(MBB, MBBI, DL, TII.get(Lemberg::STORE32spi))
		.addImm(-1).addReg(0)
		.addReg(SrcReg)
		.addReg(getStackRegister())
		.addImm(Offset >> 2);
}

void LembergRegisterInfo::
BuildStackWriteBack(MachineFunction &MF,
					MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
					long Offset) const {

	assert(isUInt<11>(Offset >> 2) && (Offset & 0x03) == 0
		   && "Wrong offset for stack write back");

	DebugLoc DL = MBB.findDebugLoc(MBBI);

	BuildMI(MBB, MBBI, DL, TII.get(Lemberg::WB))
		.addImm(-1).addReg(0)
		.addReg(getStackRegister())
		.addImm(Offset >> 2);
}

void LembergRegisterInfo::
BuildStackAdd (MachineFunction &MF,
			   MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
			   long Offset) const {

	DebugLoc DL = MBB.findDebugLoc(MBBI);

	bool isAdd = Offset >= 0;
	Offset = Offset < 0 ? -Offset : Offset;

	if (isAdd && (Offset & 0x03) == 0 && isUInt<5>(Offset >> 2)) {
		BuildMI(MBB, MBBI, DL,
				TII.get(Lemberg::S2ADDaia), getStackRegister())
			.addImm(-1).addReg(0)
			.addReg(getStackRegister())
			.addImm(Offset >> 2);
	} else {
		unsigned ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);

		if (isUInt<11>(Offset)){
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset);
		} else {
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset & 0x7ff);
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADimm11mi), ScratchReg)
				.addImm(-1).addReg(0)
				.addReg(ScratchReg)
				.addImm((Offset >> 11) & 0x7ff);
		}
		BuildMI(MBB, MBBI, DL,
				TII.get(isAdd ? Lemberg::ADDaaa : Lemberg::SUBaaa), getStackRegister())
			.addImm(-1).addReg(0)
			.addReg(getStackRegister())
			.addReg(ScratchReg, RegState::Kill);
	}
}

static int getModOffset(int Offset, bool isLoad, int storeIdxShift) {
	if (isLoad) {
		return ((unsigned)Offset % (1 << 11)) - (1 << 10);
	} else {
		return ((unsigned)Offset % (1 << (5+storeIdxShift)));
	}
}

void LembergRegisterInfo::
eliminateCallFramePseudoInstr(MachineFunction &MF, MachineBasicBlock &MBB,
							  MachineBasicBlock::iterator I) const {
	MachineInstr &MI = *I;
	long Size = MI.getOperand(0).getImm();
	Size = MI.getOpcode() == Lemberg::ADJCALLSTACKDOWN ? -Size : Size;
	if (Size != 0) {
		BuildStackAdd(MF, MBB, I, Size);
	}
	MBB.erase(I);
}

void
LembergRegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II,
										 int SPAdj, RegScavenger *RS) const {
  MachineInstr &MI = *II;
  MachineBasicBlock &MBB = *MI.getParent();
  MachineFunction &MF = *MBB.getParent();
  DebugLoc DL = MI.getDebugLoc();

  unsigned FIPos;
  for (FIPos=0; !MI.getOperand(FIPos).isFI(); ++FIPos) {
    assert(FIPos < MI.getNumOperands() &&
           "Instr doesn't have FrameIndex operand!");
  }

  int FrameIndex = MI.getOperand(FIPos).getIndex();

  assert(FIPos-1 < MI.getNumOperands() && MI.getOperand(FIPos-1).isImm());

  int Offset = MF.getFrameInfo()->getObjectOffset(FrameIndex)
	  + MF.getFrameInfo()->getStackSize()
	  + MI.getOperand(FIPos-1).getImm();

  assert(isInt<22>(Offset) && "Stack frame offset too big");

  MI.RemoveOperand(FIPos);
  MI.RemoveOperand(FIPos-1);

  unsigned Opcode = MI.getOpcode();

  // instructions that are already expanded
  if (Opcode == Lemberg::LOAD32s_match
	  || Opcode == Lemberg::STORE32s_match
	  || Opcode == Lemberg::STORE32s_match_imm
	  || Opcode == Lemberg::STORE16s_match
	  || Opcode == Lemberg::STORE16s_match_imm
	  || Opcode == Lemberg::STORE8s_match
	  || Opcode == Lemberg::STORE8s_match_imm
	  || Opcode == Lemberg::LEAs) {

	  bool isLoad = Opcode == Lemberg::LOAD32s_match;
	  unsigned storeIdxShift = 0;

	  unsigned StOp;
	  switch (Opcode) {
	  case Lemberg::STORE32s_match:
		  StOp = Lemberg::STORE32spi;
		  storeIdxShift = 2;
		  break;
	  case Lemberg::STORE32s_match_imm:
		  StOp = Lemberg::STORE32spi_imm;
		  storeIdxShift = 2;
		  break;
	  case Lemberg::STORE16s_match:
		  StOp = Lemberg::STORE16spi;
		  storeIdxShift = 1;
		  break;
	  case Lemberg::STORE16s_match_imm:
		  StOp = Lemberg::STORE16spi_imm;
		  storeIdxShift = 1;
		  break;
	  case Lemberg::STORE8s_match:
		  StOp = Lemberg::STORE8spi;
		  storeIdxShift = 0;
		  break;
	  case Lemberg::STORE8s_match_imm:
		  StOp = Lemberg::STORE8spi_imm;
		  storeIdxShift = 0;
		  break;
	  default:
		  assert((Opcode == Lemberg::LOAD32s_match || Opcode == Lemberg::LEAs)
				 && "Cannot find opcode for operation");
	  }

	  assert(((storeIdxShift == 0)
			  || (storeIdxShift == 1 && (Offset & 0x01) == 0)
			  || (storeIdxShift == 2 && (Offset & 0x03) == 0))
			 && "Offset for store not correctly aligned");

  	  if (isUInt<5>(Offset >> storeIdxShift) || (isLoad && isInt<11>(Offset))) {
		  switch (Opcode) {
		  case Lemberg::LOAD32s_match:
			  MI.setDesc(TII.get(Lemberg::LOAD32spi));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MachineOperand::CreateReg(getFrameRegister(MF), false));
			  MI.addOperand(MachineOperand::CreateImm(Offset));
			  break;
		  case Lemberg::STORE32s_match:
		  case Lemberg::STORE32s_match_imm:
		  case Lemberg::STORE16s_match:
		  case Lemberg::STORE16s_match_imm:
		  case Lemberg::STORE8s_match:
		  case Lemberg::STORE8s_match_imm:
			  MI.setDesc(TII.get(StOp));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MI.getOperand(0));
			  MI.RemoveOperand(0);
			  MI.addOperand(MachineOperand::CreateReg(getFrameRegister(MF), false));
			  MI.addOperand(MachineOperand::CreateImm(Offset >> storeIdxShift));
			  break;
		  case Lemberg::LEAs:
			  MI.setDesc(TII.get(Lemberg::ADDaia));
			  MI.addOperand(MachineOperand::CreateReg(getFrameRegister(MF), false));
			  MI.addOperand(MachineOperand::CreateImm(Offset));
			  break;
		  default:
			  llvm_unreachable("Cannot eliminate frame index");
			  break;
		  }
  		  return;
  	  }
  	  if (isInt<22>(Offset)) {

		  int ModOffset = getModOffset(Offset, isLoad, storeIdxShift);
		  int BaseOffset = Offset - ModOffset;

		  unsigned ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseOffset);

		  switch (Opcode) {
		  case Lemberg::LOAD32s_match:
			  MI.setDesc(TII.get(Lemberg::LOAD32spi));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MachineOperand::CreateReg(ScratchReg, false, false, true));
			  MI.addOperand(MachineOperand::CreateImm(ModOffset));
			  LastLargeFrame->Killer = *II;
			  break;
		  case Lemberg::STORE32s_match:
		  case Lemberg::STORE32s_match_imm:
		  case Lemberg::STORE16s_match:
		  case Lemberg::STORE16s_match_imm:
		  case Lemberg::STORE8s_match:
		  case Lemberg::STORE8s_match_imm:
			  MI.setDesc(TII.get(StOp));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MI.getOperand(0));
			  MI.RemoveOperand(0);
			  MI.addOperand(MachineOperand::CreateReg(ScratchReg, false, false, true));
			  MI.addOperand(MachineOperand::CreateImm(ModOffset >> storeIdxShift));
			  LastLargeFrame->Killer = *II;
			  break;
		  case Lemberg::LEAs:
			  MI.setDesc(TII.get(Lemberg::ADDaia));
			  MI.addOperand(MachineOperand::CreateReg(ScratchReg, false, false, true));
			  MI.addOperand(MachineOperand::CreateImm(ModOffset));
			  LastLargeFrame->Killer = *II;
			  break;
		  default:
			  llvm_unreachable("Cannot eliminate frame index");
			  break;
		  }
		  return;
   	  }
  }

  // pseudos need to be expanded
  if (Opcode == Lemberg::LOAD32s_pseudo
	  || Opcode == Lemberg::LOAD32s_xpseudo
	  || Opcode == Lemberg::STORE32s_pseudo
	  || Opcode == Lemberg::STORE32s_pseudo_imm
	  || Opcode == Lemberg::STORE32s_xpseudo) {

	  bool isLoad = (Opcode == Lemberg::LOAD32s_pseudo
					 || Opcode == Lemberg::LOAD32s_xpseudo);

	  const TargetRegisterClass *RegClass = getMinimalPhysRegClass(MI.getOperand(0).getReg());
	  bool isFloat = RegClass == Lemberg::FRegisterClass;
	  
	  assert((Offset & 0x03) == 0 && "Offset for store not correctly aligned");
	  
  	  if (isUInt<5>(Offset >> 2) || (isLoad && isInt<11>(Offset))) {

		  unsigned CopyReg;

		  switch (Opcode) {
		  case Lemberg::LOAD32s_pseudo:
			  BuildMI(MBB, II, DL, TII.get(Lemberg::LOAD32spi))
				  .addImm(-1).addReg(0)
				  .addReg(getFrameRegister(MF))
				  .addImm(Offset);
			  MI.setDesc(TII.get(Lemberg::LDXi));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MachineOperand::CreateReg(Lemberg::MEM, false));
			  MI.addOperand(MachineOperand::CreateImm(0));
			  break;
		  case Lemberg::LOAD32s_xpseudo:
			  CopyReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);
			  LastLargeFrame->Register = 0;
			  BuildMI(MBB, II, DL, TII.get(Lemberg::LOAD32spi))
				  .addImm(-1).addReg(0)
				  .addReg(getFrameRegister(MF))
				  .addImm(Offset);
			  BuildMI(MBB, II, DL, TII.get(Lemberg::LDXi), CopyReg)
				  .addImm(-1).addReg(0)
				  .addReg(Lemberg::MEM).addImm(0);
			  MI.setDesc(TII.get(isFloat ? Lemberg::MOVEaf : Lemberg::MOVEax));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MachineOperand::CreateReg(CopyReg, false, false, true));
			  break;
		  case Lemberg::STORE32s_pseudo:
		  case Lemberg::STORE32s_pseudo_imm:
			  MI.setDesc(TII.get(Opcode == Lemberg::STORE32s_pseudo ?
								 Lemberg::STORE32spi : Lemberg::STORE32spi_imm));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MI.getOperand(0));
			  MI.RemoveOperand(0);
			  MI.addOperand(MachineOperand::CreateReg(getFrameRegister(MF), false));
			  MI.addOperand(MachineOperand::CreateImm(Offset >> 2));
			  break;
		  case Lemberg::STORE32s_xpseudo:
			  CopyReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);
			  LastLargeFrame->Register = 0;
			  BuildMI(MBB, II, DL, TII.get(isFloat ? Lemberg::MOVEfa : Lemberg::MOVExa), CopyReg)
				  .addImm(-1).addReg(0)
				  .addOperand(MI.getOperand(0));
			  MI.setDesc(TII.get(Lemberg::STORE32spi));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MachineOperand::CreateReg(CopyReg, false, false, true));
			  MI.RemoveOperand(0);
			  MI.addOperand(MachineOperand::CreateReg(getFrameRegister(MF), false));
			  MI.addOperand(MachineOperand::CreateImm(Offset >> 2));
			  break;
		  default:
			  llvm_unreachable("Cannot eliminate frame index");
			  break;
		  }
  		  return;
  	  }
  	  if (isInt<22>(Offset)) {

		  int ModOffset = getModOffset(Offset, isLoad, 2);
		  int BaseOffset = Offset - ModOffset;

		  unsigned ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseOffset);
		  unsigned CopyReg = getEmergencyRegister();

		  const TargetRegisterClass *RegClass = getMinimalPhysRegClass(MI.getOperand(0).getReg());
		  bool isFloat = RegClass == Lemberg::FRegisterClass;

		  switch (Opcode) {
		  case Lemberg::LOAD32s_pseudo:
			  BuildMI(MBB, II, DL, TII.get(Lemberg::LOAD32spi))
				  .addImm(-1).addReg(0)
				  .addReg(ScratchReg, RegState::Kill)
				  .addImm(ModOffset);
			  MI.setDesc(TII.get(Lemberg::LDXi));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MachineOperand::CreateReg(Lemberg::MEM, false));
			  MI.addOperand(MachineOperand::CreateImm(0));
			  LastLargeFrame->Killer = prior(II);
			  break;
		  case Lemberg::LOAD32s_xpseudo:
			  BuildMI(MBB, II, DL, TII.get(Lemberg::LOAD32spi))
				  .addImm(-1).addReg(0)
				  .addReg(ScratchReg, RegState::Kill)
				  .addImm(ModOffset);
			  BuildMI(MBB, II, DL, TII.get(Lemberg::LDXi), CopyReg)
				  .addImm(-1).addReg(0)
				  .addReg(Lemberg::MEM).addImm(0);
			  MI.setDesc(TII.get(isFloat ? Lemberg::MOVEaf : Lemberg::MOVEax));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MachineOperand::CreateReg(CopyReg, false, false, true));
			  LastLargeFrame->Killer = prior(II, 2);
			  break;
		  case Lemberg::STORE32s_pseudo:
		  case Lemberg::STORE32s_pseudo_imm:
			  MI.setDesc(TII.get(Opcode == Lemberg::STORE32s_pseudo ?
								 Lemberg::STORE32spi : Lemberg::STORE32spi_imm));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MI.getOperand(0));
			  MI.RemoveOperand(0);
			  MI.addOperand(MachineOperand::CreateReg(ScratchReg, false, false, true));
			  MI.addOperand(MachineOperand::CreateImm(ModOffset >> 2));
			  LastLargeFrame->Killer = *II;
			  break;
		  case Lemberg::STORE32s_xpseudo:
			  BuildMI(MBB, II, DL, TII.get(isFloat ? Lemberg::MOVEfa : Lemberg::MOVExa), CopyReg)
			   	  .addImm(-1).addReg(0)
				  .addOperand(MI.getOperand(0));
			  MI.setDesc(TII.get(Lemberg::STORE32spi));
			  MI.addOperand(MachineOperand::CreateImm(-1));
			  MI.addOperand(MachineOperand::CreateReg(0, false));
			  MI.addOperand(MachineOperand::CreateReg(CopyReg, false, false, true));
			  MI.RemoveOperand(0);
			  MI.addOperand(MachineOperand::CreateReg(ScratchReg, false, false, true));
			  MI.addOperand(MachineOperand::CreateImm(ModOffset >> 2));
			  LastLargeFrame->Killer = *II;
			  break;
		  default:
			  MI.dump();
			  llvm_unreachable("Cannot eliminate frame index");
			  break;
		  }
 		  return;
	  }
  }

  if (Opcode == Lemberg::LOAD64s_xpseudo
	  || Opcode == Lemberg::STORE64s_xpseudo) {

	  bool isLoad = Opcode == Lemberg::LOAD64s_xpseudo;

	  int ModLoOffset = getModOffset(Offset, isLoad, 2);
	  int BaseLoOffset = Offset - ModLoOffset;
	  int ModHiOffset = getModOffset(Offset+4, isLoad, 2);
	  int BaseHiOffset = Offset - ModHiOffset;

	  unsigned ScratchReg;
	  unsigned CopyReg = getEmergencyRegister();

	  unsigned Reg = MI.getOperand(0).getReg();

	  switch (Opcode) {
	  case Lemberg::LOAD64s_xpseudo:
		  ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseLoOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::LOAD32spi))
			  .addImm(-1).addReg(0)
			  .addReg(ScratchReg, RegState::Kill)
			  .addImm(ModLoOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::LDXi), CopyReg)
			  .addImm(-1).addReg(0)
			  .addReg(Lemberg::MEM).addImm(0);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::MOVEaf))
			  .addReg(Reg, RegState::Define, Lemberg::sub_even)
			  .addImm(-1).addReg(0)
			  .addReg(CopyReg);
		  LastLargeFrame->Killer = prior(II, 3);

		  ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseHiOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::LOAD32spi))
			  .addImm(-1).addReg(0)
			  .addReg(ScratchReg, RegState::Kill)
			  .addImm(ModHiOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::LDXi), CopyReg)
			  .addImm(-1).addReg(0)
			  .addReg(Lemberg::MEM).addImm(0);
		  MI.setDesc(TII.get(Lemberg::MOVEaf));
		  MI.RemoveOperand(0);
		  MI.addOperand(MachineOperand::CreateReg(Reg, true, false, false,
												  false, false, false,
												  Lemberg::sub_odd));
		  MI.addOperand(MachineOperand::CreateImm(-1));
		  MI.addOperand(MachineOperand::CreateReg(0, false));
		  MI.addOperand(MachineOperand::CreateReg(CopyReg, false, false, true));
		  LastLargeFrame->Killer = prior(II, 2);
		  break;
	  case Lemberg::STORE64s_xpseudo:
		  ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseLoOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::MOVEfa), CopyReg)
			  .addImm(-1).addReg(0)
			  .addReg(Reg, 0, Lemberg::sub_even);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::STORE32spi))
			  .addImm(-1).addReg(0)
			  .addReg(CopyReg)
			  .addReg(ScratchReg, RegState::Kill)
			  .addImm(ModLoOffset >> 2);
		  LastLargeFrame->Killer = *II;

		  ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseHiOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::MOVEfa), CopyReg)
			  .addImm(-1).addReg(0)
			  .addReg(Reg, 0, Lemberg::sub_odd);
		  MI.setDesc(TII.get(Lemberg::STORE32spi));
		  MI.RemoveOperand(0);
		  MI.addOperand(MachineOperand::CreateImm(-1));
		  MI.addOperand(MachineOperand::CreateReg(0, false));
		  MI.addOperand(MachineOperand::CreateReg(CopyReg, false, false, true));
		  MI.addOperand(MachineOperand::CreateReg(ScratchReg, false, false, true));
		  MI.addOperand(MachineOperand::CreateImm(ModHiOffset >> 2));
		  LastLargeFrame->Killer = *II;
		  break;
	  default:
		  MI.dump();
		  llvm_unreachable("Cannot eliminate frame index");
		  break;
	  }

	  return;
  }

  llvm_unreachable("Do not know how to eliminate frame index");
  return;
}

void LembergRegisterInfo::
processFunctionBeforeCalleeSavedScan(MachineFunction &MF,
                                     RegScavenger *RS) const {
  MachineFrameInfo *MFI = MF.getFrameInfo();
  const TargetRegisterClass *RC = Lemberg::GRegisterClass;
  if (requiresRegisterScavenging(MF)) {
    // Reserve a slot close to SP/FP
    RS->setScavengingFrameIndex(MFI->CreateStackObject(RC->getSize(),
													   RC->getAlignment(),
													   false));
  }
}

void LembergRegisterInfo::
processFunctionBeforeFrameFinalized(MachineFunction &MF) const {
}

// Emit a prologue that sets up a stack frame
void LembergRegisterInfo::emitPrologue(MachineFunction &MF) const {

  MachineBasicBlock &MBB = MF.front();
  MachineFrameInfo *MFI = MF.getFrameInfo();
  MachineBasicBlock::iterator MBBI = MBB.begin();
  DebugLoc DL = MBB.findDebugLoc(MBBI);

  long NumBytes = MFI->getStackSize();

  if (hasFP(MF)) {
	  // Space for frame pointer
	  NumBytes += 4;
  }
  if (MFI->hasCalls()) {
	  // Space for return addresses
	  NumBytes += 8;
  }

  MFI->setStackSize(NumBytes);

  // Take into account room for varargs passed in registers
  // TODO: get rid of magic number here
  if (MF.getFunction()->isVarArg()) {
	  NumBytes += 16;
  }

  if (NumBytes != 0) {
	  // Update stack pointer for current frame
	  BuildStackWriteBack(MF, MBB, MBBI, NumBytes);
	  BuildStackAdd(MF, MBB, MBBI, -NumBytes);
  }

  if (hasFP(MF)) {
	  // Save old frame pointer
	  BuildStackStore(MF, MBB, MBBI, getFrameRegister(MF), 0);
  }

  // Save the return address only if the function isnt a leaf one.
  if (MFI->hasCalls()) {
	  // Save $ra
	  unsigned TmpReg = getEmergencyRegister();
	  BuildMI(MBB, MBBI, DL, TII.get(Lemberg::MOVExa), TmpReg)
		  .addImm(-1).addReg(0)
		  .addReg(getRARegister());
	  BuildStackStore(MF, MBB, MBBI, TmpReg, hasFP(MF) ? 4 : 0);
	  // Save $ro
	  TmpReg = getEmergencyRegister();
	  BuildMI(MBB, MBBI, DL, TII.get(Lemberg::MOVExa), TmpReg)
		  .addImm(-1).addReg(0)
		  .addReg(getRAOffRegister());
	  BuildStackStore(MF, MBB, MBBI, TmpReg, hasFP(MF) ? 8 : 4);
  }

  if (hasFP(MF)) {
	  // Copy stack pointer to frame pointer
	  BuildMI(MBB, MBBI, DL, TII.get(Lemberg::MOVEaa), getFrameRegister(MF))
	  	  .addImm(-1).addReg(0)
		  .addReg(getStackRegister());
  }
}

// Emit an epilogue that tears down a stack frame
void LembergRegisterInfo::emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const {

  MachineBasicBlock::iterator MBBI = prior(MBB.end());
  MachineFrameInfo *MFI = MF.getFrameInfo();
  DebugLoc DL = MBB.findDebugLoc(MBBI);

  long NumBytes = MFI->getStackSize();

  // Take into account room for varargs passed in registers
  // TODO: get rid of magic number here
  if (MF.getFunction()->isVarArg()) {
	  NumBytes += 16;
  }

  if (hasFP(MF)) {
	  // Copy frame pointer to stack pointer
	  BuildMI(MBB, MBBI, DL, TII.get(Lemberg::MOVEaa), getStackRegister())
	  	  .addImm(-1).addReg(0)
		  .addReg(getFrameRegister(MF));
  }

  // Restore the return address only if the function isnt a leaf one.
  if (MFI->hasCalls()) { 
	  // Restore $ro
	  unsigned TmpReg = getEmergencyRegister();
	  BuildStackLoad(MF, MBB, MBBI, TmpReg, hasFP(MF) ? 8 : 4);
	  BuildMI(MBB, MBBI, DL, TII.get(Lemberg::MOVEax), getRAOffRegister())
		  .addImm(-1).addReg(0)
		  .addReg(TmpReg);
	  // Restore $ra
	  TmpReg = getEmergencyRegister();
	  BuildStackLoad(MF, MBB, MBBI, TmpReg, hasFP(MF) ? 4 : 0);
	  BuildMI(MBB, MBBI, DL, TII.get(Lemberg::MOVEax), getRARegister())
		  .addImm(-1).addReg(0)
		  .addReg(TmpReg);
  }

  if (hasFP(MF)) {
	  // Restore old frame pointer
	  BuildStackLoad(MF, MBB, MBBI, getFrameRegister(MF), 0);
  }

  if (NumBytes != 0) {
	  // Restore stack pointer
	  BuildStackAdd(MF, MBB, MBBI, NumBytes);
  }
}

unsigned LembergRegisterInfo::getFrameRegister(const MachineFunction &MF) const {
	return hasFP(MF) ? Lemberg::R14 : Lemberg::R15;
}

unsigned LembergRegisterInfo::getStackRegister() const {
	return Lemberg::R15;
}

unsigned LembergRegisterInfo::getRARegister() const {
	return Lemberg::RB;
}

unsigned LembergRegisterInfo::getRAOffRegister() const {
	return Lemberg::RO;
}

unsigned LembergRegisterInfo::getEmergencyRegister() const {
	static const unsigned EmergencyRegs [] =
		{ Lemberg::R0_31, Lemberg::R1_31, Lemberg::R2_31, Lemberg::R3_31 };

	static int EmergencyCounter = 0;
	if (++EmergencyCounter >= 4) {
		EmergencyCounter = 0;
	}

	return EmergencyRegs[EmergencyCounter];
}

int LembergRegisterInfo::getDwarfRegNum(unsigned RegNum, bool isEH) const {
  return LembergGenRegisterInfo::getDwarfRegNumFull(RegNum, 0);
}

#include "LembergGenRegisterInfo.inc"
