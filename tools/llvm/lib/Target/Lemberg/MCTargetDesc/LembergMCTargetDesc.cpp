//===-- LembergMCTargetDesc.cpp - Lemberg Target Descriptions -----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides Lemberg specific target descriptions.
//
//===----------------------------------------------------------------------===//

#include "../LembergSubtarget.h"
#include "LembergMCTargetDesc.h"
#include "LembergMCAsmInfo.h"
#include "llvm/MC/MCCodeGenInfo.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

#define GET_INSTRINFO_MC_DESC
#include "LembergGenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "LembergGenSubtargetInfo.inc"

#define GET_REGINFO_MC_DESC
#include "LembergGenRegisterInfo.inc"

using namespace llvm;

static MCInstrInfo *createLembergMCInstrInfo() {
  MCInstrInfo *X = new MCInstrInfo();
  InitLembergMCInstrInfo(X);
  return X;
}

static MCRegisterInfo *createLembergMCRegisterInfo(StringRef TT) {
  MCRegisterInfo *X = new MCRegisterInfo();
  InitLembergMCRegisterInfo(X, Lemberg::RB);
  return X;
}

static MCSubtargetInfo *createLembergMCSubtargetInfo(StringRef TT, StringRef CPU,
                                                   StringRef FS) {
  MCSubtargetInfo *X = new MCSubtargetInfo();
  InitLembergMCSubtargetInfo(X, TT, CPU, FS);
  return X;
}

static MCCodeGenInfo *createLembergMCCodeGenInfo(StringRef TT, Reloc::Model RM,
                                               CodeModel::Model CM,
                                               CodeGenOpt::Level OL) {
  MCCodeGenInfo *X = new MCCodeGenInfo();
  X->InitMCCodeGenInfo(RM, CM, OL);
  return X;
}

extern "C" void LLVMInitializeLembergTargetMC() {
  // Register the MC asm info.
  RegisterMCAsmInfo<LembergMCAsmInfo> X(TheLembergTarget);

  // Register the MC codegen info.
  TargetRegistry::RegisterMCCodeGenInfo(TheLembergTarget,
										createLembergMCCodeGenInfo);

  // Register the MC instruction info.
  TargetRegistry::RegisterMCInstrInfo(TheLembergTarget, createLembergMCInstrInfo);

  // Register the MC register info.
  TargetRegistry::RegisterMCRegInfo(TheLembergTarget, createLembergMCRegisterInfo);

  // Register the MC subtarget info.
  TargetRegistry::RegisterMCSubtargetInfo(TheLembergTarget,
                                          createLembergMCSubtargetInfo);
}

// TODO: this is a dirty hack that should go away in the future
unsigned LembergSubtarget::getFuncUnit(LembergFU::FuncUnit FU) const {
	switch (FU) {
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

	default: llvm_unreachable("Unknown functional unit");
	}
}
