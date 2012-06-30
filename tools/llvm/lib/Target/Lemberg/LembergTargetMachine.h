//===-- LembergTargetMachine.h - TargetMachine for Lemberg ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the Lemberg specific subclass of TargetMachine.
//
//===----------------------------------------------------------------------===//

#ifndef LEMBERGTARGETMACHINE_H
#define LEMBERGTARGETMACHINE_H

#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetData.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "LembergInstrInfo.h"
#include "LembergISelLowering.h"
#include "LembergFrameLowering.h"
#include "LembergSelectionDAGInfo.h"
#include "LembergSubtarget.h"

namespace llvm {

  class LembergTargetMachine : public LLVMTargetMachine {

    const TargetData DataLayout;
	LembergSubtarget Subtarget;
	LembergTargetLowering TLInfo;
	LembergSelectionDAGInfo TSInfo;
	LembergInstrInfo InstrInfo;
    LembergFrameLowering FrameLowering;

  public:
    LembergTargetMachine(const Target &T, StringRef TT,
						 StringRef CPU, StringRef FS,
						 const TargetOptions &Options,
						 Reloc::Model RM, CodeModel::Model CM,
						 CodeGenOpt::Level OL);

	virtual const LembergInstrInfo *getInstrInfo() const { return &InstrInfo; }
    virtual const LembergSubtarget *getSubtargetImpl() const {
      return &Subtarget;
    }
    virtual const InstrItineraryData *getInstrItineraryData() const {
      return &Subtarget.getInstrItins();
	}
    virtual const LembergRegisterInfo *getRegisterInfo() const {
      return &InstrInfo.getRegisterInfo();
    }
	virtual const TargetFrameLowering  *getFrameLowering() const {
      return &FrameLowering;
    }
    virtual const LembergTargetLowering* getTargetLowering() const { return &TLInfo; }
	virtual const LembergSelectionDAGInfo* getSelectionDAGInfo() const { return &TSInfo; }
	virtual const TargetData *getTargetData() const { return &DataLayout; }

	// Pass Pipeline Configuration
	virtual TargetPassConfig *createPassConfig(PassManagerBase &PM);
   };

} // end namespace llvm

#endif
