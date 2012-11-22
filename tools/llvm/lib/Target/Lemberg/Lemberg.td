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

def FeatureSingle : SubtargetFeature<"fpu-single", "HasSingleFPU", "true",
									 "Enable single-precision FPU">;
def FeatureDouble : SubtargetFeature<"fpu-double", "HasDoubleFPU", "true",
									 "Enable double-precision FPU",
									 [FeatureSingle]>;

def Feature1Way : SubtargetFeature<"1way", "Clusters", "1",
								   "Enable 1 cluster">;
def Feature2Way : SubtargetFeature<"2way", "Clusters", "2",
								   "Enable 2 clusters">;
def Feature3Way : SubtargetFeature<"3way", "Clusters", "3",
								   "Enable 3 clusters">;
def Feature4Way : SubtargetFeature<"4way", "Clusters", "4",
								   "Enable 4 clusters">;

//===----------------------------------------------------------------------===//
// Lemberg processors supported.
//===----------------------------------------------------------------------===//

class Proc<string Name, list<SubtargetFeature> Features>
 : Processor<Name, LembergItineraries, Features>;

def : Proc<"lemberg", [FeatureSingle,FeatureDouble,Feature4Way]>;

def : Proc<"lemberg-minimal", [Feature1Way]>;

def Lemberg : Target {
  let InstructionSet = LembergInstrInfo;
}
