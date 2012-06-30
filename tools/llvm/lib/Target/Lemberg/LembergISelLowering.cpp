//===- LembergISelLowering.cpp - Lemberg DAG Lowering Implementation ------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the interfaces that Lemberg uses to lower LLVM code
// into a selection DAG.
//
//===----------------------------------------------------------------------===//

#include "LembergISelLowering.h"
#include "LembergMachineFunctionInfo.h"
#include "LembergTargetMachine.h"
#include "llvm/Module.h"
#include "llvm/DerivedTypes.h"
#include "llvm/Instructions.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/ADT/VectorExtras.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/PseudoSourceValue.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/CodeGen/SelectionDAGNodes.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineJumpTableInfo.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Target/Mangler.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include <sstream>

using namespace llvm;

// Selective floating point support
static cl::opt<bool>
SoftDouble("lemberg-soft-double",
  cl::desc("Generate software floating point library calls for doubles only"),
  cl::init(false));

//===----------------------------------------------------------------------===//
// Calling Convention Implementation
//===----------------------------------------------------------------------===//

static bool CC_Lemberg_Custom_f64(unsigned &ValNo, MVT &ValVT, MVT &LocVT,
								  CCValAssign::LocInfo &LocInfo,
								  ISD::ArgFlagsTy &ArgFlags,
								  CCState &State);

static bool CC_Lemberg_Custom_ByVal(unsigned &ValNo, MVT &ValVT, MVT &LocVT,
									CCValAssign::LocInfo &LocInfo,
									ISD::ArgFlagsTy &ArgFlags,
									CCState &State);

#include "LembergGenCallingConv.inc"

//===----------------------------------------------------------------------===//
// TargetLowering Implementation
//===----------------------------------------------------------------------===//

LembergTargetLowering::LembergTargetLowering(TargetMachine &TM)
  : TargetLowering(TM, new TargetLoweringObjectFileELF()) {

	// const LembergRegisterInfo *LRI = (const LembergRegisterInfo *)TM.getRegisterInfo();
	// setStackPointerRegisterToSaveRestore(LRI->getStackRegister());
	setStackPointerRegisterToSaveRestore(Lemberg::R15);
	setJumpIsExpensive(true);
	setIntDivIsCheap(false);
	setBooleanContents(ZeroOrOneBooleanContent);

	maxStoresPerMemset = maxStoresPerMemcpy = maxStoresPerMemmove = 12;
	benefitFromCodePlacementOpt = true;

	// Set up the legal register classes.
	addRegisterClass(MVT::i32,   Lemberg::ARegisterClass);
	addRegisterClass(MVT::i1,    Lemberg::CRegisterClass);
	if (!TM.Options.UseSoftFloat) {
		addRegisterClass(MVT::f32,   Lemberg::FRegisterClass);
		if (!SoftDouble) {
			addRegisterClass(MVT::f64,   Lemberg::DRegisterClass);
		}
	}

	computeRegisterProperties();

	// Do not use a constant pool, even for floats
	setOperationAction(ISD::ConstantFP, MVT::f32, Legal);
	setOperationAction(ISD::ConstantFP, MVT::f64, Legal);

	// Custom lowering
	setOperationAction(ISD::GlobalAddress,  MVT::i32, Custom);
	setOperationAction(ISD::BlockAddress,   MVT::i32, Custom);
	setOperationAction(ISD::JumpTable,      MVT::i32, Custom);
	setOperationAction(ISD::ExternalSymbol, MVT::i32, Custom);
	setOperationAction(ISD::ADDC,  MVT::i32, Custom);
	setOperationAction(ISD::ADDE,  MVT::i32, Custom);
	setOperationAction(ISD::SUBC,  MVT::i32, Custom);
	setOperationAction(ISD::SUBE,  MVT::i32, Custom);
	setOperationAction(ISD::LOAD,  MVT::i1,  Custom);
	setOperationAction(ISD::LOAD,  MVT::i32, Custom);
	setOperationAction(ISD::LOAD,  MVT::f32, Custom);
	setOperationAction(ISD::LOAD,  MVT::f64, Custom);
	setOperationAction(ISD::STORE, MVT::i1,  Custom);
	setOperationAction(ISD::STORE, MVT::i32, Custom);
	setOperationAction(ISD::STORE, MVT::f32, Custom);
	setOperationAction(ISD::STORE, MVT::f64, Custom);

	// Sub-word accesses
	setLoadExtAction(ISD::EXTLOAD,  MVT::i1,  Promote);
	setLoadExtAction(ISD::EXTLOAD,  MVT::i8,  Custom);
	setLoadExtAction(ISD::EXTLOAD,  MVT::i16, Custom);
	setLoadExtAction(ISD::ZEXTLOAD, MVT::i1,  Promote);
	setLoadExtAction(ISD::ZEXTLOAD, MVT::i8,  Custom);
	setLoadExtAction(ISD::ZEXTLOAD, MVT::i16, Custom);
	setLoadExtAction(ISD::SEXTLOAD, MVT::i1,  Promote);
	setLoadExtAction(ISD::SEXTLOAD, MVT::i8,  Custom);
	setLoadExtAction(ISD::SEXTLOAD, MVT::i16, Custom);

	setTruncStoreAction(MVT::i32, MVT::i1,  Promote);
	setTruncStoreAction(MVT::i32, MVT::i8,  Custom);
	setTruncStoreAction(MVT::i32, MVT::i16, Custom);

	// Expand extending float->double load/store
	setLoadExtAction(ISD::EXTLOAD, MVT::f32, Expand);
	setTruncStoreAction(MVT::f64, MVT::f32, Expand);

	// Expand double-width multiplication
	setOperationAction(ISD::MULHU,     MVT::i32, Expand);
	setOperationAction(ISD::MULHS,     MVT::i32, Expand);
	setOperationAction(ISD::UMUL_LOHI, MVT::i32, Expand);
	setOperationAction(ISD::SMUL_LOHI, MVT::i32, Expand);

	// Expand whatever we don't have
	setOperationAction(ISD::BSWAP, MVT::i32, Expand);
	setOperationAction(ISD::ROTR, MVT::i32, Expand);
	setOperationAction(ISD::SHL_PARTS, MVT::i32, Expand);
	setOperationAction(ISD::SRA_PARTS, MVT::i32, Expand);
	setOperationAction(ISD::SRL_PARTS, MVT::i32, Expand);
	setOperationAction(ISD::SDIV, MVT::i32, Expand);
	setOperationAction(ISD::SDIVREM, MVT::i32, Expand);
	setOperationAction(ISD::SREM, MVT::i32, Expand);
	setOperationAction(ISD::UDIV, MVT::i32, Expand);
	setOperationAction(ISD::UDIVREM, MVT::i32, Expand);
	setOperationAction(ISD::UREM, MVT::i32, Expand);

	setOperationAction(ISD::FDIV, MVT::f32, Expand);
	setOperationAction(ISD::FDIV, MVT::f64, Expand);
	setOperationAction(ISD::FPOW, MVT::f32, Expand);
	setOperationAction(ISD::FPOW, MVT::f64, Expand);
	setOperationAction(ISD::FSQRT, MVT::f32, Expand);
	setOperationAction(ISD::FSQRT, MVT::f64, Expand);
	setOperationAction(ISD::FSIN, MVT::f32, Expand);
	setOperationAction(ISD::FSIN, MVT::f64, Expand);
	setOperationAction(ISD::FCOS, MVT::f32, Expand);
	setOperationAction(ISD::FCOS, MVT::f64, Expand);
    setOperationAction(ISD::FCOPYSIGN, MVT::f32, Expand);
    setOperationAction(ISD::FCOPYSIGN, MVT::f64, Expand);
	setOperationAction(ISD::UINT_TO_FP, MVT::i32, Expand);
	setOperationAction(ISD::FP_TO_UINT, MVT::i32, Expand);

	// TODO: should be Custom for proper stack write-back
	setOperationAction(ISD::DYNAMIC_STACKALLOC, MVT::i32, Expand);

	// Use the default implementation.
	setOperationAction(ISD::VASTART, MVT::Other, Custom);
	setOperationAction(ISD::VAARG, MVT::Other, Expand);
	setOperationAction(ISD::VACOPY, MVT::Other, Expand);
	setOperationAction(ISD::VAEND, MVT::Other, Expand);

	setOperationAction(ISD::STACKSAVE, MVT::Other, Expand);
	setOperationAction(ISD::STACKRESTORE, MVT::Other, Expand);

	setOperationAction(ISD::SELECT_CC, MVT::Other, Expand);
	setOperationAction(ISD::BR_CC, MVT::Other, Expand);
	setOperationAction(ISD::BR_JT, MVT::Other, Expand);

	setOperationAction(ISD::MEMBARRIER, MVT::Other, Expand);
}

