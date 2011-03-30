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
#include "LembergGenSubtarget.inc"
#include "llvm/CodeGen/ScheduleDAG.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

LembergSubtarget::LembergSubtarget(const std::string &TT,
								   const std::string &FS) {
  std::string CPU = "lemberg";
  // Parse features string.
  ParseSubtargetFeatures(FS, CPU);
}

// TODO: this is a dirty hack that should go away in the future
unsigned LembergSubtarget::getFuncUnit(LembergFU::FuncUnit FU) const {
	switch (FU) {
	default: llvm_unreachable("Unknown functional unit");

	case LembergFU::SLOT0: return LembergItinerariesFU::SLOT0;
	case LembergFU::SLOT1: return LembergItinerariesFU::SLOT1;
	case LembergFU::SLOT2: return LembergItinerariesFU::SLOT2;
	case LembergFU::SLOT3: return LembergItinerariesFU::SLOT3;
	case LembergFU::ALU0: return LembergItinerariesFU::ALU0;
	case LembergFU::ALU1: return LembergItinerariesFU::ALU1;
	case LembergFU::ALU2: return LembergItinerariesFU::ALU2;
	case LembergFU::ALU3: return LembergItinerariesFU::ALU3;
	case LembergFU::MEMU: return LembergItinerariesFU::MEMU;
	case LembergFU::JMPU: return LembergItinerariesFU::JMPU;
	case LembergFU::FPU_DEC: return LembergItinerariesFU::FPU_DEC;
	case LembergFU::FPU_EX1: return LembergItinerariesFU::FPU_EX1;
	case LembergFU::FPU_EX2: return LembergItinerariesFU::FPU_EX2;
	case LembergFU::FPU_EX3: return LembergItinerariesFU::FPU_EX3;
	case LembergFU::FPU_EX4: return LembergItinerariesFU::FPU_EX4;
	case LembergFU::FPU_EX5: return LembergItinerariesFU::FPU_EX5;
	case LembergFU::FPU_EX6: return LembergItinerariesFU::FPU_EX6;
	case LembergFU::FPU_EX7: return LembergItinerariesFU::FPU_EX7;
	case LembergFU::FPU_WB: return LembergItinerariesFU::FPU_WB;
	}
}
