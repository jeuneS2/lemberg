//===- LembergISelLowering.h - Lemberg DAG Lowering Interface -*- C++ ---*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the interfaces that Lemberg uses to lower LLVM code into a
// selection DAG.
//
//===----------------------------------------------------------------------===//

#ifndef LEMBERG_ISELLOWERING_H
#define LEMBERG_ISELLOWERING_H

#include "Lemberg.h"
#include "llvm/Target/TargetLowering.h"
#include "llvm/CodeGen/MachineJumpTableInfo.h"

namespace llvm {

  namespace LembergISD {
    enum NodeType {
      // Start the numbering from where ISD NodeType finishes.
      FIRST_NUMBER = ISD::BUILTIN_OP_END,
	  // Compute carry and borrow
	  Carry, Borrow,
	  // Multiplication is a little special
	  Mul,
	  // Magic wrapper
	  Wrapper,
      // Call
      Call,
	  // Return 
      Return,
	  // Align and extend sub-word memory loads
	  MemExtend,
	  // Write back stack cache
	  WriteBack,
	  // Load
	  Load = ISD::FIRST_TARGET_MEMORY_OPCODE,
	  LoadStack,
	  // Store
	  Store, StoreStack
    };
  }

  class LembergTargetLowering : public TargetLowering {
  public:
    LembergTargetLowering(TargetMachine &TM);

    virtual const char *getTargetNodeName(unsigned Opcode) const;

    virtual EVT getSetCCResultType(EVT VT) const {
		return MVT::i1;
	}
    virtual unsigned getFunctionAlignment(const Function *F) const {
		return 2;
	}
	virtual unsigned getJumpTableEncoding() const {
		return MachineJumpTableInfo::EK_Custom32;
	}
    virtual std::vector<unsigned>
		getRegClassForInlineAsmConstraint(const std::string &Constraint,
										  EVT VT) const;

    virtual SDValue LowerOperation(SDValue Op, SelectionDAG &DAG) const;

	virtual bool isLegalAddressingMode(const AddrMode &AM, Type *Ty) const {
	  if (!isInt<11>(AM.BaseOffs)) return false;
	  if (AM.BaseGV) return false;
	  switch (AM.Scale) {
	  case 0: return true;
	  case 1: case 2: case 4: case 8:
		if (AM.BaseOffs) return false;
		return true;
	  default: return false;
	  }
	  return true;
	}

	virtual bool isLegalICmpImmediate(int64_t val) const {
	  return isInt<5>(val);
	}

	virtual bool isLegalIAddImmediate(int64_t val) const {
	  return isInt<6>(val);
	}

  private:
    SDValue LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const;
	SDValue LowerBlockAddress(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerJumpTable(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerExternalSymbol(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerConstantFP(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerADDC(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerADDE(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerLOAD(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerSTORE(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerVASTART(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerFRAMEADDR(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerRETURNADDR(SDValue Op, SelectionDAG &DAG) const;

    virtual SDValue
      LowerFormalArguments(SDValue Chain,
                           CallingConv::ID CallConv, bool isVarArg,
                           const SmallVectorImpl<ISD::InputArg> &Ins,
                           DebugLoc dl, SelectionDAG &DAG,
                           SmallVectorImpl<SDValue> &InVals) const;

    virtual SDValue
      LowerCall(SDValue Chain, SDValue Callee,
                CallingConv::ID CallConv, bool isVarArg, 
				bool doesNotRet, bool &isTailCall,
                const SmallVectorImpl<ISD::OutputArg> &Outs,
                const SmallVectorImpl<SDValue> &OutVals,
				const SmallVectorImpl<ISD::InputArg> &Ins,
                DebugLoc dl, SelectionDAG &DAG,
                SmallVectorImpl<SDValue> &InVals) const;

    virtual SDValue 
		LowerCallResult(SDValue Chain, SDValue InFlag,
						CallingConv::ID CallConv, bool isVarArg,
						const SmallVectorImpl<ISD::InputArg> &Ins,
						DebugLoc dl, SelectionDAG &DAG,
						SmallVectorImpl<SDValue> &InVals) const;

    virtual SDValue
      LowerReturn(SDValue Chain,
                  CallingConv::ID CallConv, bool isVarArg,
                  const SmallVectorImpl<ISD::OutputArg> &Outs,
				  const SmallVectorImpl<SDValue> &OutVals,
                  DebugLoc dl, SelectionDAG &DAG) const;

	virtual const MCExpr *
		LowerCustomJumpTableEntry(const MachineJumpTableInfo *MJTI,
								  const MachineBasicBlock *MBB, unsigned uid,
								  MCContext &Ctx) const;

  };
} // end namespace llvm

#endif    // LEMBERG_ISELLOWERING_H