const char *LembergTargetLowering::getTargetNodeName(unsigned Opcode) const {
  switch (Opcode) {
  default: return 0;
  case LembergISD::Carry:      return "LembergISD::Carry";
  case LembergISD::Borrow:     return "LembergISD::Borrow";
  case LembergISD::Mul:        return "LembergISD::Mul";
  case LembergISD::Wrapper:    return "LembergISD::Wrapper";
  case LembergISD::Call:       return "LembergISD::Call";
  case LembergISD::Return:     return "LembergISD::Return";
  case LembergISD::WaitLoad:   return "LembergISD::WaitLoad";
  case LembergISD::Load:       return "LembergISD::Load";
  case LembergISD::LoadStack:  return "LembergISD::LoadStack";
  case LembergISD::Store:      return "LembergISD::Store";
  case LembergISD::StoreStack: return "LembergISD::StoreStack";
  case LembergISD::WriteBack:  return "LembergISD::WriteBack";
  }
}

SDValue LembergTargetLowering::LowerOperation(SDValue Op, SelectionDAG &DAG) const {
  switch (Op.getOpcode()) {
  default:
    Op.getNode()->dump();
    llvm_unreachable("Should not custom lower this!");
  case ISD::GlobalAddress: 
	  return LowerGlobalAddress(Op, DAG);
  case ISD::BlockAddress: 
	  return LowerBlockAddress(Op, DAG);
  case ISD::JumpTable:
	  return LowerJumpTable(Op, DAG);
  case ISD::ExternalSymbol: 
	  return LowerExternalSymbol(Op, DAG);
  case ISD::ADDC:
  case ISD::SUBC: 
	  return LowerADDC(Op, DAG);
  case ISD::ADDE:
  case ISD::SUBE: 
	  return LowerADDE(Op, DAG);
  case ISD::LOAD:
  case ISD::EXTLOAD:
  case ISD::ZEXTLOAD:
  case ISD::SEXTLOAD:
	  return LowerLOAD(Op, DAG);
  case ISD::STORE:
	  return LowerSTORE(Op, DAG);
  case ISD::VASTART:
	  return LowerVASTART(Op, DAG);
  case ISD::FRAMEADDR:
	  return LowerFRAMEADDR(Op, DAG);
  case ISD::RETURNADDR:
	  return LowerRETURNADDR(Op, DAG);
  }
}

SDValue LembergTargetLowering::LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const {
  DebugLoc DL = Op.getDebugLoc();

  const GlobalValue *GV = cast<GlobalAddressSDNode>(Op)->getGlobal();
  return DAG.getNode(LembergISD::Wrapper, DL, MVT::i32,
					 DAG.getTargetGlobalAddress(GV, DL, MVT::i32));
}

SDValue LembergTargetLowering::LowerBlockAddress(SDValue Op, SelectionDAG &DAG) const {
  DebugLoc DL = Op.getDebugLoc();

  const BlockAddress *BA = cast<BlockAddressSDNode>(Op)->getBlockAddress();
  return DAG.getNode(LembergISD::Wrapper, DL, MVT::i32,
					 DAG.getBlockAddress(BA, MVT::i32, true));
}

SDValue LembergTargetLowering::LowerExternalSymbol(SDValue Op, SelectionDAG &DAG) const {
  DebugLoc DL = Op.getDebugLoc();

  // the symbol needs to be translated to a global variable
  LLVMContext *Context = DAG.getContext();
  const char *Sym = cast<ExternalSymbolSDNode>(Op)->getSymbol();
 
  GlobalVariable *GV = new GlobalVariable(Type::getInt32Ty(*Context), true,
										  GlobalValue::ExternalLinkage, 0, Sym);

  return DAG.getNode(LembergISD::Wrapper, DL, MVT::i32,
					 DAG.getTargetGlobalAddress(GV, DL, MVT::i32));
}

SDValue LembergTargetLowering::LowerJumpTable(SDValue Op, SelectionDAG &DAG) const {
  DebugLoc DL = Op.getDebugLoc();

  JumpTableSDNode *JT = cast<JumpTableSDNode>(Op);
  return DAG.getNode(LembergISD::Wrapper, DL, MVT::i32,
					 DAG.getTargetJumpTable(JT->getIndex(), MVT::i32));
}

const MCExpr
*LembergTargetLowering::LowerCustomJumpTableEntry(const MachineJumpTableInfo *MJTI,
												  const MachineBasicBlock *MBB,
												  unsigned uid,
												  MCContext &Ctx) const {

	// retrieve symbol for current function
	const TargetData *TD = getTargetMachine().getTargetData();
	Mangler Mang = Mangler(Ctx, *TD);
	SmallString<64> NameStr;
	Mang.getNameWithPrefix(NameStr, MBB->getParent()->getFunction(), false);
	NameStr += "_start";

	// create basic block offsets relative to function start
	const MCSymbol *FunSym = Ctx.GetOrCreateSymbol(NameStr.str());
	const MCExpr *Fun = MCSymbolRefExpr::Create(FunSym, Ctx);
	const MCExpr *Value = MCSymbolRefExpr::Create(MBB->getSymbol(), Ctx);
	const MCExpr *RelAddr = MCBinaryExpr::CreateSub(Value, Fun, Ctx);

	return RelAddr;
}

SDValue LembergTargetLowering::LowerADDC(SDValue Op, SelectionDAG &DAG) const {
  DebugLoc DL = Op.getDebugLoc();
  
  unsigned Opcode = Op.getOpcode()==ISD::ADDC ? ISD::ADD : ISD::SUB;
  unsigned CarryOp = Op.getOpcode()==ISD::ADDC ?
	  LembergISD::Carry : LembergISD::Borrow;

  // ADDC produces two results
  SDValue Add = DAG.getNode(Opcode, DL, MVT::i32,
							Op.getOperand(0), Op.getOperand(1));
  SDValue Carry = DAG.getNode(CarryOp, DL, MVT::i32,
							  Op.getOperand(0), Op.getOperand(1));
  SDValue Ops[2] = { Add, Carry };
  return DAG.getMergeValues(Ops, 2, DL);
}

