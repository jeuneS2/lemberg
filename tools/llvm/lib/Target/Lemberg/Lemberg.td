//===- Lemberg.td - Describe the Lemberg Target Machine ---------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
// This is the top level entry point for the Lemberg target.
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Target-independent interfaces
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Register File, Calling Conv, Instruction Descriptions
//===----------------------------------------------------------------------===//

include "LembergRegisterInfo.td"
include "LembergSchedule.td"
include "LembergInstrInfo.td"
include "LembergCallingConv.td"

def LembergInstrInfo : InstrInfo { }

//===----------------------------------------------------------------------===//
// Lemberg Subtarget features
//===----------------------------------------------------------------------===//

def DUMMY_FEATURE : SubtargetFeature<"dummy", "dummy_feature", "true",
									 "Dummy subtarget feature">;

//===----------------------------------------------------------------------===//
// Lemberg processors supported.
//===----------------------------------------------------------------------===//

class Proc<string Name, list<SubtargetFeature> Features>
 : Processor<Name, LembergItineraries, Features>;

def : Proc<"lemberg", []>;

def Lemberg : Target {
  let InstructionSet = LembergInstrInfo;
}
