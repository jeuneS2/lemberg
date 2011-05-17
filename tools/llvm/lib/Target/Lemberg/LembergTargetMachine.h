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
#include "llvm/Target/TargetFrameInfo.h"
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
    LembergTargetMachine(const Target &T, const std::string &TT,
						 const std::string &FS);

    virtual void setCodeModelForJIT();
    virtual void setCodeModelForStatic();

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

	virtual bool addInstSelector(PassManagerBase &PM,
                                 CodeGenOpt::Level OptLevel);
	virtual bool addPreRegAlloc(PassManagerBase &PM,
                                CodeGenOpt::Level OptLevel);
	virtual bool addPreEmitPass(PassManagerBase &PM,
								CodeGenOpt::Level OptLevel);
   };

} // end namespace llvm

#endif
