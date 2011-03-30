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
#include "LembergMCAsmInfo.h"
#include "llvm/PassManager.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/Target/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

extern "C" void LLVMInitializeLembergTarget() {
  RegisterTargetMachine<LembergTargetMachine> X(TheLembergTarget);
  RegisterAsmInfo<LembergMCAsmInfo> Y(TheLembergTarget);
}

LembergTargetMachine::LembergTargetMachine(const Target &T,
										   const std::string &TT,
										   const std::string &FS)
  : LLVMTargetMachine(T, TT),
    DataLayout("e-p:32:32:32-i8:8:32-i16:16:32-i64:32-f64:32-n32"),
    Subtarget(TT, FS),
    TLInfo(*this),
    TSInfo(*this),
    InstrInfo(Subtarget),
    FrameInfo(TargetFrameInfo::StackGrowsDown, 4, 0) {
}

void LembergTargetMachine::setCodeModelForJIT() {
	// use default code model
}

void LembergTargetMachine::setCodeModelForStatic() {
	// use default code model
}

bool LembergTargetMachine::addInstSelector(PassManagerBase &PM,
										   CodeGenOpt::Level OptLevel) {
  PM.add(createLembergISelDag(*this, OptLevel));
  return false;
}

bool LembergTargetMachine::addPreRegAlloc(PassManagerBase &PM,
										  CodeGenOpt::Level OptLevel) {
  PM.add(createLembergClusterizerPass(*this, OptLevel));
  return true;
}

bool LembergTargetMachine::addPreEmitPass(PassManagerBase &PM,
                                          CodeGenOpt::Level OptLevel) {
  if (OptLevel != CodeGenOpt::None) {
    PM.add(createIfConverterPass());
  }
  PM.add(createLembergPinnerPass(*this, OptLevel));
  PM.add(createLembergSchedulerPass(*this, OptLevel));
  PM.add(createLembergDelaySlotFillerPass(*this, OptLevel));
  PM.add(createLembergPostPinnerPass(*this, OptLevel));
  return true;
}
