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

#define GET_REGINFO_HEADER
#include "LembergGenRegisterInfo.inc"

namespace llvm {

  class LembergSubtarget;
  class TargetInstrInfo;

  struct FrameReuseInfo {
    unsigned Register;
    long Offset;		 
    MachineBasicBlock::iterator Begin;
    MachineBasicBlock::iterator Killer;
    MachineBasicBlock::iterator Boundary;
  };

  struct LembergRegisterInfo : public LembergGenRegisterInfo {
    LembergSubtarget &Subtarget;
    const TargetInstrInfo &TII;
	FrameReuseInfo *LastLargeFrame;

	LembergRegisterInfo(LembergSubtarget &st, const TargetInstrInfo &tii);

    /// Code Generation virtual methods...
    const uint16_t *getCalleeSavedRegs(const MachineFunction *MF = 0) const;

    BitVector getReservedRegs(const MachineFunction &MF) const;

    bool requiresRegisterScavenging(const MachineFunction &MF) const { return true; }
    bool requiresFrameIndexScavenging(const MachineFunction &MF) const { return true; }

    bool saveScavengerRegister(MachineBasicBlock &MBB,
							   MachineBasicBlock::iterator I,
							   MachineBasicBlock::iterator &UseMI,
							   const TargetRegisterClass *RC, unsigned Reg) const;

	void eliminateCallFramePseudoInstr(MachineFunction &MF,
									   MachineBasicBlock &MBB,
									   MachineBasicBlock::iterator I) const;

    void eliminateFrameIndex(MachineBasicBlock::iterator II,
							 int SPAdj, RegScavenger *RS = NULL) const;

 	unsigned getFrameRegister(const MachineFunction &MF) const;
    unsigned getStackRegister() const;
    unsigned getRARegister() const;
    unsigned getRAOffRegister() const;
    unsigned getEmergencyRegister() const;

	unsigned getRegPressureLimit(const TargetRegisterClass *RC,
								 MachineFunction &MF) const;

	const TargetRegisterClass * getMatchingSuperRegClass(const TargetRegisterClass *A,
														 const TargetRegisterClass *B,
														 unsigned SubIdx) const;

	int getCluster(MachineInstr &MI) const;

  private:
	 unsigned BuildLargeFrameOffset(MachineFunction &MF,
									MachineBasicBlock &MBB,
									MachineBasicBlock::iterator &MBBI,
									long Offset, RegScavenger *RS) const;
  };

} // end namespace llvm

#endif
