//=== Lemberg.h - Top-level interface for Lemberg backend -------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the entry points for global functions defined in the LLVM
// Lemberg back-end.
//
//===----------------------------------------------------------------------===//

#ifndef TARGET_LEMBERG_H
#define TARGET_LEMBERG_H

#include "llvm/Target/TargetMachine.h"

namespace llvm {

  class FunctionPass;
  class LembergTargetMachine;

  FunctionPass *createLembergISelDag(LembergTargetMachine &TM,
                                     CodeGenOpt::Level OptLevel);
  FunctionPass *createLembergClusterizerPass(LembergTargetMachine &TM,
											 CodeGenOpt::Level OptLevel);
  FunctionPass *createLembergPinnerPass(LembergTargetMachine &TM,
										CodeGenOpt::Level OptLevel);
  FunctionPass *createLembergSchedulerPass(LembergTargetMachine &TM,
										   CodeGenOpt::Level OptLevel);
  FunctionPass *createLembergDelaySlotFillerPass(LembergTargetMachine &tm,
												 CodeGenOpt::Level OptLevel);
  FunctionPass *createLembergNopCompressorPass(LembergTargetMachine &TM,
											   CodeGenOpt::Level OptLevel);
  FunctionPass *createLembergPostPinnerPass(LembergTargetMachine &TM,
											CodeGenOpt::Level OptLevel);

  extern Target TheLembergTarget;

} // end namespace llvm

// Defines symbolic names for Lemberg registers.  This defines a mapping from
// register name to register number.
#include "LembergGenRegisterNames.inc"

// Defines symbolic names for the Lemberg instructions.
#include "LembergGenInstrNames.inc"

#endif
