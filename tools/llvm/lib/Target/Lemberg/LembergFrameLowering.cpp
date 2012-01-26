//===- LembergFrameLowering.cpp - Lemberg Frame Information -------*- C++ -*-==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the Lemberg implementation of TargetFrameLowering class.
//
//===----------------------------------------------------------------------===//

#include "LembergFrameLowering.h"
#include "LembergTargetMachine.h"
#include "LembergInstrInfo.h"
#include "LembergMachineFunctionInfo.h"
#include "llvm/Function.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/Target/TargetData.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

// hasFP - Return true if the specified function should have a dedicated frame
// pointer register.  This is true if the function has variable sized allocas or
// if frame pointer elimination is disabled.
bool LembergFrameLowering::hasFP(const MachineFunction &MF) const {
  const MachineFrameInfo *MFI = MF.getFrameInfo();
  return DisableFramePointerElim(MF) || MFI->hasVarSizedObjects() || MFI->isFrameAddressTaken();
}

void LembergFrameLowering::
BuildStackAdd (MachineFunction &MF,
			   MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
			   long Offset) const {

	assert(isInt<22>(Offset) && (Offset & 0x03) == 0 && "Wrong offset for stack add");

	const LembergInstrInfo *TII = TM.getInstrInfo();
	const LembergRegisterInfo *TRI = TM.getRegisterInfo();

	DebugLoc DL = MBB.findDebugLoc(MBBI);

	bool isAdd = Offset >= 0;
	Offset = Offset < 0 ? -Offset : Offset;

	if (isUInt<5>(Offset)) {
		BuildMI(MBB, MBBI, DL,
				TII->get(isAdd ? Lemberg::ADDaia : Lemberg::SUBaia), TRI->getStackRegister())
			.addImm(-1).addReg(0)
			.addReg(TRI->getStackRegister())
			.addImm(Offset);
	} else if (isAdd && (Offset & 0x03) == 0 && isUInt<5>(Offset >> 2)) {
		BuildMI(MBB, MBBI, DL,
				TII->get(Lemberg::S2ADDaia), TRI->getStackRegister())
			.addImm(-1).addReg(0)
			.addReg(TRI->getStackRegister())
			.addImm(Offset >> 2);
	} else {
		unsigned ScratchReg = 0;

		if (isUInt<11>(Offset)){
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset);
		} else if (isUInt<19>(Offset >> 2) && ((Offset & 0x03) == 0)) {
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GImmRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm19s2), ScratchReg)
				.addImm(Offset);
		} else {
			// Does this really happen?
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset & 0x7ff);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADimm11mi), ScratchReg)
				.addImm(-1).addReg(0)
				.addReg(ScratchReg)
				.addImm((Offset >> 11) & 0x7ff);
		}
		BuildMI(MBB, MBBI, DL,
				TII->get(isAdd ? Lemberg::ADDaaa : Lemberg::SUBaaa), TRI->getStackRegister())
			.addImm(-1).addReg(0)
			.addReg(TRI->getStackRegister())
			.addReg(ScratchReg, RegState::Kill);
	}
}

void LembergFrameLowering::
BuildStackLoad(MachineFunction &MF,
			   MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
			   unsigned DestReg, long Offset) const {

	assert(isInt<22>(Offset) && (Offset & 0x03) == 0 && "Wrong offset for stack load");

	const LembergInstrInfo *TII = TM.getInstrInfo();
	const LembergRegisterInfo *TRI = TM.getRegisterInfo();

	DebugLoc DL = MBB.findDebugLoc(MBBI);

	if (isInt<11>(Offset)){
		BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOAD32spi))
			.addImm(-1).addReg(0)
			.addReg(TRI->getStackRegister()).addImm(Offset);
	} else {
		unsigned ScratchReg = 0;

		if (isUInt<11>(Offset)){
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset);
		} else if (isUInt<19>(Offset >> 2) && ((Offset & 0x03) == 0)) {
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GImmRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm19s2), ScratchReg)
				.addImm(Offset);
		} else {
			// Does this really happen?
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset & 0x7ff);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADimm11mi), ScratchReg)
				.addImm(-1).addReg(0)
				.addReg(ScratchReg)
				.addImm((Offset >> 11) & 0x7ff);
		}
		BuildMI(MBB, MBBI, DL,
				TII->get(Lemberg::ADDaaa), TRI->getStackRegister())
			.addImm(-1).addReg(0)
			.addReg(TRI->getStackRegister())
			.addReg(ScratchReg);

		BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOAD32sp))
			.addImm(-1).addReg(0)
			.addReg(ScratchReg, RegState::Kill);
	}

	BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LDXi), DestReg)
		.addImm(-1).addReg(0)
		.addReg(Lemberg::MEM).addImm(0);
}