SDValue LembergTargetLowering::LowerADDE(SDValue Op, SelectionDAG &DAG) const {
  DebugLoc DL = Op.getDebugLoc();
  
  unsigned Opcode = Op.getOpcode()==ISD::ADDE ? ISD::ADD : ISD::SUB;
  unsigned CarryOp = Op.getOpcode()==ISD::ADDE ?
	  LembergISD::Carry : LembergISD::Borrow;

  // ADDE produces two results
  SDValue Add = DAG.getNode(Opcode, DL, MVT::i32,
							Op.getOperand(0), Op.getOperand(1));

  SDValue AddC = DAG.getNode(Opcode, DL, MVT::i32,
							 Add, Op.getOperand(2).getValue(0));

  SDValue Carry = DAG.getNode(CarryOp, DL, MVT::i32,
							  Op.getOperand(0), Op.getOperand(1));
  SDValue Ops[2] = { AddC, Carry };
  return DAG.getMergeValues(Ops, 2, DL);
}

SDValue LembergTargetLowering::LowerLOAD(SDValue Op, SelectionDAG &DAG) const {

  LoadSDNode *LD = cast<LoadSDNode>(Op);
  SDValue Chain = LD->getChain();
  DebugLoc DL = Op.getDebugLoc();
  bool isBitLoad = false;

  // Promote bit values
  if (LD->getMemoryVT() == MVT::i1) {
	  isBitLoad = true;
	  LD = dyn_cast<LoadSDNode>
		  (DAG.getExtLoad(ISD::EXTLOAD, DL, MVT::i32, Chain,
						  LD->getBasePtr(), LD->getPointerInfo(),
						  MVT::i8, LD->isVolatile(), LD->isNonTemporal(), LD->getAlignment()));
  }

  ISD::LoadExtType ExtType = LD->getExtensionType();

  // Check whether the access goes to a stack location
  bool isStackLoad = false;
  if (LD->getTBAAInfo() && LD->getTBAAInfo()->isFunctionLocal())
	  isStackLoad = true;

  assert(LD->getOffset().getOpcode() == ISD::UNDEF && "Assumed undefined offset");

  Type *Ty = LD->getMemoryVT().getTypeForEVT(*DAG.getContext());
  unsigned ABIAlignment = getTargetData()->getABITypeAlignment(Ty);
  // Need to split unaligned loads
  if (LD->getAlignment() < ABIAlignment) {
	  EVT LDType = LD->getMemoryVT();

	  assert((LDType == MVT::f32 || LDType == MVT::i32 || LDType == MVT::i16)
			 && "Cannot handle this unaligned load");

	  EVT LDHalfType = LDType == MVT::i16 ? MVT::i8 : MVT::i16;
	  unsigned LDHalfSize = LDType == MVT::i16 ? 1 : 2;

	  SDValue LDA = DAG.getExtLoad(ISD::ZEXTLOAD, DL, MVT::i32, Chain,
								   LD->getBasePtr(), LD->getPointerInfo(),
								   LDHalfType, LD->isVolatile(), LD->isNonTemporal(), LD->getAlignment());
	  LDA = LowerLOAD(LDA, DAG);
	  Chain = LDA.getValue(1);

	  SDValue LDB = DAG.getExtLoad(ISD::ZEXTLOAD, DL, MVT::i32, Chain,
								   DAG.getNode(ISD::ADD, DL, MVT::i32, LD->getBasePtr(), 
											   DAG.getConstant(LDHalfSize, MVT::i32)),
								   LD->getPointerInfo().getWithOffset(LDHalfSize),
								   LDHalfType, LD->isVolatile(), LD->isNonTemporal(), LD->getAlignment());
	  LDB = LowerLOAD(LDB, DAG);
	  Chain = LDB.getValue(1);

	  SDValue ShiftAmount = DAG.getConstant(8*LDHalfSize, MVT::i32);
	  SDValue RetVal = DAG.getNode(ISD::SHL, DL, MVT::i32, LDB, ShiftAmount);
	  RetVal = DAG.getNode(ISD::OR, DL, MVT::i32, RetVal, LDA);
 
	  if (LDType == MVT::f32) {
		  RetVal = SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::f32, RetVal,
											  DAG.getTargetConstant(Lemberg::FRegClassID, MVT::i32)), 0);
	  }

	  SDValue MergeOps[] = { RetVal, Chain };
	  return DAG.getMergeValues(MergeOps, 2, DL);
  }

  // Handle sub-word loads
  unsigned MemReg = Lemberg::MEM;
  SDValue WordOffset = DAG.getConstant(0, MVT::i32);
  if (ExtType == ISD::EXTLOAD
	  || ExtType == ISD::ZEXTLOAD
	  || ExtType == ISD::SEXTLOAD) {
	  EVT AccessType = LD->getMemoryVT();
	  if (AccessType == MVT::i8) {
		  MemReg = ExtType == ISD::SEXTLOAD ? Lemberg::MEMBS : Lemberg::MEMBU;
	  } else if (AccessType == MVT::i16) {
		  MemReg = ExtType == ISD::SEXTLOAD ? Lemberg::MEMHS : Lemberg::MEMHU;
	  } else {
		  llvm_unreachable("Unknown type for extending load");
	  }
	  WordOffset = LD->getBasePtr();
  }

  // Type lists with chain & flag
  SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Glue);
  SDVTList WaitLoadTys = DAG.getVTList(MVT::i32, MVT::Other, MVT::Glue);

  if (LD->getMemoryVT() != MVT::f64) {
	  // Create node for load
	  SDValue Ops [] = { Chain, LD->getBasePtr(), LD->getOffset() };

	  Chain = DAG.getMemIntrinsicNode(isStackLoad ? LembergISD::LoadStack : LembergISD::Load,
									  DL, NodeTys, Ops, 3, MVT::i32,
									  LD->getPointerInfo(), LD->getAlignment(), LD->isVolatile(),
									  true, false);
	  SDValue Flag = Chain.getValue(1);

	  // Read result from load via LDX
	  Chain = DAG.getNode(LembergISD::WaitLoad, DL, WaitLoadTys,
						  Chain, DAG.getRegister(MemReg, MVT::i32), WordOffset, Flag);

	  if (LD->getMemoryVT() == MVT::f32) {
		  // SDValue Converted = DAG.getNode(ISD::BITCAST, DL, MVT::f32, Chain);
	   	  SDValue Converted =
			  SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::f32, Chain,
										 DAG.getTargetConstant(Lemberg::FRegClassID, MVT::i32)), 0);
		  SDValue MergeOps [] = { Converted, Chain.getOperand(0) };
		  Chain = DAG.getMergeValues(MergeOps, 2, DL);
	  } else if (isBitLoad) {
	   	  SDValue Converted = DAG.getZExtOrTrunc(Chain, DL, MVT::i1);
		  SDValue MergeOps [] = { Converted, Chain.getOperand(0) };
		  Chain = DAG.getMergeValues(MergeOps, 2, DL);		  
	  }
  } else {
	  // Create node for load of low part
	  SDValue OpsLo [] = { Chain, LD->getBasePtr(), LD->getOffset() };
	  Chain = DAG.getMemIntrinsicNode(isStackLoad ? LembergISD::LoadStack : LembergISD::Load,
									  DL, NodeTys, OpsLo, 3, MVT::i32,
									  LD->getPointerInfo(),
									  4, LD->isVolatile(), true, false);
	  SDValue Flag = Chain.getValue(1);

	  // Read result from load via LDX
	  SDVTList WaitLoadTys = DAG.getVTList(MVT::i32, MVT::Other, MVT::Glue);
	  SDValue Lo = DAG.getNode(LembergISD::WaitLoad, DL, WaitLoadTys,
							   Chain, DAG.getRegister(MemReg, MVT::i32), WordOffset, Flag);
	  Chain = Lo.getValue(1);
	  Flag = Lo.getValue(2);
	  // Lo = DAG.getNode(ISD::BITCAST, DL, MVT::f32, Lo);
	  Lo = SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::f32, Lo, 
									  DAG.getTargetConstant(Lemberg::FRegClassID, MVT::i32)), 0);

	  // Create node for load of high part
	  SDValue OpsHi [] = { Chain, DAG.getNode(ISD::ADD, DL, MVT::i32,
											  LD->getBasePtr(), 
											  DAG.getConstant(4, MVT::i32)), LD->getOffset() };
	  Chain = DAG.getMemIntrinsicNode(isStackLoad ? LembergISD::LoadStack : LembergISD::Load,
									  DL, NodeTys, OpsHi, 3, MVT::i32,
									  LD->getPointerInfo().getWithOffset(4),
									  4, LD->isVolatile(), true, false);
	  Flag = Chain.getValue(1);
	  
	  // Read result from load via LDX
	  SDValue Hi = DAG.getNode(LembergISD::WaitLoad, DL, WaitLoadTys,
							   Chain, DAG.getRegister(MemReg, MVT::i32), WordOffset, Flag);
	  // Hi = DAG.getNode(ISD::BITCAST, DL, MVT::f32, Hi);
	  Hi = SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::f32, Hi, 
									  DAG.getTargetConstant(Lemberg::FRegClassID, MVT::i32)), 0);
	  
	  SDNode *Undef = DAG.getMachineNode(TargetOpcode::IMPLICIT_DEF, DL, MVT::f64);
	  SDNode *InsertLo = DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
											SDValue(Undef, 0), Lo, 
											DAG.getTargetConstant(Lemberg::sub_even, MVT::i32));
	  Chain = SDValue(DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL,
										 MVT::f64, MVT::Other, MVT::Glue,
										 SDValue(InsertLo, 0), Hi,
										 DAG.getTargetConstant(Lemberg::sub_odd, MVT::i32)), 0);
  }

  return Chain;
}

