//===- LembergMachineFunctionInfo.h - Lemberg Machine Function Info -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares  Lemberg specific per-machine-function information.
//
//===----------------------------------------------------------------------===//
#ifndef LEMBERGMACHINEFUNCTIONINFO_H
#define LEMBERGMACHINEFUNCTIONINFO_H

#include "llvm/CodeGen/MachineFunction.h"

namespace llvm {

  class LembergMachineFunctionInfo : public MachineFunctionInfo {
  private:
    /// VarArgsFrameIndex - Frame index to start of varargs area.
    int VarArgsFrameIndex;

  public:
    LembergMachineFunctionInfo() : VarArgsFrameIndex(0) {}
    explicit LembergMachineFunctionInfo(MachineFunction &MF)
      : VarArgsFrameIndex(0) {}

    int getVarArgsFrameIndex() const { return VarArgsFrameIndex; }
    void setVarArgsFrameIndex(int Index) { VarArgsFrameIndex = Index; }
  };
}

#endif
