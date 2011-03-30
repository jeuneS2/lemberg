//===-- LembergSelectionDAGInfo.h - Lemberg SelectionDAG Info ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the Lemberg subclass for TargetSelectionDAGInfo.
//
//===----------------------------------------------------------------------===//

#ifndef LEMBERGSELECTIONDAGINFO_H
#define LEMBERGSELECTIONDAGINFO_H

#include "llvm/Target/TargetSelectionDAGInfo.h"

namespace llvm {

class LembergTargetMachine;

class LembergSelectionDAGInfo : public TargetSelectionDAGInfo {
public:
  explicit LembergSelectionDAGInfo(const LembergTargetMachine &TM);
  ~LembergSelectionDAGInfo();
};

}

#endif
