//===- LembergRegisterInfo.h - Lemberg Register Information -----*- C++ -*-===//
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

#ifndef LEMBERGREGISTERINFO_H
#define LEMBERGREGISTERINFO_H

#include "llvm/Target/TargetRegisterInfo.h"
#include "LembergGenRegisterInfo.h.inc"

namespace llvm {

  class LembergSubtarget;
  class TargetInstrInfo;

  struct FrameReuseInfo {
    unsigned Register;
    long Offset;		 
    MachineBasicBlock::iterator Begin;
    MachineBasicBlock::iterator Killer;
  };

  struct LembergRegisterInfo : public LembergGenRegisterInfo {
    LembergSubtarget &Subtarget;
    const TargetInstrInfo &TII;
	FrameReuseInfo *LastLargeFrame;

	LembergRegisterInfo(LembergSubtarget &st, const TargetInstrInfo &tii);

    /// Code Generation virtual methods...
    const unsigned *getCalleeSavedRegs(const MachineFunction *MF = 0) const;

    const TargetRegisterClass* const* getCalleeSavedRegClasses(const MachineFunction *MF = 0) const;

    const TargetRegisterClass *getPointerRegClass(unsigned int) const;

    BitVector getReservedRegs(const MachineFunction &MF) const;

	bool hasFP(const MachineFunction &MF) const;

    bool requiresRegisterScavenging(const MachineFunction &MF) const;
    bool requiresFrameIndexScavenging(const MachineFunction &MF) const;
    bool needsStackRealignment(const MachineFunction &MF) const;
    bool saveScavengerRegister(MachineBasicBlock &MBB,
							   MachineBasicBlock::iterator I,
							   MachineBasicBlock::iterator &UseMI,
							   const TargetRegisterClass *RC, unsigned Reg) const;

	void eliminateCallFramePseudoInstr(MachineFunction &MF,
									   MachineBasicBlock &MBB,
									   MachineBasicBlock::iterator I) const;

    void eliminateFrameIndex(MachineBasicBlock::iterator II,
							 int SPAdj, RegScavenger *RS = NULL) const;

    void processFunctionBeforeCalleeSavedScan(MachineFunction &MF,
                                              RegScavenger *RS) const;

    void processFunctionBeforeFrameFinalized(MachineFunction &MF) const;

	void emitPrologue(MachineFunction &MF) const;
    void emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const;

	unsigned getFrameRegister(const MachineFunction &MF) const;
    unsigned getStackRegister() const;
    unsigned getRARegister() const;
    unsigned getRAOffRegister() const;
    unsigned getEmergencyRegister() const;

    int getDwarfRegNum(unsigned RegNum, bool isEH) const;

  private:
	 unsigned BuildLargeFrameOffset(MachineFunction &MF,
									MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
									long Offset) const;
     void BuildStackLoad(MachineFunction &MF,
						 MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
						 unsigned DestReg, long Offset) const;
     void BuildStackStore(MachineFunction &MF,
						  MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
						  unsigned DestReg, long Offset) const;
     void BuildStackWriteBack(MachineFunction &MF,
							  MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
							  long Offset) const;
     void BuildStackAdd(MachineFunction &MF,
						MachineBasicBlock &MBB, MachineBasicBlock::iterator &MBBI,
						long Offset) const;
  };

} // end namespace llvm

#endif
