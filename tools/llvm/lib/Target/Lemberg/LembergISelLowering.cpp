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
#include "llvm/ADT/SmallString.h"
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
#include "llvm/Target/Mangler.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include <sstream>

using namespace llvm;

//===----------------------------------------------------------------------===//
// Calling Convention Implementation
//===----------------------------------------------------------------------===//

static bool CC_Lemberg_Custom_f64(unsigned &ValNo, EVT &ValVT, EVT &LocVT,
								  CCValAssign::LocInfo &LocInfo,
								  ISD::ArgFlagsTy &ArgFlags,
								  CCState &State);

#include "LembergGenCallingConv.inc"

//===----------------------------------------------------------------------===//
// TargetLowering Implementation
//===----------------------------------------------------------------------===//

LembergTargetLowering::LembergTargetLowering(TargetMachine &TM)
  : TargetLowering(TM, new TargetLoweringObjectFileELF()) {

	const LembergRegisterInfo *LRI = (const LembergRegisterInfo *)TM.getRegisterInfo();
	setStackPointerRegisterToSaveRestore(LRI->getStackRegister());
	setShiftAmountType(MVT::i32);
	setIntDivIsCheap(false);
	setBooleanContents(ZeroOrOneBooleanContent);

	// Set up the legal register classes.
	addRegisterClass(MVT::i32,   Lemberg::ARegisterClass);
	addRegisterClass(MVT::i1,    Lemberg::CRegisterClass);
	addRegisterClass(MVT::f32,   Lemberg::FRegisterClass);
	addRegisterClass(MVT::f64,   Lemberg::DRegisterClass);

	computeRegisterProperties();

	// Do not use a constant pool, even for floats
	setOperationAction(ISD::ConstantFP, MVT::f32, Legal);
	setOperationAction(ISD::ConstantFP, MVT::f64, Legal);

	// Custom lowering
	setOperationAction(ISD::GlobalAddress,  MVT::i32, Custom);
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
	setOperationAction(ISD::CTPOP, MVT::i32, Expand);
	setOperationAction(ISD::CTLZ, MVT::i32, Expand);
	setOperationAction(ISD::CTTZ, MVT::i32, Expand);
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
	setOperationAction(ISD::UINT_TO_FP, MVT::i32, Expand);
	setOperationAction(ISD::FP_TO_UINT, MVT::i32, Expand);

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
}