SDValue LembergTargetLowering::LowerSTORE(SDValue Op, SelectionDAG &DAG) const {

  StoreSDNode *ST = cast<StoreSDNode>(Op);
  SDValue Chain = ST->getChain();
  DebugLoc DL = Op.getDebugLoc();

  // A chain & a flag as result types
  SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Glue);

  // Promote bit values
  if (ST->getValue().getValueType() == MVT::i1) {	  
	  ST = dyn_cast<StoreSDNode>
		  (DAG.getTruncStore(Chain, DL,
							 DAG.getZExtOrTrunc(ST->getValue(), DL, MVT::i32),
							 ST->getBasePtr(), MVT::i8,
							 ST->getMemOperand()).getNode());
  }

  // Convert float store to int store
  if (ST->getMemoryVT() == MVT::f32) {
	  // SDValue Converted = DAG.getNode(ISD::BITCAST, DL, MVT::i32, ST->getValue());
	  SDValue Converted =
		  SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::i32, ST->getValue(), 
									 DAG.getTargetConstant(Lemberg::ARegClassID, MVT::i32)), 0);
	  ST = dyn_cast<StoreSDNode>
		  (DAG.getStore(Chain, DL, Converted, ST->getBasePtr(), ST->getMemOperand()).getNode());
  }

  bool isStackStore = false;
  if (ST->getTBAAInfo() && ST->getTBAAInfo()->isFunctionLocal())
	  isStackStore = true;

  assert(ST->getOffset().getOpcode() == ISD::UNDEF && "Assumed undefined offset");

  Type *Ty = ST->getMemoryVT().getTypeForEVT(*DAG.getContext());
  unsigned ABIAlignment = getTargetData()->getABITypeAlignment(Ty);
  // Need to split unaligned stores
  if (ST->getAlignment() < ABIAlignment) {
	  EVT STType = ST->getMemoryVT();

	  assert((STType == MVT::i32 || STType == MVT::i16)
			 && "Cannot handle this unaligned store");

	  EVT STHalfType = STType == MVT::i16 ? MVT::i8 : MVT::i16;
	  unsigned STHalfSize = STType == MVT::i16 ? 1 : 2;

	  SDValue STA = ST->getValue();
	  STA = DAG.getTruncStore(Chain, DL, STA,
							  ST->getBasePtr(), ST->getPointerInfo(),
							  STHalfType, ST->isVolatile(), ST->isNonTemporal(), ST->getAlignment());
	  Chain = LowerSTORE(STA, DAG);

	  SDValue ShiftAmount = DAG.getConstant(8*STHalfSize, MVT::i32);
	  SDValue STB = DAG.getNode(ISD::SRL, DL, MVT::i32, ST->getValue(), ShiftAmount);

	  STB = DAG.getTruncStore(Chain, DL, STB,
							  DAG.getNode(ISD::ADD, DL, MVT::i32, ST->getBasePtr(), 
										  DAG.getConstant(STHalfSize, MVT::i32)),
							  ST->getPointerInfo().getWithOffset(STHalfSize),
							  STHalfType, ST->isVolatile(), ST->isNonTemporal(), ST->getAlignment());
	  Chain = LowerSTORE(STB, DAG);

	  return Chain;
  }
 
  // Create node for store
  if (ST->getMemoryVT() != MVT::f64) {
	  // Normal store
	  SDValue Ops [] = { Chain, ST->getValue(), ST->getBasePtr(), ST->getOffset() };
	  Chain = DAG.getMemIntrinsicNode(isStackStore ? LembergISD::StoreStack : LembergISD::Store,
									  DL, NodeTys, Ops, 4, ST->getMemoryVT(),
									  ST->getPointerInfo(), ST->getAlignment(), ST->isVolatile(),
									  false, true);
  } else {
	  // 64-bit store needs to be split
	  SDValue Lo = SDValue(DAG.getMachineNode(TargetOpcode::EXTRACT_SUBREG, DL, MVT::i32,
											  ST->getValue(), 
											  DAG.getTargetConstant(Lemberg::sub_even, MVT::i32)), 0);
	  SDValue Hi = SDValue(DAG.getMachineNode(TargetOpcode::EXTRACT_SUBREG, DL, MVT::i32,
											  ST->getValue(),
											  DAG.getTargetConstant(Lemberg::sub_odd, MVT::i32)), 0);

	  SDValue OpsLo [] = { Chain, Lo, ST->getBasePtr(), ST->getOffset() };

	  Chain = DAG.getMemIntrinsicNode(isStackStore ? LembergISD::StoreStack : LembergISD::Store,
									  DL, NodeTys, OpsLo, 4, MVT::i32, 
									  ST->getPointerInfo(),
									  4, ST->isVolatile(), false, true);

	  SDValue OpsHi [] =  { Chain, Hi, DAG.getNode(ISD::ADD, DL, MVT::i32,
												   ST->getBasePtr(), 
												   DAG.getConstant(4, MVT::i32)), ST->getOffset() };

	  Chain = DAG.getMemIntrinsicNode(isStackStore ? LembergISD::StoreStack : LembergISD::Store,
									  DL, NodeTys, OpsHi, 4, MVT::i32, 
									  ST->getPointerInfo().getWithOffset(4),
									  4, ST->isVolatile(), false, true);
  }

  return Chain;
}

