//===-- LembergTargetMachine.cpp - Define TargetMachine for Lemberg -------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//===----------------------------------------------------------------------===//

#include "LembergTargetMachine.h"
#include "Lemberg.h"
#include "MCTargetDesc/LembergMCAsmInfo.h"
#include "llvm/PassManager.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

extern "C" void LLVMInitializeLembergTarget() {
  RegisterTargetMachine<LembergTargetMachine> X(TheLembergTarget);
  RegisterMCAsmInfo<LembergMCAsmInfo> Y(TheLembergTarget);
}

LembergTargetMachine::LembergTargetMachine(const Target &T, StringRef TT,
                                       StringRef CPU, StringRef FS,
                                       const TargetOptions &Options,
                                       Reloc::Model RM, CodeModel::Model CM,
                                       CodeGenOpt::Level OL)
  : LLVMTargetMachine(T, TT, CPU, FS, Options, RM, CM, OL),
    DataLayout("e-p32:32:32-i1:8:32-i8:8:32-i16:16:32-i32:32:32-i64:32:64-f32:32:32-f64:32:64-a0:0:64-n32"),
    Subtarget(TT, CPU, FS),
    TLInfo(*this),
    TSInfo(*this),
    InstrInfo(Subtarget),
	FrameLowering(*this, Subtarget) {
}

namespace {
/// Lemberg Code Generator Pass Configuration Options.
class LembergPassConfig : public TargetPassConfig {
public:
  LembergPassConfig(LembergTargetMachine *TM, PassManagerBase &PM)
    : TargetPassConfig(TM, PM) {}

  LembergTargetMachine &getLembergTargetMachine() const {
    return getTM<LembergTargetMachine>();
  }

  const LembergSubtarget &getLembergSubtarget() const {
    return *getLembergTargetMachine().getSubtargetImpl();
  }

  virtual bool addInstSelector();
  virtual bool addPreRegAlloc();
  virtual bool addPreEmitPass();
};
} // namespace

TargetPassConfig *LembergTargetMachine::createPassConfig(PassManagerBase &PM) {
  return new LembergPassConfig(this, PM);
}

bool LembergPassConfig::addInstSelector() {
  PM->add(createLembergISelDag(getLembergTargetMachine(), getOptLevel()));
  return false;
}

bool LembergPassConfig::addPreRegAlloc() {
  PM->add(createLembergClusterizerPass(getLembergTargetMachine(), getOptLevel()));
  return true;
}

bool LembergPassConfig::addPreEmitPass() {
  if (getOptLevel() != CodeGenOpt::None) {
    addPass(IfConverterID);
  }
  LembergTargetMachine &TM = getLembergTargetMachine();
  PM->add(createLembergBranchSelectorPass(TM, getOptLevel()));
  PM->add(createLembergPinnerPass(TM, getOptLevel()));
  PM->add(createLembergSchedulerPass(TM, getOptLevel()));
  PM->add(createLembergDelaySlotFillerPass(TM, getOptLevel()));
  if (getOptLevel() != CodeGenOpt::None) {
	  // PM->add(createLembergNopCompressorPass(TM, getOptLevel()));
  }
  PM->add(createLembergPostPinnerPass(TM, getOptLevel()));
  return true;
}
