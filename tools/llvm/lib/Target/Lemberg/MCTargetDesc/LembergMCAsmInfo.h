//===-- LembergMCAsmInfo.h - Lemberg asm properties -----------*- C++ -*--====//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the LembergMCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LEMBERGTARGETASMINFO_H
#define LEMBERGTARGETASMINFO_H

#include "llvm/MC/MCAsmInfo.h"

namespace llvm {
  class Target;
  class StringRef;

  struct LembergMCAsmInfo : public MCAsmInfo {
    explicit LembergMCAsmInfo(const Target &T, const StringRef &TT);
  };

} // namespace llvm

#endif