SDValue LembergTargetLowering::LowerVASTART(SDValue Op, SelectionDAG &DAG) const {
  MachineFunction &MF = DAG.getMachineFunction();
  LembergMachineFunctionInfo *FuncInfo = MF.getInfo<LembergMachineFunctionInfo>();

  // vastart just stores the address of the VarArgsFrameIndex slot into the
  // memory location argument.
  DebugLoc DL = Op.getDebugLoc();
  SDValue FR = DAG.getFrameIndex(FuncInfo->getVarArgsFrameIndex(), MVT::i32);
  const Value *SV = cast<SrcValueSDNode>(Op.getOperand(2))->getValue();
  return DAG.getStore(Op.getOperand(0), DL, FR, Op.getOperand(1),
					  MachinePointerInfo(SV), false, false, 0);
}

SDValue LembergTargetLowering::LowerFRAMEADDR(SDValue Op, SelectionDAG &DAG) const {
  MachineFunction &MF = DAG.getMachineFunction();
  MachineFrameInfo *MFI = MF.getFrameInfo();
  MFI->setFrameAddressIsTaken(true);

  EVT VT = Op.getValueType();
  DebugLoc DL = Op.getDebugLoc();

  const LembergRegisterInfo *LRI = (const LembergRegisterInfo *)getTargetMachine().getRegisterInfo();
  unsigned FrameReg = LRI->getFrameRegister(MF);
  uint64_t depth = Op.getConstantOperandVal(0);

  SDValue FrameAddr;
  if (depth == 0)
    FrameAddr = DAG.getCopyFromReg(DAG.getEntryNode(), DL, FrameReg, VT);
  else {
	llvm_unreachable("Cannot retrieve frame address for depth > 0");
  }
  return FrameAddr;
}

SDValue LembergTargetLowering::LowerRETURNADDR(SDValue Op, SelectionDAG &DAG) const {
  MachineFunction &MF = DAG.getMachineFunction();
  MachineFrameInfo *MFI = MF.getFrameInfo();
  MFI->setReturnAddressIsTaken(true);

  EVT VT = Op.getValueType();
  DebugLoc DL = Op.getDebugLoc();

  const LembergRegisterInfo *LRI = (const LembergRegisterInfo *)getTargetMachine().getRegisterInfo();
  unsigned RetBaseReg = LRI->getRARegister();
  unsigned RetOffReg = LRI->getRAOffRegister();
  uint64_t depth = Op.getConstantOperandVal(0);

  SDValue RetAddr;
  if (depth == 0)
    RetAddr = DAG.getNode(ISD::ADD, DL, MVT::i32,
						  DAG.getCopyFromReg(DAG.getEntryNode(), DL, RetBaseReg, VT),
						  DAG.getCopyFromReg(DAG.getEntryNode(), DL, RetOffReg, VT));
  else {
	llvm_unreachable("Cannot retrieve return address for depth > 0");
  }
  return RetAddr;
}

// f64 is in register pairs, possibly split to stack
static bool CC_Lemberg_Custom_f64(unsigned &ValNo, MVT &ValVT, MVT &LocVT,
								  CCValAssign::LocInfo &LocInfo,
								  ISD::ArgFlagsTy &ArgFlags,
								  CCState &State) {

  static const uint16_t RegList[] = { Lemberg::R0, Lemberg::R1,
									  Lemberg::R2, Lemberg::R3 };

  // Try to get the first register.
  if (unsigned Reg = State.AllocateReg(RegList, 4))
	  State.addLoc(CCValAssign::getCustomReg(ValNo, ValVT, Reg, LocVT, LocInfo));
  else
	  State.addLoc(CCValAssign::getCustomMem(ValNo, ValVT,
											 State.AllocateStack(4, 4),
											 LocVT, LocInfo));

  // Try to get the second register.
  if (unsigned Reg = State.AllocateReg(RegList, 4))
	  State.addLoc(CCValAssign::getCustomReg(ValNo, ValVT, Reg, LocVT, LocInfo));
  else
	  State.addLoc(CCValAssign::getCustomMem(ValNo, ValVT,
											 State.AllocateStack(4, 4),
											 LocVT, LocInfo));
  return true;
}

static bool CC_Lemberg_Custom_ByVal(unsigned &ValNo, MVT &ValVT, MVT &LocVT,
								  CCValAssign::LocInfo &LocInfo,
								  ISD::ArgFlagsTy &ArgFlags,
								  CCState &State) {

	static const uint16_t RegList[] = { Lemberg::R0, Lemberg::R1,
										Lemberg::R2, Lemberg::R3 };

	unsigned Align = ArgFlags.getByValAlign();
	unsigned Size  = ArgFlags.getByValSize();
	if (4 > Size) Size = 4;
	if (4 > Align) Align = 4;
	
	// Shadow registers
	unsigned Shadow = 0;
	while (Shadow < Size) {
		unsigned Reg = State.AllocateReg(RegList, 4);
		if (!Reg) break;
		Shadow += 4;
	}

	// Reserve memory for copy of ByVal argument
	unsigned Offset = 0;
	if (Size > Shadow) {
		Offset = State.AllocateStack(Size-Shadow, Align);
	}

	State.addLoc(CCValAssign::getMem(ValNo, ValVT, Offset, LocVT, LocInfo));

	return true;
}