const char *LembergTargetLowering::getTargetNodeName(unsigned Opcode) const {
  switch (Opcode) {
  default: return 0;
  case LembergISD::Carry:      return "LembergISD::Carry";
  case LembergISD::Borrow:     return "LembergISD::Borrow";
  case LembergISD::Mul:        return "LembergISD::Mul";
  case LembergISD::Mask:       return "LembergISD::Mask";
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

unsigned LembergTargetLowering::getRegPressureLimit(const TargetRegisterClass *RC,
													MachineFunction &MF) const {

	switch (RC->getID()) {
	default:
		return 0;

	case Lemberg::L0RegClassID:
	case Lemberg::L1RegClassID:
	case Lemberg::L2RegClassID:
	case Lemberg::L3RegClassID:
		return 15;

	case Lemberg::LG0RegClassID:
	case Lemberg::LG1RegClassID:
	case Lemberg::LG2RegClassID:
	case Lemberg::LG3RegClassID:
		return getTargetMachine().getRegisterInfo()->hasFP(MF) ? 29 : 30;
	case Lemberg::GRegClassID:
		return getTargetMachine().getRegisterInfo()->hasFP(MF) ? 14 : 15;

	case Lemberg::LG0ImmRegClassID:
	case Lemberg::LG1ImmRegClassID:
	case Lemberg::LG2ImmRegClassID:
	case Lemberg::LG3ImmRegClassID:
		return 8;
	case Lemberg::GImmRegClassID:
		return 4;

	case Lemberg::M0RegClassID:
	case Lemberg::M1RegClassID:
	case Lemberg::M2RegClassID:
	case Lemberg::M3RegClassID:
		return 1;
	case Lemberg::MulRegClassID:
		return 4;

	case Lemberg::CRegClassID:
		return 3;
	case Lemberg::FRegClassID:
		return 16;
	case Lemberg::DRegClassID:
		return 8;
	}
}

SDValue LembergTargetLowering::LowerOperation(SDValue Op, SelectionDAG &DAG) const {
  switch (Op.getOpcode()) {
  default:
    Op.getNode()->dump();
    llvm_unreachable("Should not custom lower this!");
  case ISD::GlobalAddress: 
	  return LowerGlobalAddress(Op, DAG);
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
  }
}

SDValue LembergTargetLowering::LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const {
  DebugLoc DL = Op.getDebugLoc();

  const GlobalValue *GV = cast<GlobalAddressSDNode>(Op)->getGlobal();
  return DAG.getNode(LembergISD::Wrapper, DL, MVT::i32,
					 DAG.getTargetGlobalAddress(GV, DL, MVT::i32));
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
							 Add, Op.getOperand(2));
  SDValue Carry = DAG.getNode(CarryOp, DL, MVT::i32,
							  Op.getOperand(0), Op.getOperand(1));
  SDValue Ops[2] = { AddC, Carry };
  return DAG.getMergeValues(Ops, 2, DL);
}

SDValue LembergTargetLowering::LowerLOAD(SDValue Op, SelectionDAG &DAG) const {

  LoadSDNode *LD = cast<LoadSDNode>(Op);
  SDValue Chain = LD->getChain();
  DebugLoc DL = Op.getDebugLoc();

  // Promote bit values
  if (LD->getMemoryVT() == MVT::i1) {	  
	  LD = dyn_cast<LoadSDNode>
		  (DAG.getExtLoad(ISD::EXTLOAD, MVT::i32, DL, Chain,
						  LD->getBasePtr(), LD->getMemOperand()->getValue(), 0, MVT::i8,
						  LD->isVolatile(), LD->isNonTemporal(), LD->getAlignment()));
  }

  ISD::LoadExtType ExtType = LD->getExtensionType();

  // Check whether the access goes to a stack location
  const Value *U = LD->getMemOperand()->getValue()->getUnderlyingObject(0);
  bool isStackLoad = false;
  if (dyn_cast<Instruction>(U))
	  isStackLoad = dyn_cast<Instruction>(U)->getOpcode() == Instruction::Alloca;

  assert(LD->getOffset().getOpcode() == ISD::UNDEF && "Assumed undefined offset");

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
  SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Flag);
  SDVTList WaitLoadTys = DAG.getVTList(MVT::i32, MVT::Other, MVT::Flag);

  if (LD->getMemoryVT() != MVT::f64) {
	  // Create node for load
	  SDValue Ops [] = { Chain, LD->getBasePtr(), LD->getOffset() };

	  Chain = DAG.getMemIntrinsicNode(isStackLoad ? LembergISD::LoadStack : LembergISD::Load,
									  DL, NodeTys, Ops, 3, MVT::i32, NULL, 0,
									  LD->getAlignment(), LD->isVolatile(),
									  true, false);
	  SDValue Flag = Chain.getValue(1);

	  // Read result from load via LDX
	  Chain = DAG.getNode(LembergISD::WaitLoad, DL, WaitLoadTys,
						  Chain, DAG.getRegister(MemReg, MVT::i32), WordOffset, Flag);

	  if (LD->getMemoryVT() == MVT::f32) {
	   	  SDValue Converted = DAG.getNode(ISD::BIT_CONVERT, DL, MVT::f32, Chain);
		  SDValue MergeOps [] = { Converted, Chain.getOperand(0) };
		  Chain = DAG.getMergeValues(MergeOps, 2, DL);
	  }
  } else {
	  // Create node for load of low part
	  SDValue OpsLo [] = { Chain, LD->getBasePtr(), LD->getOffset() };
	  Chain = DAG.getMemIntrinsicNode(isStackLoad ? LembergISD::LoadStack : LembergISD::Load,
									  DL, NodeTys, OpsLo, 3, MVT::i32,
									  NULL, 0, 4, LD->isVolatile(), true, false);
	  SDValue Flag = Chain.getValue(1);

	  // Read result from load via LDX
	  SDVTList WaitLoadTys = DAG.getVTList(MVT::i32, MVT::Other, MVT::Flag);
	  SDValue Lo = DAG.getNode(LembergISD::WaitLoad, DL, WaitLoadTys,
							   Chain, DAG.getRegister(MemReg, MVT::i32), WordOffset, Flag);
	  Chain = Lo.getValue(1);
	  Flag = Lo.getValue(2);
	  Lo = DAG.getNode(ISD::BIT_CONVERT, DL, MVT::f32, Lo);

	  // Create node for load of high part
	  SDValue OpsHi [] = { Chain, DAG.getNode(ISD::ADD, DL, MVT::i32,
											  LD->getBasePtr(), 
											  DAG.getConstant(4, MVT::i32)), LD->getOffset() };
	  Chain = DAG.getMemIntrinsicNode(isStackLoad ? LembergISD::LoadStack : LembergISD::Load,
									  DL, NodeTys, OpsHi, 3, MVT::i32,
									  NULL, 0, 4, LD->isVolatile(), true, false);
	  Flag = Chain.getValue(1);
	  
	  // Read result from load via LDX
	  SDValue Hi = DAG.getNode(LembergISD::WaitLoad, DL, WaitLoadTys,
							   Chain, DAG.getRegister(MemReg, MVT::i32), WordOffset, Flag);
	  Hi = DAG.getNode(ISD::BIT_CONVERT, DL, MVT::f32, Hi);
	  
	  SDNode *Undef = DAG.getMachineNode(TargetOpcode::IMPLICIT_DEF, DL, MVT::f64);
	  SDNode *InsertLo = DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
											SDValue(Undef, 0), Lo, 
											DAG.getTargetConstant(Lemberg::sub_even, MVT::i32));

	  Chain = SDValue(DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL,
										 MVT::f64, MVT::Other, MVT::Flag,
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
  SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Flag);

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
	  SDValue Converted = DAG.getNode(ISD::BIT_CONVERT, DL, MVT::i32, ST->getValue());
	  ST = dyn_cast<StoreSDNode>
		  (DAG.getStore(Chain, DL,
						Converted, ST->getBasePtr(), ST->getMemOperand()).getNode());
  }

  bool isStackStore = false;

  if (ST->getMemOperand()->getValue()) {
	  // Check whether the access goes to a non-escaping stack location
	  const Value *U = ST->getMemOperand()->getValue()->getUnderlyingObject(0);

	  if (dyn_cast<Instruction>(U))
		  isStackStore = dyn_cast<Instruction>(U)->getOpcode() == Instruction::Alloca;

	  // Calls, returns and stores may lead to escaping
	  // TODO: only stores that use the stack address as _value_ may lead to escapes
	  for (Value::const_use_iterator I = U->use_begin(), E = U->use_end();
		   isStackStore && I != E; ++I) {
		  // Check direct uses
		  const Instruction *II = dyn_cast<Instruction>(*I);
		  if (II->getOpcode() == Instruction::Call 
			  || II->getOpcode() == Instruction::Ret
			  || II->getOpcode() == Instruction::Store) {
			  isStackStore = false;
		  }
		  for (Value::const_use_iterator SI = I->use_begin(), SE = I->use_end();
			   isStackStore && SI != SE; ++SI) {
			  // Check indirect uses
			  const Instruction *SII = dyn_cast<Instruction>(*SI);
			  if (SII->getOpcode() == Instruction::Call
				  || SII->getOpcode() == Instruction::Ret
				  || SII->getOpcode() == Instruction::Store) {
				  isStackStore = false;
			  }
		  }
	  }
  }

  // Create node for store
  if (ST->getMemoryVT() != MVT::f64) {
	  // Normal store
	  SDValue Ops [] = { Chain, ST->getValue(), ST->getBasePtr(), ST->getOffset() };
	  Chain = DAG.getMemIntrinsicNode(isStackStore ? LembergISD::StoreStack : LembergISD::Store,
									  DL, NodeTys, Ops, 4, ST->getMemoryVT(),
									  ST->getSrcValue(), ST->getSrcValueOffset(),
									  ST->getAlignment(), ST->isVolatile(),
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
									  ST->getSrcValue(), ST->getSrcValueOffset(),
									  4, ST->isVolatile(), false, true);

	  SDValue OpsHi [] =  { Chain, Hi, DAG.getNode(ISD::ADD, DL, MVT::i32,
												   ST->getBasePtr(), 
												   DAG.getConstant(4, MVT::i32)), ST->getOffset() };

	  Chain = DAG.getMemIntrinsicNode(isStackStore ? LembergISD::StoreStack : LembergISD::Store,
									  DL, NodeTys, OpsHi, 4, MVT::i32, 
									  ST->getSrcValue(), ST->getSrcValueOffset()+4,
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
  return DAG.getStore(Op.getOperand(0), DL, FR, Op.getOperand(1), SV, 0,
                      false, false, 0);
}

// f64 is in register pairs, possibly split to stack
static bool CC_Lemberg_Custom_f64(unsigned &ValNo, EVT &ValVT, EVT &LocVT,
								  CCValAssign::LocInfo &LocInfo,
								  ISD::ArgFlagsTy &ArgFlags,
								  CCState &State) {
  static const unsigned RegList[] = { Lemberg::R0, Lemberg::R1,
									  Lemberg::R2, Lemberg::R3 };

  // Try to get the first register.
  if (unsigned Reg = State.AllocateReg(RegList, 4))
	  State.addLoc(CCValAssign::getCustomReg(ValNo, MVT::i32, Reg, MVT::i32, LocInfo));
  else {
	  State.addLoc(CCValAssign::getCustomMem(ValNo, MVT::i32,
											 State.AllocateStack(4, 4),
											 MVT::i32, LocInfo));
  }

  // Try to get the second register.
  if (unsigned Reg = State.AllocateReg(RegList, 4))
	  State.addLoc(CCValAssign::getCustomReg(ValNo, MVT::i32, Reg, MVT::i32, LocInfo));
  else
	  State.addLoc(CCValAssign::getCustomMem(ValNo, MVT::i32,
											 State.AllocateStack(4, 4),
											 MVT::i32, LocInfo));
  return true;
}

// TODO: remove magic constants for handling of varargs
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
  CCState CCInfo(CallConv, isVarArg, getTargetMachine(),
                 ArgLocs, *DAG.getContext());
  CCInfo.AnalyzeFormalArguments(Ins, CC_Lemberg);

  unsigned RegArgs = 0;

  for (unsigned i = 0, e = ArgLocs.size(); i != e; ++i) {
    CCValAssign &VA = ArgLocs[i];

    if (VA.isRegLoc()) {
      RegArgs++;

      EVT RegVT = VA.getLocVT();
      TargetRegisterClass *RC = Lemberg::ARegisterClass;

      assert(RC->contains(VA.getLocReg()) && "Unexpected regclass in CCState");

      unsigned Reg = MF.getRegInfo().createVirtualRegister(RC);
      MF.getRegInfo().addLiveIn(VA.getLocReg(), Reg);
      SDValue ArgValue = DAG.getCopyFromReg(Chain, DL, Reg, RegVT);

      if (VA.needsCustom()) {
		  assert(i+1 < e);
		  CCValAssign &VAHi = ArgLocs[++i];

		  SDValue ArgValueHi;

		  if (VAHi.isRegLoc()) {
			  RegArgs++;
			  unsigned RegHi = MF.getRegInfo().createVirtualRegister(RC);
			  MF.getRegInfo().addLiveIn(VAHi.getLocReg(), RegHi);
			  ArgValueHi = DAG.getCopyFromReg(Chain, DL, RegHi, VAHi.getLocVT());
		  } else {
			  assert(VAHi.isMemLoc() && "CCValAssign must be RegLoc or MemLoc");
			  int FIHi = MFI->CreateFixedObject(4, VAHi.getLocMemOffset() + (isVarArg ? 4*4 : 0),
												true);
			  SDValue FINHi = DAG.getFrameIndex(FIHi, MVT::i32);
			  ArgValueHi = DAG.getLoad(MVT::i32, DL, Chain, FINHi, NULL, 0,
									   false, false, 0);
		  }

		  ArgValue = DAG.getNode(ISD::BIT_CONVERT, DL, MVT::f32, ArgValue);
		  ArgValueHi = DAG.getNode(ISD::BIT_CONVERT, DL, MVT::f32, ArgValueHi);

		  SDNode *Undef = DAG.getMachineNode(TargetOpcode::IMPLICIT_DEF, DL, MVT::f64);
		  SDNode *InsertLo = DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
												SDValue(Undef, 0), ArgValue, 
												DAG.getTargetConstant(Lemberg::sub_even, MVT::i32));
		  ArgValue = SDValue(DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL,
												MVT::f64, MVT::Other, MVT::Flag,
												SDValue(InsertLo, 0), ArgValueHi,
												DAG.getTargetConstant(Lemberg::sub_odd, MVT::i32)), 0);
	  }

      // If this is an 8 or 16-bit value, it is really passed promoted to 32
      // bits.  Insert an assert[sz]ext to capture this, then truncate to the
      // right size.
      if (VA.getLocInfo() == CCValAssign::SExt)
        ArgValue = DAG.getNode(ISD::AssertSext, DL, RegVT, ArgValue,
                               DAG.getValueType(VA.getValVT()));
      else if (VA.getLocInfo() == CCValAssign::ZExt)
        ArgValue = DAG.getNode(ISD::AssertZext, DL, RegVT, ArgValue,
                               DAG.getValueType(VA.getValVT()));

      if (VA.getLocInfo() == CCValAssign::SExt || VA.getLocInfo() == CCValAssign::ZExt)
        ArgValue = DAG.getNode(ISD::TRUNCATE, DL, VA.getValVT(), ArgValue);

      InVals.push_back(ArgValue);

    } else {
      assert(VA.isMemLoc() && "CCValAssign must be RegLoc or MemLoc");
      int FI = MFI->CreateFixedObject(4, VA.getLocMemOffset() + (isVarArg ? 4*4 : 0),
									  true);
      SDValue FIN = DAG.getFrameIndex(FI, MVT::i32);
	  SDValue ArgValue = DAG.getLoad(VA.getValVT(), DL, Chain, FIN, NULL, 0, false, false, 0);
	  
	  if (VA.needsCustom()) {
		  assert(i+1 < e);
		  CCValAssign &VAHi = ArgLocs[++i];
		  
		  int FIHi = MFI->CreateFixedObject(4, VAHi.getLocMemOffset() + (isVarArg ? 4*4 : 0), true);
		  SDValue FINHi = DAG.getFrameIndex(FIHi, MVT::i32);
		  SDValue ArgValueHi = DAG.getLoad(MVT::i32, DL, Chain, FINHi, NULL, 0,
										   false, false, 0);
		  
		  ArgValue = DAG.getNode(ISD::BIT_CONVERT, DL, MVT::f32, ArgValue);
		  ArgValueHi = DAG.getNode(ISD::BIT_CONVERT, DL, MVT::f32, ArgValueHi);
		  
		  SDNode *Undef = DAG.getMachineNode(TargetOpcode::IMPLICIT_DEF, DL, MVT::f64);
		  SDNode *InsertLo = DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
												SDValue(Undef, 0), ArgValue, 
												DAG.getTargetConstant(Lemberg::sub_even, MVT::i32));
		  ArgValue = SDValue(DAG.getMachineNode(TargetOpcode::INSERT_SUBREG, DL, MVT::f64,
												SDValue(InsertLo, 0), ArgValueHi,
												DAG.getTargetConstant(Lemberg::sub_odd, MVT::i32)), 0);
	  }

      InVals.push_back(ArgValue);
    }
  }

  if (isVarArg) {

    std::vector<SDValue> OutChains;
	static const unsigned ArgRegs[] =
		{ Lemberg::R0, Lemberg::R1, Lemberg::R2, Lemberg::R3 };

	// Store remaining ArgRegs to the stack if this is a varargs function.
	for (unsigned i = RegArgs; i < 4; ++i) {
		unsigned VReg = MF.getRegInfo().createVirtualRegister(Lemberg::ARegisterClass);
		MF.getRegInfo().addLiveIn(ArgRegs[i], VReg);
		SDValue Arg = DAG.getCopyFromReg(DAG.getRoot(), DL, VReg, MVT::i32);

		int FrameIdx = MF.getFrameInfo()->CreateFixedObject(4, i*4, true);
		SDValue FIPtr = DAG.getFrameIndex(FrameIdx, MVT::i32);
		OutChains.push_back(DAG.getStore(DAG.getRoot(), DL, Arg, FIPtr,
										 PseudoSourceValue::getStack(),
										 0, false, false, 0));

		// Remember the first vararg offset for the va_start implementation.
		if (i == RegArgs) {
			FuncInfo->setVarArgsFrameIndex(FrameIdx);
		}
    }

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

  // CCValAssign - represent the assignment of the return value to locations.
  SmallVector<CCValAssign, 16> RVLocs;

  // CCState - Info about the registers and stack slot.
  CCState CCInfo(CallConv, isVarArg, DAG.getTarget(),
                 RVLocs, *DAG.getContext());

  // Analize return values.
  CCInfo.AnalyzeReturn(Outs, RetCC_Lemberg);

  // If this is the first return lowered for this function, add the regs to the
  // liveout set for the function.
  if (DAG.getMachineFunction().getRegInfo().liveout_empty()) {
    for (unsigned i = 0; i != RVLocs.size(); ++i)
      DAG.getMachineFunction().getRegInfo().addLiveOut(RVLocs[i].getLocReg());
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

  // A chain & a flag
  SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Flag);

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
                               bool &isTailCall,
                               const SmallVectorImpl<ISD::OutputArg> &Outs,
                               const SmallVectorImpl<SDValue> &OutVals,
                               const SmallVectorImpl<ISD::InputArg> &Ins,
                               DebugLoc DL, SelectionDAG &DAG,
                               SmallVectorImpl<SDValue> &InVals) const {
  // Lemberg target does not yet support tail call optimization.
  isTailCall = false;

  // The current function obviously contains a call
  DAG.getMachineFunction().getFrameInfo()->setHasCalls(true);

  // Analyze operands of the call, assigning locations to each operand.
  SmallVector<CCValAssign, 16> ArgLocs;
  CCState CCInfo(CallConv, isVarArg, getTargetMachine(),
                 ArgLocs, *DAG.getContext());
  CCInfo.AnalyzeCallOperands(Outs, CC_Lemberg);

  // Get a count of how many bytes are to be pushed on the stack.
  unsigned NumBytes = CCInfo.getNextStackOffset();

  Chain = DAG.getCALLSEQ_START(Chain, DAG.getConstant(NumBytes, MVT::i32, true));

  SmallVector<std::pair<unsigned, SDValue>, 4> RegsToPass;
  SmallVector<SDValue, 12> MemOpChains;
  SDValue StackPtr;
  bool SeenCustom = false;

  // Walk the register/memloc assignments, inserting copies/loads.
  for (unsigned i = 0, k = 0, e = ArgLocs.size(); i != e; ++i, ++k) {
    CCValAssign &VA = ArgLocs[i];
    SDValue Arg = OutVals[k];

	if (VA.needsCustom()) {
		SDValue SubRegIdx = DAG.getTargetConstant(SeenCustom ?
												  Lemberg::sub_odd : Lemberg::sub_even,
												  MVT::i32);
		Arg = SDValue(DAG.getMachineNode(TargetOpcode::EXTRACT_SUBREG, DL, MVT::i32,
										 Arg, SubRegIdx), 0);
		if (!SeenCustom) k--; // Visit same OutVals index again
		SeenCustom = !SeenCustom;
	}

    // Promote the value if needed.
    switch (VA.getLocInfo()) {
      default: assert(0 && "Unknown loc info!");
      case CCValAssign::Full: break;
      case CCValAssign::BCvt:
        Arg = DAG.getNode(ISD::BIT_CONVERT, DL, VA.getLocVT(), Arg);
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

      MemOpChains.push_back(DAG.getStore(Chain, DL, Arg, PtrOff,
                                         PseudoSourceValue::getStack(), 0,
                                         false, false, 0));
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
  SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Flag);

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

  // Assign locations to each value returned by this call.
  SmallVector<CCValAssign, 16> RVLocs;
  CCState CCInfo(CallConv, isVarArg, getTargetMachine(), RVLocs,
                 *DAG.getContext());

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
