//===- LembergInstrInfo.h - Lemberg Instruction Information -----*- C++ -*-===//
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

#ifndef LEMBERGINSTRUCTIONINFO_H
#define LEMBERGINSTRUCTIONINFO_H

#include "Lemberg.h"
#include "LembergRegisterInfo.h"
#include "llvm/Target/TargetInstrInfo.h"

#define GET_INSTRINFO_HEADER
#include "LembergGenInstrInfo.inc"

namespace llvm {

  class LembergInstrInfo : public LembergGenInstrInfo {
    const LembergRegisterInfo RI;
    const LembergSubtarget& Subtarget;
  public:
    explicit LembergInstrInfo(LembergSubtarget &ST);

    /// getRegisterInfo - TargetInstrInfo is a superset of MRegister info.  As
    /// such, whenever a client has an instance of instruction info, it should
    /// always be able to get register info as well (through this method).
    virtual const LembergRegisterInfo &getRegisterInfo() const { return RI; }

	virtual bool AnalyzeBranch(MachineBasicBlock &MBB, MachineBasicBlock *&TBB,
                             MachineBasicBlock *&FBB,
                             SmallVectorImpl<MachineOperand> &Cond,
                             bool AllowModify) const;
	virtual unsigned RemoveBranch(MachineBasicBlock &MBB) const;
    virtual unsigned InsertBranch(MachineBasicBlock &MBB,
								  MachineBasicBlock *TBB,
								  MachineBasicBlock *FBB,
								  const SmallVectorImpl<MachineOperand> &Cond,
								  DebugLoc DL) const;
	virtual bool ReverseBranchCondition(SmallVectorImpl<MachineOperand> &Cond) const;

    virtual void copyPhysReg(MachineBasicBlock &MBB,
							 MachineBasicBlock::iterator I,
							 DebugLoc DL,
							 unsigned DestReg, unsigned SrcReg,
							 bool KillSrc) const;

    virtual unsigned isStoreToStackSlot(const MachineInstr *MI,
                                        int &FrameIndex) const;

    virtual unsigned isLoadFromStackSlot(const MachineInstr *MI,
                                         int &FrameIndex) const;

    virtual void storeRegToStackSlot(MachineBasicBlock &MBB,
                                     MachineBasicBlock::iterator MBBI,
                                     unsigned SrcReg, bool isKill,
                                     int FrameIndex,
                                     const TargetRegisterClass *RC,
									 const llvm::TargetRegisterInfo *RI) const;

    virtual void loadRegFromStackSlot(MachineBasicBlock &MBB,
                                      MachineBasicBlock::iterator MBBI,
                                      unsigned DestReg, int FrameIndex,
                                      const TargetRegisterClass *RC,
									  const llvm::TargetRegisterInfo *RI) const;

    virtual void reMaterialize(MachineBasicBlock &MBB,
							   MachineBasicBlock::iterator I,
							   unsigned DestReg,
							   unsigned SubIdx,
							   const MachineInstr *Orig,
							   const TargetRegisterInfo &TRI) const;

	virtual bool PredicateInstruction(MachineInstr *MI,
									  const SmallVectorImpl<MachineOperand> &Pred) const;

    virtual bool SubsumesPredicate(const SmallVectorImpl<MachineOperand> &Pred1,
								   const SmallVectorImpl<MachineOperand> &Pred2) const;

	virtual bool DefinesPredicate(MachineInstr *MI, std::vector<MachineOperand> &Pred) const;

    virtual bool isProfitableToIfCvt(MachineBasicBlock &MBB, unsigned NumCycles,
									 unsigned ExtraPredCycles,
									 const BranchProbability &Probability) const {
	  const MCInstrDesc &MID = prior(MBB.end())->getDesc();
	  if (MID.isCall() || MID.isReturn())
		  return false;
      return NumCycles <= 8;
    }

    virtual bool isProfitableToIfCvt(MachineBasicBlock &TMBB,
									 unsigned NumT, unsigned ExtraTCycles,
									 MachineBasicBlock &FMBB,
									 unsigned NumF, unsigned ExtraFCycles,
									 const BranchProbability &Probability) const {
	  const MCInstrDesc &TMID = prior(TMBB.end())->getDesc();
	  if (TMID.isCall() || TMID.isReturn())
		  return false;
	  const MCInstrDesc &FMID = prior(FMBB.end())->getDesc();
	  if (FMID.isCall() || FMID.isReturn())
		  return false;
      return (NumT + NumF) <= 16;
	}

	  virtual bool isProfitableToDupForIfCvt(MachineBasicBlock &MBB, unsigned NumInstrs,
											 const BranchProbability &Probability) const {
	  const MCInstrDesc &MID = prior(MBB.end())->getDesc();
	  if (MID.isCall() || MID.isReturn())
		  return false;
      return NumInstrs <= 4;
	}

	virtual ScheduleHazardRecognizer *
	CreateTargetPostRAHazardRecognizer(const InstrItineraryData *InstrItins,
									   const ScheduleDAG *DAG) const;
  };
} // end namespace llvm

#endif