SDValue
LembergTargetLowering::LowerFormalArguments(SDValue Chain,
											CallingConv::ID CallConv, bool isVarArg,
                                            const SmallVectorImpl<ISD::InputArg> &Ins,
											DebugLoc DL, SelectionDAG &DAG,
											SmallVectorImpl<SDValue> &InVals) const {

  MachineFunction &MF = DAG.getMachineFunction();
  MachineFrameInfo *MFI = MF.getFrameInfo();
  LembergMachineFunctionInfo *FuncInfo = MF.getInfo<LembergMachineFunctionInfo>();

  SmallVector<CCValAssign, 16> ArgLocs;
  CCState CCInfo(CallConv, isVarArg, MF, getTargetMachine(),
                 ArgLocs, *DAG.getContext());
  CCInfo.AnalyzeFormalArguments(Ins, CC_Lemberg);

  unsigned RegArgs = 0;

  unsigned ShadowOff = 16;

  for (unsigned i = 0, e = ArgLocs.size(); i != e; ++i) {
    CCValAssign &VA = ArgLocs[i];

	ISD::ArgFlagsTy Flags = Ins[VA.getValNo()].Flags;

    if (VA.isRegLoc()) {
      RegArgs++;

      const TargetRegisterClass *RC = Lemberg::ARegisterClass;

      assert(RC->contains(VA.getLocReg()) && "Unexpected regclass in CCState");

      unsigned Reg = MF.getRegInfo().createVirtualRegister(RC);
      MF.getRegInfo().addLiveIn(VA.getLocReg(), Reg);
      SDValue ArgValue;

	  if (VA.needsCustom()) {
		  assert(VA.getLocVT() == MVT::f64);
		  assert(i+1 < e);
		  
		  ArgValue = DAG.getCopyFromReg(Chain, DL, Reg, MVT::i32);

		  CCValAssign &VAHi = ArgLocs[++i];
		  SDValue ArgValueHi;

		  if (VAHi.isRegLoc()) {
			  RegArgs++;
			  unsigned RegHi = MF.getRegInfo().createVirtualRegister(RC);
			  MF.getRegInfo().addLiveIn(VAHi.getLocReg(), RegHi);
			  ArgValueHi = DAG.getCopyFromReg(Chain, DL, RegHi, MVT::i32);
		  } else {
			  assert(VAHi.isMemLoc() && "CCValAssign must be RegLoc or MemLoc");
			  int FIHi = MFI->CreateFixedObject(4, VAHi.getLocMemOffset()+ShadowOff, true);
			  SDValue FINHi = DAG.getFrameIndex(FIHi, MVT::i32);
			  ArgValueHi = DAG.getLoad(MVT::i32, DL, Chain, FINHi,
									   MachinePointerInfo::getFixedStack(FIHi),
									   false, false, false, 0);
		  }

		  // ArgValue = DAG.getNode(ISD::BITCAST, DL, MVT::f32, ArgValue);
		  ArgValue = SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::f32, ArgValue, 
		   										DAG.getTargetConstant(Lemberg::FRegClassID, MVT::i32)), 0);
		  // ArgValueHi = DAG.getNode(ISD::BITCAST, DL, MVT::f32, ArgValueHi);
		  ArgValueHi = SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::f32, ArgValueHi, 
		   										DAG.getTargetConstant(Lemberg::FRegClassID, MVT::i32)), 0);

		  SDNode *Undef = DAG.getMachineNode(TargetOpcode::IMPLICIT_DEF, DL, MVT::f64);
		  SDNode *InsertLo = DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
												SDValue(Undef, 0), ArgValue, 
												DAG.getTargetConstant(Lemberg::sub_even, MVT::i32));
		  ArgValue = SDValue(DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
												SDValue(InsertLo, 0), ArgValueHi,
												DAG.getTargetConstant(Lemberg::sub_odd, MVT::i32)), 0);
	  } else {
		  EVT Type = VA.getValVT() == MVT::f32 ? MVT::f32 : MVT::i32;
		  ArgValue = DAG.getCopyFromReg(Chain, DL, Reg, Type);
	  }

      // If this is an 8 or 16-bit value, it is really passed promoted to 32
      // bits.  Insert an assert[sz]ext to capture this, then truncate to the
      // right size.
      if (VA.getLocInfo() == CCValAssign::SExt)
        ArgValue = DAG.getNode(ISD::AssertSext, DL, MVT::i32, ArgValue,
                               DAG.getValueType(VA.getValVT()));
      else if (VA.getLocInfo() == CCValAssign::ZExt)
        ArgValue = DAG.getNode(ISD::AssertZext, DL, MVT::i32, ArgValue,
                               DAG.getValueType(VA.getValVT()));

      if (VA.getLocInfo() == CCValAssign::SExt || VA.getLocInfo() == CCValAssign::ZExt)
        ArgValue = DAG.getNode(ISD::TRUNCATE, DL, VA.getValVT(), ArgValue);

      InVals.push_back(ArgValue);

    } else {
      assert(VA.isMemLoc() && "CCValAssign must be RegLoc or MemLoc");

	  SDValue ArgValue;

	  if (VA.needsCustom()) {
		  assert(VA.getLocVT() == MVT::f64);
		  assert(i+1 < e);

		  int FI = MFI->CreateFixedObject(4, VA.getLocMemOffset()+ShadowOff, true);
		  SDValue FIN = DAG.getFrameIndex(FI, MVT::i32);

		  ArgValue = DAG.getLoad(MVT::i32, DL, Chain, FIN,
								 MachinePointerInfo::getFixedStack(FI),
								 false, false, false, 0);

		  CCValAssign &VAHi = ArgLocs[++i];
		  
		  int FIHi = MFI->CreateFixedObject(4, VAHi.getLocMemOffset()+ShadowOff, true);
		  SDValue FINHi = DAG.getFrameIndex(FIHi, MVT::i32);
		  SDValue ArgValueHi = DAG.getLoad(MVT::i32, DL, Chain, FINHi,
										   MachinePointerInfo::getFixedStack(FIHi),
										   false, false, false, 0);
		  
		  // ArgValue = DAG.getNode(ISD::BITCAST, DL, MVT::f32, ArgValue);
		  ArgValue = SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::f32, ArgValue, 
		   										DAG.getTargetConstant(Lemberg::FRegClassID, MVT::i32)), 0);
		  // ArgValueHi = DAG.getNode(ISD::BITCAST, DL, MVT::f32, ArgValueHi);
		  ArgValueHi = SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::f32, ArgValueHi, 
												  DAG.getTargetConstant(Lemberg::FRegClassID, MVT::i32)), 0);
		  
		  SDNode *Undef = DAG.getMachineNode(TargetOpcode::IMPLICIT_DEF, DL, MVT::f64);
		  SDNode *InsertLo = DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
												SDValue(Undef, 0), ArgValue, 
												DAG.getTargetConstant(Lemberg::sub_even, MVT::i32));
		  ArgValue = SDValue(DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
												SDValue(InsertLo, 0), ArgValueHi,
												DAG.getTargetConstant(Lemberg::sub_odd, MVT::i32)), 0);
	  } else if (Flags.isByVal()) {
		  unsigned Size = Flags.getByValSize();
		  int FI = MFI->CreateFixedObject(Size, VA.getLocMemOffset()+4*RegArgs, false);
		  ArgValue = DAG.getFrameIndex(FI, MVT::i32);

		  while ((int)Size > 0 && RegArgs < 4) {
			  Size -= 4;
			  RegArgs++;
		  }
	  } else {
		  int FI = MFI->CreateFixedObject(4, VA.getLocMemOffset()+ShadowOff, true);
		  SDValue FIN = DAG.getFrameIndex(FI, MVT::i32);

		  ArgValue = DAG.getLoad(VA.getValVT(), DL, Chain, FIN,
								 MachinePointerInfo::getFixedStack(FI),
								 false, false, false, 0);
	  }

      InVals.push_back(ArgValue);
    }
  }

  if (isVarArg) {

    std::vector<SDValue> OutChains;
	static const unsigned ArgRegs[] =
		{ Lemberg::R0, Lemberg::R1, Lemberg::R2, Lemberg::R3 };

	int VarArgIdx = 0;

	// Store remaining ArgRegs to the stack if this is a varargs function.
	for (unsigned i = RegArgs; i < 4; ++i) {
		
		unsigned VReg = MF.getRegInfo().createVirtualRegister(Lemberg::ARegisterClass);
		MF.getRegInfo().addLiveIn(ArgRegs[i], VReg);
		SDValue Arg = DAG.getCopyFromReg(DAG.getRoot(), DL, VReg, MVT::i32);

		int FrameIdx = MFI->CreateFixedObject(4, i*4, true);
		SDValue FIPtr = DAG.getFrameIndex(FrameIdx, MVT::i32);
		OutChains.push_back(DAG.getStore(DAG.getRoot(), DL, Arg, FIPtr,
                                         MachinePointerInfo::getFixedStack(FrameIdx),
										 false, false, 0));

		if (i == RegArgs) {
			VarArgIdx = FrameIdx;
		}
    }

	if (RegArgs >= 4) {
		VarArgIdx = MFI->CreateFixedObject(4, 16+CCInfo.getNextStackOffset(), true);
	}
	// Remember the first vararg offset for the va_start implementation.
	FuncInfo->setVarArgsFrameIndex(VarArgIdx);

    if (!OutChains.empty()) {
		OutChains.push_back(Chain);
		Chain = DAG.getNode(ISD::TokenFactor, DL, MVT::Other, &OutChains[0], OutChains.size());
    }
  }

  return Chain;
}

