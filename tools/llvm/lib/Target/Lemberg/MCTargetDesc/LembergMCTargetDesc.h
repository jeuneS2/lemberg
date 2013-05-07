//===-- LembergMCTargetDesc.h - Lemberg Target Descriptions ---------*- C++ -*-===//
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

#ifndef LEMBERGMCTARGETDESC_H
#define LEMBERGMCTARGETDESC_H

namespace llvm {
class Target;

extern Target TheLembergTarget;

} // End llvm namespace

// Defines symbolic names for Lemberg registers.  This defines a mapping from
// register name to register number.
//
#define GET_REGINFO_ENUM
#include "LembergGenRegisterInfo.inc"

// Defines symbolic names for the Lemberg instructions.
//
#define GET_INSTRINFO_ENUM
#include "LembergGenInstrInfo.inc"

#define GET_SUBTARGETINFO_ENUM
#include "LembergGenSubtargetInfo.inc"

#endif
