//===- LiveDebugVariables.h - Tracking debug info variables ----*- c++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides the interface to the LiveDebugVariables analysis.
//
// The analysis removes DBG_VALUE instructions for virtual registers and tracks
// live user variables in a data structure that can be updated during register
// allocation.
//
// After register allocation new DBG_VALUE instructions are emitted to reflect
// the new locations of user variables.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_CODEGEN_LIVEDEBUGVARIABLES_H
#define LLVM_CODEGEN_LIVEDEBUGVARIABLES_H

#include "llvm/CodeGen/MachineFunctionPass.h"

namespace llvm {

class VirtRegMap;

class LiveDebugVariables : public MachineFunctionPass {
  void *pImpl;
public:
  static char ID; // Pass identification, replacement for typeid

  LiveDebugVariables();
  ~LiveDebugVariables();

  /// renameRegister - Move any user variables in OldReg to NewReg:SubIdx.
  /// @param OldReg Old virtual register that is going away.
  /// @param NewReg New register holding the user variables.
  /// @param SubIdx If NewReg is a virtual register, SubIdx may indicate a sub-
  ///               register.
  void renameRegister(unsigned OldReg, unsigned NewReg, unsigned SubIdx);

  /// emitDebugValues - Emit new DBG_VALUE instructions reflecting the changes
  /// that happened during register allocation.
  /// @param VRM Rename virtual registers according to map.
  void emitDebugValues(VirtRegMap *VRM);

  /// dump - Print data structures to dbgs().
  void dump();

private:

  virtual bool runOnMachineFunction(MachineFunction &);
  virtual void releaseMemory();
  virtual void getAnalysisUsage(AnalysisUsage &) const;

};

} // namespace llvm

#endif // LLVM_CODEGEN_LIVEDEBUGVARIABLES_H