SDValue
LembergTargetLowering::LowerReturn(SDValue Chain,
								   CallingConv::ID CallConv, bool isVarArg,
								   const SmallVectorImpl<ISD::OutputArg> &Outs,
								   const SmallVectorImpl<SDValue> &OutVals,
								   DebugLoc DL, SelectionDAG &DAG) const {

  MachineFunction &MF = DAG.getMachineFunction();

  // CCValAssign - represent the assignment of the return value to locations.
  SmallVector<CCValAssign, 16> RVLocs;

  // CCState - Info about the registers and stack slot.
  CCState CCInfo(CallConv, isVarArg, MF, DAG.getTarget(),
                 RVLocs, *DAG.getContext());

  // Analize return values.
  CCInfo.AnalyzeReturn(Outs, RetCC_Lemberg);

  // If this is the first return lowered for this function, add the regs to the
  // liveout set for the function.
  if (MF.getRegInfo().liveout_empty()) {
    for (unsigned i = 0; i != RVLocs.size(); ++i)
      MF.getRegInfo().addLiveOut(RVLocs[i].getLocReg());
  }

  SDValue Flag;

  // Copy the result values into the output registers.
  for (unsigned i = 0; i != RVLocs.size(); ++i) {
    CCValAssign &VA = RVLocs[i];
    assert(VA.isRegLoc() && "Can only return in registers!");
    SDValue Opi = OutVals[i];

    // Expand to i32 if necessary
    switch (VA.getLocInfo()) {
    default: llvm_unreachable("Unknown loc info!");
    case CCValAssign::Full: break;
    case CCValAssign::SExt:
      Opi = DAG.getNode(ISD::SIGN_EXTEND, DL, VA.getLocVT(), Opi);
      break;
    case CCValAssign::ZExt:
      Opi = DAG.getNode(ISD::ZERO_EXTEND, DL, VA.getLocVT(), Opi);
      break;
    case CCValAssign::AExt:
      Opi = DAG.getNode(ISD::ANY_EXTEND, DL, VA.getLocVT(), Opi);
      break;
    }
    Chain = DAG.getCopyToReg(Chain, DL, VA.getLocReg(), Opi, SDValue());
    // Guarantee that all emitted copies are stuck together with flags.
    Flag = Chain.getValue(1);
  }

  // The actual return
  if (Flag.getNode()) {
	  return DAG.getNode(LembergISD::Return, DL, MVT::Other, Chain, Flag);
  } else {
	  return DAG.getNode(LembergISD::Return, DL, MVT::Other, Chain);
  }
}

SDValue
LembergTargetLowering::LowerCall(SDValue Chain, SDValue Callee,
                               CallingConv::ID CallConv, bool isVarArg,
							   bool doesNotRet, bool &isTailCall,
                               const SmallVectorImpl<ISD::OutputArg> &Outs,
                               const SmallVectorImpl<SDValue> &OutVals,
                               const SmallVectorImpl<ISD::InputArg> &Ins,
                               DebugLoc DL, SelectionDAG &DAG,
                               SmallVectorImpl<SDValue> &InVals) const {
  // Lemberg target does not yet support tail call optimization.
  isTailCall = false;

  MachineFunction &MF = DAG.getMachineFunction();
  MachineFrameInfo *MFI = MF.getFrameInfo();

  // The current function obviously contains a call
  MFI->setHasCalls(true);

  // Analyze operands of the call, assigning locations to each operand.
  SmallVector<CCValAssign, 16> ArgLocs;
  CCState CCInfo(CallConv, isVarArg, MF, getTargetMachine(),
                 ArgLocs, *DAG.getContext());
  CCInfo.AnalyzeCallOperands(Outs, CC_Lemberg);

  // Get a count of how many bytes are to be pushed on the stack.
  unsigned NumBytes = CCInfo.getNextStackOffset();
  
  // Round up to next doubleword boundary
  NumBytes = (NumBytes + 7) & ~7;

  Chain = DAG.getCALLSEQ_START(Chain, DAG.getConstant(NumBytes, MVT::i32, true));

  SmallVector<std::pair<unsigned, SDValue>, 4> RegsToPass;
  SmallVector<SDValue, 12> MemOpChains;
  SDValue StackPtr;
  bool SeenCustom = false;

  // Walk the register/memloc assignments, inserting copies/loads.
  for (unsigned i = 0, argIdx = 0, e = ArgLocs.size(); i != e; ++i, ++argIdx) {
    CCValAssign &VA = ArgLocs[i];
    SDValue Arg = OutVals[argIdx];

    ISD::ArgFlagsTy Flags = Outs[argIdx].Flags;

	if (VA.needsCustom()) {
		SDValue SubRegIdx = DAG.getTargetConstant(SeenCustom ?
												  Lemberg::sub_odd : Lemberg::sub_even,
												  MVT::i32);
		Arg = SDValue(DAG.getMachineNode(TargetOpcode::EXTRACT_SUBREG, DL, MVT::i32,
										 Arg, SubRegIdx), 0);
		if (!SeenCustom) {
			--argIdx; // Visit same OutVals index again
		}
		SeenCustom = !SeenCustom;
	}

    // Promote the value if needed.
    switch (VA.getLocInfo()) {
	default: llvm_unreachable("Unknown loc info!");
      case CCValAssign::Full: break;
      case CCValAssign::BCvt:
        // Arg = DAG.getNode(ISD::BITCAST, DL, VA.getLocVT(), Arg);
		Arg = SDValue(DAG.getMachineNode(TargetOpcode::COPY_TO_REGCLASS, DL, MVT::i32, Arg, 
										 DAG.getTargetConstant(Lemberg::ARegClassID, MVT::i32)), 0);
        break;
      case CCValAssign::SExt:
        Arg = DAG.getNode(ISD::SIGN_EXTEND, DL, VA.getLocVT(), Arg);
        break;
      case CCValAssign::ZExt:
        Arg = DAG.getNode(ISD::ZERO_EXTEND, DL, VA.getLocVT(), Arg);
        break;
      case CCValAssign::AExt:
        Arg = DAG.getNode(ISD::ANY_EXTEND, DL, VA.getLocVT(), Arg);
        break;
    }

    // Arguments that can be passed on register must be kept at RegsToPass
    // vector
    if (VA.isRegLoc()) {
      RegsToPass.push_back(std::make_pair(VA.getLocReg(), Arg));
    } else {
      assert(VA.isMemLoc());

	  if (StackPtr.getNode() == 0) {
		  const LembergRegisterInfo *LRI =
			  (const LembergRegisterInfo *)getTargetMachine().getRegisterInfo();
		  StackPtr = DAG.getCopyFromReg(Chain, DL, LRI->getStackRegister(), MVT::i32);
	  }		  

	  SDValue PtrOff = DAG.getNode(ISD::ADD, DL, MVT::i32, StackPtr,
								   DAG.getIntPtrConstant(VA.getLocMemOffset()));

	  if (Flags.isByVal()) {
		  unsigned Size = Flags.getByValSize();
		  unsigned Align = Flags.getByValAlign();

		  // Check how much is shadowed in the registers
		  unsigned ShadowSize = 0;
		  static const unsigned ShadowRegs[] = { Lemberg::R0, Lemberg::R1, Lemberg::R2, Lemberg::R3 };
		  unsigned ShadowRegIdx = RegsToPass.size();
		  while (ShadowRegIdx < 4 && ShadowSize < Size) {
			  // Partial load to register
			  SDValue ArgOff = DAG.getNode(ISD::ADD, DL, MVT::i32, Arg,
										   DAG.getIntPtrConstant(ShadowSize));
			  SDValue ArgVal = DAG.getLoad(MVT::i32, DL, Chain, ArgOff,
										   MachinePointerInfo(),
										   false, false, false, Align);
			  Chain = ArgVal.getValue(1);

			  RegsToPass.push_back(std::make_pair(ShadowRegs[ShadowRegIdx], ArgVal));

			  // Partial copy of argument
			  SDValue ShadowOff = DAG.getNode(ISD::ADD, DL, MVT::i32, StackPtr,
											  DAG.getIntPtrConstant(VA.getLocMemOffset()-16+4*ShadowRegIdx));
			  Chain = DAG.getStore(Chain, DL, ArgVal, ShadowOff,
								   MachinePointerInfo::getStack(VA.getLocMemOffset()-16+4*ShadowRegIdx),
								   false, false, 0);

			  ++ShadowRegIdx;
			  ShadowSize += 4;
		  }

		  // Copy argument to memory
		  if (ShadowSize < Size) {
			  SDValue ArgOff = DAG.getNode(ISD::ADD, DL, MVT::i32, Arg,
										   DAG.getIntPtrConstant(ShadowSize));
			  SDValue SizeNode = DAG.getConstant(Size-ShadowSize, MVT::i32);
			  Chain = DAG.getMemcpy(Chain, DL, PtrOff, ArgOff, SizeNode, Align,
									false, false, MachinePointerInfo(), MachinePointerInfo());
			  MemOpChains.push_back(Chain);
		  }
	  } else {		  
		  Chain = DAG.getStore(Chain, DL, Arg, PtrOff,
							   MachinePointerInfo::getStack(VA.getLocMemOffset()),
							   false, false, 0);
		  MemOpChains.push_back(Chain);
	  }
    }
  }

  // Transform all store nodes into one single node because all store nodes are
  // independent of each other.
  if (!MemOpChains.empty())
    Chain = DAG.getNode(ISD::TokenFactor, DL, MVT::Other,
                        &MemOpChains[0], MemOpChains.size());

  // Build a sequence of copy-to-reg nodes chained together with token chain and
  // flag operands which copy the outgoing args into registers.  The InFlag in
  // necessary since all emited instructions must be stuck together.
  SDValue InFlag;
  for (unsigned i = 0, e = RegsToPass.size(); i != e; ++i) {
    Chain = DAG.getCopyToReg(Chain, DL, RegsToPass[i].first,
                             RegsToPass[i].second, InFlag);
    InFlag = Chain.getValue(1);
  }

  // A chain & a flag
  SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Glue);

  // Operands for call instruction
  SmallVector<SDValue, 8> Ops;
  Ops.push_back(Chain);
  Ops.push_back(Callee);

  // Add argument registers to the end of the list so that they are
  // known live into the call.
  for (unsigned i = 0, e = RegsToPass.size(); i != e; ++i)
    Ops.push_back(DAG.getRegister(RegsToPass[i].first,
                                  RegsToPass[i].second.getValueType()));

  if (InFlag.getNode())
    Ops.push_back(InFlag);

  // The actual call
  Chain = DAG.getNode(LembergISD::Call, DL, NodeTys, &Ops[0], Ops.size());
  InFlag = Chain.getValue(1);

  // Create the CALLSEQ_END node.
  Chain = DAG.getCALLSEQ_END(Chain,
                             DAG.getConstant(NumBytes, MVT::i32, true),
                             DAG.getConstant(0, MVT::i32, true),
                             InFlag);
  InFlag = Chain.getValue(1);

  // Handle result values, copying them out of physregs into vregs that we
  // return.
  return LowerCallResult(Chain, InFlag, CallConv, isVarArg,
                         Ins, DL, DAG, InVals);
}

