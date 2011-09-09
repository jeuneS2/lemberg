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
#include "LembergFrameLowering.h"
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
	  R10, R11, R12, R13, R14,
	  R0_23, R1_23, R2_23, R3_23,
	  R0_24, R1_24, R2_24, R3_24,
	  R0_25, R1_25, R2_25, R3_25,
	  R0_26, R1_26, R2_26, R3_26,
	  R0_27, R1_27, R2_27, R3_27,
	  R0_28, R1_28, R2_28, R3_28,
	  R0_29, R1_29, R2_29, R3_29,
	  R0_30, R1_30, R2_30, R3_30,
	  F10, F11, F12, F13, F14, F15,
	  0 };
  return  CalleeSavedRegs;
}

BitVector
LembergRegisterInfo::getReservedRegs(const MachineFunction &MF) const {
  using namespace Lemberg;
  BitVector Reserved(getNumRegs());

  const TargetFrameLowering *TFI = MF.getTarget().getFrameLowering();
  if (TFI->hasFP(MF))
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

unsigned LembergRegisterInfo::
BuildLargeFrameOffset (MachineFunction &MF,
					   MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
					   long Offset) const {

	assert(isInt<22>(Offset) && "Offset too big for loading");

	// Check if we already built this offset before
	if (Offset == LastLargeFrame->Offset
		&& MBB.begin() == LastLargeFrame->Begin
		&& LastLargeFrame->Register != 0) {

		// Check if we are back-to-back with previously built offset
		if (LastLargeFrame->Boundary == prior(MBBI)) {
			// Remove kill information
			for (unsigned i = LastLargeFrame->Killer->getNumOperands(); i > 0; --i) {
				MachineOperand &MO = LastLargeFrame->Killer->getOperand(i-1);
				if (MO.isReg() && MO.getReg() == LastLargeFrame->Register) {
					MO.setIsKill(false);
				}
			}
			return LastLargeFrame->Register;
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
		unsigned ImmReg = getEmergencyRegister();
		if (isUInt<11>(Offset)) {
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADuimm11), ImmReg)
				.addImm(-1).addReg(0)
				.addImm(Offset);
		} else if (isInt<11>(Offset)) {
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADimm11), ImmReg)
				.addImm(-1).addReg(0)
				.addImm(Offset);
		} else {
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADuimm11), ImmReg)
				.addImm(-1).addReg(0)
				.addImm(Offset & 0x7ff);
			BuildMI(MBB, MBBI, DL, TII.get(Lemberg::LOADimm11mi), ImmReg)
				.addImm(-1).addReg(0)
				.addReg(ImmReg)
				.addImm((Offset >> 11) & 0x7ff);
		}
		BuildMI(MBB, MBBI, DL, TII.get(Lemberg::ADDaaa), ScratchReg)
			.addImm(-1).addReg(0)
			.addReg(getFrameRegister(MF))
			.addReg(ImmReg);
	}

	return ScratchReg;
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
  const LembergFrameLowering *TFI =
	  (const LembergFrameLowering *)MF.getTarget().getFrameLowering();

  MachineInstr &MI = *I;
  long Size = MI.getOperand(0).getImm();

  Size = MI.getOpcode() == Lemberg::ADJCALLSTACKDOWN ? -Size : Size;

  if (!TFI->hasReservedCallFrame(MF) && Size != 0) {
	  TFI->BuildStackAdd(MF, MBB, I, Size);
  }

  MBB.erase(I);
}

