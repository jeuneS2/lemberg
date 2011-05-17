//===-- PTXISelLowering.cpp - PTX DAG Lowering Implementation -------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the PTXTargetLowering class.
//
//===----------------------------------------------------------------------===//

#include "PTX.h"
#include "PTXISelLowering.h"
#include "PTXMachineFunctionInfo.h"
#include "PTXRegisterInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PTXTargetLowering::PTXTargetLowering(TargetMachine &TM)
  : TargetLowering(TM, new TargetLoweringObjectFileELF()) {
  // Set up the register classes.
  addRegisterClass(MVT::i1,  PTX::PredsRegisterClass);
  addRegisterClass(MVT::i16, PTX::RRegu16RegisterClass);
  addRegisterClass(MVT::i32, PTX::RRegu32RegisterClass);
  addRegisterClass(MVT::i64, PTX::RRegu64RegisterClass);
  addRegisterClass(MVT::f32, PTX::RRegf32RegisterClass);
  addRegisterClass(MVT::f64, PTX::RRegf64RegisterClass);

  setOperationAction(ISD::EXCEPTIONADDR, MVT::i32, Expand);

  setOperationAction(ISD::ConstantFP, MVT::f32, Legal);
  setOperationAction(ISD::ConstantFP, MVT::f64, Legal);

  // Customize translation of memory addresses
  setOperationAction(ISD::GlobalAddress, MVT::i32, Custom);

  // Compute derived properties from the register classes
  computeRegisterProperties();
}

SDValue PTXTargetLowering::LowerOperation(SDValue Op, SelectionDAG &DAG) const {
  switch (Op.getOpcode()) {
    default:                 llvm_unreachable("Unimplemented operand");
    case ISD::GlobalAddress: return LowerGlobalAddress(Op, DAG);
  }
}

const char *PTXTargetLowering::getTargetNodeName(unsigned Opcode) const {
  switch (Opcode) {
    default:
      llvm_unreachable("Unknown opcode");
    case PTXISD::READ_PARAM:
      return "PTXISD::READ_PARAM";
    case PTXISD::EXIT:
      return "PTXISD::EXIT";
    case PTXISD::RET:
      return "PTXISD::RET";
  }
}

//===----------------------------------------------------------------------===//
//                      Custom Lower Operation
//===----------------------------------------------------------------------===//

SDValue PTXTargetLowering::
LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const {
  EVT PtrVT = getPointerTy();
  DebugLoc dl = Op.getDebugLoc();
  const GlobalValue *GV = cast<GlobalAddressSDNode>(Op)->getGlobal();
  return DAG.getTargetGlobalAddress(GV, dl, PtrVT);
}

//===----------------------------------------------------------------------===//
//                      Calling Convention Implementation
//===----------------------------------------------------------------------===//

namespace {
struct argmap_entry {
  MVT::SimpleValueType VT;
  TargetRegisterClass *RC;
  TargetRegisterClass::iterator loc;

  argmap_entry(MVT::SimpleValueType _VT, TargetRegisterClass *_RC)
    : VT(_VT), RC(_RC), loc(_RC->begin()) {}

  void reset() { loc = RC->begin(); }
  bool operator==(MVT::SimpleValueType _VT) const { return VT == _VT; }
} argmap[] = {
  argmap_entry(MVT::i1,  PTX::PredsRegisterClass),
  argmap_entry(MVT::i16, PTX::RRegu16RegisterClass),
  argmap_entry(MVT::i32, PTX::RRegu32RegisterClass),
  argmap_entry(MVT::i64, PTX::RRegu64RegisterClass),
  argmap_entry(MVT::f32, PTX::RRegf32RegisterClass),
  argmap_entry(MVT::f64, PTX::RRegf64RegisterClass)
};
}                               // end anonymous namespace