/// LowerCallResult - Lower the result values of a call into the
/// appropriate copies out of appropriate physical registers.
///
SDValue
LembergTargetLowering::LowerCallResult(SDValue Chain, SDValue InFlag,
                                     CallingConv::ID CallConv, bool isVarArg,
                                     const SmallVectorImpl<ISD::InputArg> &Ins,
                                     DebugLoc DL, SelectionDAG &DAG,
                                     SmallVectorImpl<SDValue> &InVals) const {

  MachineFunction &MF = DAG.getMachineFunction();

  // Assign locations to each value returned by this call.
  SmallVector<CCValAssign, 16> RVLocs;
  CCState CCInfo(CallConv, isVarArg, MF, getTargetMachine(),
				 RVLocs, *DAG.getContext());

  CCInfo.AnalyzeCallResult(Ins, RetCC_Lemberg);

  // Copy all of the result registers out of their specified physreg.
  for (unsigned i = 0; i != RVLocs.size(); ++i) {
    CCValAssign &VA = RVLocs[i];

    Chain = DAG.getCopyFromReg(Chain, DL, VA.getLocReg(),
                               VA.getLocVT(), InFlag).getValue(1);
    SDValue RetValue = Chain.getValue(0);
    InFlag = Chain.getValue(2);

    // If this is an 8/16-bit value, it is really passed promoted to 32
    // bits. Insert an assert[sz]ext to capture this, then truncate to the
    // right size.
    if (VA.getLocInfo() == CCValAssign::SExt)
      RetValue = DAG.getNode(ISD::AssertSext, DL, VA.getLocVT(), RetValue,
                             DAG.getValueType(VA.getValVT()));
    else if (VA.getLocInfo() == CCValAssign::ZExt)
      RetValue = DAG.getNode(ISD::AssertZext, DL, VA.getLocVT(), RetValue,
                             DAG.getValueType(VA.getValVT()));

    if (VA.getLocInfo() == CCValAssign::SExt || VA.getLocInfo() == CCValAssign::ZExt)
      RetValue = DAG.getNode(ISD::TRUNCATE, DL, VA.getValVT(), RetValue);

    InVals.push_back(RetValue);
  }

  return Chain;
}

std::vector<unsigned> LembergTargetLowering::
getRegClassForInlineAsmConstraint(const std::string &Constraint,
                                  EVT VT) const {
  if (Constraint.size() != 1)
    return std::vector<unsigned>();

  switch (Constraint[0]) {
  default: break;
  case 'r': // Only allow global regs
	  return make_vector<unsigned>(Lemberg::R0, Lemberg::R1, Lemberg::R2, Lemberg::R3,
								   Lemberg::R4, Lemberg::R5, Lemberg::R4, Lemberg::R5,
								   Lemberg::R8, Lemberg::R9, Lemberg::R10, Lemberg::R11,
								   Lemberg::R12, Lemberg::R13, Lemberg::R14, Lemberg::R15, 0);
  case 'f':
	  return make_vector<unsigned>(Lemberg::F0, Lemberg::F1, Lemberg::F2, Lemberg::F3,
								   Lemberg::F4, Lemberg::F5, Lemberg::F4, Lemberg::F5,
								   Lemberg::F8, Lemberg::F9, Lemberg::F10, Lemberg::F11,
								   Lemberg::F12, Lemberg::F13, Lemberg::F14, Lemberg::F15, 0);
  }

  return std::vector<unsigned>();
}
