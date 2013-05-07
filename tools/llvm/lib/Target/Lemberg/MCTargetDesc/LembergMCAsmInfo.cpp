//===-- LembergMCAsmInfo.cpp - Lemberg asm properties ---------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declarations of the LembergMCAsmInfo properties.
//
//===----------------------------------------------------------------------===//

#include "LembergMCAsmInfo.h"

using namespace llvm;

LembergMCAsmInfo::LembergMCAsmInfo(const Target &T, const StringRef &TT) {
  GlobalPrefix = "_";
  CommentString = ";";
  HasSetDirective = false;
  HasDotTypeDotSizeDirective = true;
  ZeroDirective = 0;
  AscizDirective = 0;
}