SDValue PTXTargetLowering::
  LowerFormalArguments(SDValue Chain,
                       CallingConv::ID CallConv,
                       bool isVarArg,
                       const SmallVectorImpl<ISD::InputArg> &Ins,
                       DebugLoc dl,
                       SelectionDAG &DAG,
                       SmallVectorImpl<SDValue> &InVals) const {
  if (isVarArg) llvm_unreachable("PTX does not support varargs");

  MachineFunction &MF = DAG.getMachineFunction();
  PTXMachineFunctionInfo *MFI = MF.getInfo<PTXMachineFunctionInfo>();

  switch (CallConv) {
    default:
      llvm_unreachable("Unsupported calling convention");
      break;
    case CallingConv::PTX_Kernel:
      MFI->setKernel(true);
      break;
    case CallingConv::PTX_Device:
      MFI->setKernel(false);
      break;
  }

  // Make sure we don't add argument registers twice
  if (MFI->isDoneAddArg())
    llvm_unreachable("cannot add argument registers twice");

  // Reset argmap before allocation
  for (struct argmap_entry *i = argmap, *e = argmap + array_lengthof(argmap);
       i != e; ++ i)
    i->reset();

  for (int i = 0, e = Ins.size(); i != e; ++ i) {
    MVT::SimpleValueType VT = Ins[i].VT.SimpleTy;

    struct argmap_entry *entry = std::find(argmap,
                                           argmap + array_lengthof(argmap), VT);
    if (entry == argmap + array_lengthof(argmap))
      llvm_unreachable("Type of argument is not supported");

    if (MFI->isKernel() && entry->RC == PTX::PredsRegisterClass)
      llvm_unreachable("cannot pass preds to kernel");

    MachineRegisterInfo &RegInfo = DAG.getMachineFunction().getRegInfo();

    unsigned preg = *++(entry->loc); // allocate start from register 1
    unsigned vreg = RegInfo.createVirtualRegister(entry->RC);
    RegInfo.addLiveIn(preg, vreg);

    MFI->addArgReg(preg);

    SDValue inval;
    if (MFI->isKernel())
      inval = DAG.getNode(PTXISD::READ_PARAM, dl, VT, Chain,
                          DAG.getTargetConstant(i, MVT::i32));
    else
      inval = DAG.getCopyFromReg(Chain, dl, vreg, VT);
    InVals.push_back(inval);
  }

  MFI->doneAddArg();

  return Chain;
}

SDValue PTXTargetLowering::
  LowerReturn(SDValue Chain,
              CallingConv::ID CallConv,
              bool isVarArg,
              const SmallVectorImpl<ISD::OutputArg> &Outs,
              const SmallVectorImpl<SDValue> &OutVals,
              DebugLoc dl,
              SelectionDAG &DAG) const {
  if (isVarArg) llvm_unreachable("PTX does not support varargs");

  switch (CallConv) {
    default:
      llvm_unreachable("Unsupported calling convention.");
    case CallingConv::PTX_Kernel:
      assert(Outs.size() == 0 && "Kernel must return void.");
      return DAG.getNode(PTXISD::EXIT, dl, MVT::Other, Chain);
    case CallingConv::PTX_Device:
      assert(Outs.size() <= 1 && "Can at most return one value.");
      break;
  }

  // PTX_Device

  // return void
  if (Outs.size() == 0)
    return DAG.getNode(PTXISD::RET, dl, MVT::Other, Chain);

  SDValue Flag;
  unsigned reg;

  if (Outs[0].VT == MVT::i16) {
    reg = PTX::RH0;
  }
  else if (Outs[0].VT == MVT::i32) {
    reg = PTX::R0;
  }
  else if (Outs[0].VT == MVT::i64) {
    reg = PTX::RD0;
  }
  else if (Outs[0].VT == MVT::f32) {
    reg = PTX::F0;
  }
  else if (Outs[0].VT == MVT::f64) {
    reg = PTX::FD0;
  }
  else {
    assert(false && "Can return only basic types");
  }

  MachineFunction &MF = DAG.getMachineFunction();
  PTXMachineFunctionInfo *MFI = MF.getInfo<PTXMachineFunctionInfo>();
  MFI->setRetReg(reg);

  // If this is the first return lowered for this function, add the regs to the
  // liveout set for the function
  if (DAG.getMachineFunction().getRegInfo().liveout_empty())
    DAG.getMachineFunction().getRegInfo().addLiveOut(reg);

  // Copy the result values into the output registers
  Chain = DAG.getCopyToReg(Chain, dl, reg, OutVals[0], Flag);

  // Guarantee that all emitted copies are stuck together,
  // avoiding something bad
  Flag = Chain.getValue(1);

  return DAG.getNode(PTXISD::RET, dl, MVT::Other, Chain, Flag);
}
