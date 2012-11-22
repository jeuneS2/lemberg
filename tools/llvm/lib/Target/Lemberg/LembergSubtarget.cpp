//===- LembergSubtarget.cpp - LEMBERG Subtarget Information ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the lemberg specific subclass of TargetSubtarget.
//
//===----------------------------------------------------------------------===//

#include "LembergSubtarget.h"
#include "Lemberg.h"
#include "llvm/CodeGen/ScheduleDAG.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "LembergGenSubtargetInfo.inc"

using namespace llvm;

LembergSubtarget::LembergSubtarget(const std::string &TT,
								   const std::string &CPU,
								   const std::string &FS)
  : LembergGenSubtargetInfo(TT, CPU, FS)
  , Clusters(0)
  , HasSingleFPU(false)
  , HasDoubleFPU(false) {

  std::string CPUName = CPU;
  if (CPUName.empty()) {
	CPUName = "lemberg";
  }

  // Parse features string.
  ParseSubtargetFeatures(CPUName, FS);

  // Initialize scheduling itinerary for the specified CPU.
  InstrItins = getInstrItineraryForCPU(CPUName);
  InstrItins.IssueWidth = Clusters;
}
