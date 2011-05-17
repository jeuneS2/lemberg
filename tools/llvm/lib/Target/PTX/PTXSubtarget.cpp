//===- PTXSubtarget.cpp - PTX Subtarget Information ---------------*- C++ -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the PTX specific subclass of TargetSubtarget.
//
//===----------------------------------------------------------------------===//

#include "PTXSubtarget.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

PTXSubtarget::PTXSubtarget(const std::string &TT, const std::string &FS)
  : PTXShaderModel(PTX_SM_1_0),
    PTXVersion(PTX_VERSION_1_4),
    SupportsDouble(false),
    Use64BitAddresses(false) {
  std::string TARGET = "generic";
  ParseSubtargetFeatures(FS, TARGET);
}

std::string PTXSubtarget::getTargetString() const {
  switch(PTXShaderModel) {
    default: llvm_unreachable("Unknown shader model");
    case PTX_SM_1_0: return "sm_10";
    case PTX_SM_1_3: return "sm_13";
    case PTX_SM_2_0: return "sm_20";
  }
}

std::string PTXSubtarget::getPTXVersionString() const {
  switch(PTXVersion) {
    default: llvm_unreachable("Unknown PTX version");
    case PTX_VERSION_1_4: return "1.4";
    case PTX_VERSION_2_0: return "2.0";
    case PTX_VERSION_2_1: return "2.1";
  }
}

#include "PTXGenSubtarget.inc"