void LembergRegisterInfo::
eliminateFrameIndex(MachineBasicBlock::iterator II,
					int SPAdj, RegScavenger *RS) const {
  assert(SPAdj == 0 && "Unexpected");

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

  // Adjust offsets for incoming arguments
  if (FrameIndex < 0) {
	  const TargetFrameLowering *TFI = MF.getTarget().getFrameLowering();
	  if (!TFI->hasFP(MF)) {
		  Offset += MF.getFrameInfo()->getMaxCallFrameSize();
	  }
  }

  assert(isInt<22>(Offset) && "Stack frame offset too big");

  MI.RemoveOperand(FIPos);
  MI.RemoveOperand(FIPos-1);

  unsigned Opcode = MI.getOpcode();

  // Instructions that are already expanded
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

	  unsigned StOp = Lemberg::STORE32spi;
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
			  LastLargeFrame->Boundary = next(II);
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
			  LastLargeFrame->Boundary = *II;
			  break;
		  case Lemberg::LEAs:
			  MI.setDesc(TII.get(Lemberg::ADDaia));
			  MI.addOperand(MachineOperand::CreateReg(ScratchReg, false, false, true));
			  MI.addOperand(MachineOperand::CreateImm(ModOffset));
			  LastLargeFrame->Killer = *II;
			  LastLargeFrame->Boundary = *II;
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
			  LastLargeFrame->Boundary = *II;
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
			  LastLargeFrame->Boundary = *II;
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
			  LastLargeFrame->Boundary = *II;
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
			  LastLargeFrame->Boundary = *II;
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
	  int BaseHiOffset = Offset+4 - ModHiOffset;

	  unsigned ScratchReg;
	  unsigned CopyRegA = getEmergencyRegister();
	  unsigned CopyRegB = getEmergencyRegister();

	  unsigned Reg = MI.getOperand(0).getReg();

	  switch (Opcode) {
	  case Lemberg::LOAD64s_xpseudo:
		  ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseLoOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::LOAD32spi))
			  .addImm(-1).addReg(0)
			  .addReg(ScratchReg, RegState::Kill)
			  .addImm(ModLoOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::LDXi), CopyRegA)
			  .addImm(-1).addReg(0)
			  .addReg(Lemberg::MEM).addImm(0);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::MOVEaf))
			  .addReg(Reg, RegState::Define, Lemberg::sub_even)
			  .addImm(-1).addReg(0)
			  .addReg(CopyRegA, RegState::Kill);
		  LastLargeFrame->Killer = prior(II, 3);
		  LastLargeFrame->Boundary = *II;

		  ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseHiOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::LOAD32spi))
			  .addImm(-1).addReg(0)
			  .addReg(ScratchReg, RegState::Kill)
			  .addImm(ModHiOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::LDXi), CopyRegB)
			  .addImm(-1).addReg(0)
			  .addReg(Lemberg::MEM).addImm(0);
		  MI.setDesc(TII.get(Lemberg::MOVEaf));
		  MI.RemoveOperand(0);
		  MI.addOperand(MachineOperand::CreateReg(Reg, true, false, false,
												  false, false, false,
												  Lemberg::sub_odd));
		  MI.addOperand(MachineOperand::CreateImm(-1));
		  MI.addOperand(MachineOperand::CreateReg(0, false));
		  MI.addOperand(MachineOperand::CreateReg(CopyRegB, false, false, true));
		  LastLargeFrame->Killer = prior(II, 2);
		  LastLargeFrame->Boundary = *II;
		  break;
	  case Lemberg::STORE64s_xpseudo:
		  ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseLoOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::MOVEfa), CopyRegA)
			  .addImm(-1).addReg(0)
			  .addReg(Reg, 0, Lemberg::sub_even);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::STORE32spi))
			  .addImm(-1).addReg(0)
			  .addReg(CopyRegA, RegState::Kill)
			  .addReg(ScratchReg, RegState::Kill)
			  .addImm(ModLoOffset >> 2);
		  LastLargeFrame->Killer = prior(II, 1);
		  LastLargeFrame->Boundary = *II;

		  ScratchReg = BuildLargeFrameOffset(MF, MBB, II, BaseHiOffset);
		  BuildMI(MBB, II, DL, TII.get(Lemberg::MOVEfa), CopyRegB)
			  .addImm(-1).addReg(0)
			  .addReg(Reg, 0, Lemberg::sub_odd);
		  MI.setDesc(TII.get(Lemberg::STORE32spi));
		  MI.RemoveOperand(0);
		  MI.addOperand(MachineOperand::CreateImm(-1));
		  MI.addOperand(MachineOperand::CreateReg(0, false));
		  MI.addOperand(MachineOperand::CreateReg(CopyRegB, false, false, true));
		  MI.addOperand(MachineOperand::CreateReg(ScratchReg, false, false, true));
		  MI.addOperand(MachineOperand::CreateImm(ModHiOffset >> 2));
		  LastLargeFrame->Killer = *II;
		  LastLargeFrame->Boundary = *II;
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

unsigned LembergRegisterInfo::getFrameRegister(const MachineFunction &MF) const {
	const TargetFrameLowering *TFI = MF.getTarget().getFrameLowering();
	return TFI->hasFP(MF) ? Lemberg::R14 : Lemberg::R15;
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

unsigned LembergRegisterInfo::getRegPressureLimit(const TargetRegisterClass *RC,
												  MachineFunction &MF) const {
	switch (RC->getID()) {
	default:
		return 0;

	case Lemberg::L0RegClassID:
	case Lemberg::L1RegClassID:
	case Lemberg::L2RegClassID:
	case Lemberg::L3RegClassID:
		return 15;

	case Lemberg::LG0RegClassID:
	case Lemberg::LG1RegClassID:
	case Lemberg::LG2RegClassID:
	case Lemberg::LG3RegClassID:
		return MF.getTarget().getFrameLowering()->hasFP(MF) ? 29 : 30;
	case Lemberg::GRegClassID:
		return MF.getTarget().getFrameLowering()->hasFP(MF) ? 14 : 15;

	case Lemberg::LG0ImmRegClassID:
	case Lemberg::LG1ImmRegClassID:
	case Lemberg::LG2ImmRegClassID:
	case Lemberg::LG3ImmRegClassID:
		return 8;
	case Lemberg::GImmRegClassID:
		return 4;

	case Lemberg::M0RegClassID:
	case Lemberg::M1RegClassID:
	case Lemberg::M2RegClassID:
	case Lemberg::M3RegClassID:
		return 1;
	case Lemberg::MulRegClassID:
		return 4;

	case Lemberg::CRegClassID:
		return 3;
	case Lemberg::FRegClassID:
		return 16;
	case Lemberg::DRegClassID:
		return 8;
	}
}

int LembergRegisterInfo::getDwarfRegNum(unsigned RegNum, bool isEH) const {
  return LembergGenRegisterInfo::getDwarfRegNumFull(RegNum, 0);
}

const TargetRegisterClass *
LembergRegisterInfo::getMatchingSuperRegClass(const TargetRegisterClass *A,
											  const TargetRegisterClass *B,
											  unsigned SubIdx) const {
	if ((SubIdx == Lemberg::sub_even || SubIdx == Lemberg::sub_odd)
		&& A == &Lemberg::DRegClass
		&& B == &Lemberg::FRegClass) {
		return A;
	}
	return 0;
}

#include "LembergGenRegisterInfo.inc"
