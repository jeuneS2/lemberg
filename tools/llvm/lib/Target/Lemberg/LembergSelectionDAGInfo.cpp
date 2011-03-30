//===-- LembergSelectionDAGInfo.cpp - Lemberg SelectionDAG Info -----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the LembergSelectionDAGInfo class.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "lemberg-selectiondag-info"
#include "LembergTargetMachine.h"
using namespace llvm;

LembergSelectionDAGInfo::LembergSelectionDAGInfo(const LembergTargetMachine &TM)
  : TargetSelectionDAGInfo(TM) {
}

LembergSelectionDAGInfo::~LembergSelectionDAGInfo() {
}