void LembergFrameLowering::
BuildStackStore(MachineFunction &MF,
				MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
				unsigned SrcReg, long Offset) const {

	assert(isInt<22>(Offset) && (Offset & 0x03) == 0 && "Wrong offset for stack store");

	const LembergInstrInfo *TII = TM.getInstrInfo();
	const LembergRegisterInfo *TRI = TM.getRegisterInfo();

	DebugLoc DL = MBB.findDebugLoc(MBBI);

	if (isUInt<5>(Offset >> 2)) {
		BuildMI(MBB, MBBI, DL, TII->get(Lemberg::STORE32spi))
			.addImm(-1).addReg(0)
			.addReg(SrcReg)
			.addReg(TRI->getStackRegister())
			.addImm(Offset >> 2);
	} else {
		unsigned ScratchReg = 0;

		if (isUInt<11>(Offset)){
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset);
		} else if (isUInt<19>(Offset >> 2) && ((Offset & 0x03) == 0)) {
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GImmRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm19s2), ScratchReg)
				.addImm(Offset);
		} else {
			// Does this really happen?
			ScratchReg = MF.getRegInfo().createVirtualRegister(Lemberg::GRegisterClass);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADuimm11), ScratchReg)
				.addImm(-1).addReg(0)
				.addImm(Offset & 0x7ff);
			BuildMI(MBB, MBBI, DL, TII->get(Lemberg::LOADimm11mi), ScratchReg)
				.addImm(-1).addReg(0)
				.addReg(ScratchReg)
				.addImm((Offset >> 11) & 0x7ff);
		}
		BuildMI(MBB, MBBI, DL,
				TII->get(Lemberg::ADDaaa), TRI->getStackRegister())
			.addImm(-1).addReg(0)
			.addReg(TRI->getStackRegister())
			.addReg(ScratchReg);

		BuildMI(MBB, MBBI, DL, TII->get(Lemberg::STORE32sp))
			.addImm(-1).addReg(0)
			.addReg(SrcReg)
			.addReg(ScratchReg, RegState::Kill);
	}
}

void LembergFrameLowering::
BuildStackWriteBack(MachineFunction &MF,
					MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
					long Offset) const {

	assert((Offset & 0x03) == 0 && "Wrong offset for stack write back");

	const LembergInstrInfo *TII = TM.getInstrInfo();
	const LembergRegisterInfo *TRI = TM.getRegisterInfo();

	DebugLoc DL = MBB.findDebugLoc(MBBI);
	BuildMI(MBB, MBBI, DL, TII->get(Lemberg::WB))
		.addImm(-1).addReg(0)
		.addReg(TRI->getStackRegister())
		.addImm(isUInt<11>(Offset >> 2) ? Offset >> 2 : 0);
}

// Emit a prologue that sets up a stack frame
void LembergFrameLowering::emitPrologue(MachineFunction &MF) const {

  const LembergInstrInfo *TII = TM.getInstrInfo();
  const LembergRegisterInfo *TRI = TM.getRegisterInfo();

  MachineBasicBlock &MBB = MF.front();
  MachineFrameInfo *MFI = MF.getFrameInfo();
  MachineBasicBlock::iterator MBBI = MBB.begin();
  DebugLoc DL = MBB.findDebugLoc(MBBI);

  long NumBytes = MFI->getStackSize();
  long CallFrameBytes = 0;

  if (hasFP(MF)) {
	  // Space for frame pointer
	  NumBytes += 4;
  }
  // Round up to next doubleword boundary
  NumBytes = (NumBytes + 7) & ~7;

  MFI->setStackSize(NumBytes);

  // Take into account room for varargs passed in registers
  NumBytes += 16;

  // Take into account space for call frames
  if (!hasFP(MF)) {
	  CallFrameBytes = MFI->getMaxCallFrameSize();
	  NumBytes += CallFrameBytes;
  }

  if (NumBytes != 0) {
	  // Update stack pointer for current frame
	  BuildStackWriteBack(MF, MBB, MBBI, NumBytes);
	  BuildStackAdd(MF, MBB, MBBI, -NumBytes);
  }

  if (hasFP(MF)) {
	  // Save old frame pointer
	  BuildStackStore(MF, MBB, MBBI, TRI->getFrameRegister(MF), CallFrameBytes);
  }

  if (hasFP(MF)) {
	  // Copy stack pointer to frame pointer
	  BuildMI(MBB, MBBI, DL, TII->get(Lemberg::MOVEaa), TRI->getFrameRegister(MF))
	  	  .addImm(-1).addReg(0)
		  .addReg(TRI->getStackRegister());
  }
}

// Emit an epilogue that tears down a stack frame
void LembergFrameLowering::emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const {

  const LembergInstrInfo *TII = TM.getInstrInfo();
  const LembergRegisterInfo *TRI = TM.getRegisterInfo();

  MachineBasicBlock::iterator MBBI = prior(MBB.end());
  MachineFrameInfo *MFI = MF.getFrameInfo();
  DebugLoc DL = MBB.findDebugLoc(MBBI);

  long NumBytes = MFI->getStackSize();
  long CallFrameBytes = 0;

  // Take into account room for varargs passed in registers
  NumBytes += 16;

  // Take into account space for call frames
  if (!hasFP(MF)) {
	  CallFrameBytes = MFI->getMaxCallFrameSize();
	  NumBytes += CallFrameBytes;
  }

  if (hasFP(MF)) {
	  // Copy frame pointer to stack pointer
	  BuildMI(MBB, MBBI, DL, TII->get(Lemberg::MOVEaa), TRI->getStackRegister())
	  	  .addImm(-1).addReg(0)
		  .addReg(TRI->getFrameRegister(MF));
  }

  if (hasFP(MF)) {
	  // Restore old frame pointer
	  BuildStackLoad(MF, MBB, MBBI, TRI->getFrameRegister(MF), CallFrameBytes);
  }

  if (NumBytes != 0) {
	  // Restore stack pointer
	  BuildStackAdd(MF, MBB, MBBI, NumBytes);
  }
}

void LembergFrameLowering::
processFunctionBeforeCalleeSavedScan(MachineFunction &MF,
                                     RegScavenger *RS) const {
  MachineFrameInfo *MFI = MF.getFrameInfo();
  const TargetRegisterClass *RC = Lemberg::GRegisterClass;

  // Reserve a slot close to SP/FP
  RS->setScavengingFrameIndex(MFI->CreateStackObject(RC->getSize(),
													 RC->getAlignment(),
													 false));
}

