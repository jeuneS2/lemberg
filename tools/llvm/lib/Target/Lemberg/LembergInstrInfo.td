//===- LembergInstrInfo.td - Lemberg Instruction defs ------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction format superclass
//===----------------------------------------------------------------------===//

include "LembergInstrFormats.td"

//===----------------------------------------------------------------------===//
// Lemberg patterns and nodes
//===----------------------------------------------------------------------===//

// Predicate when using only a 22-bit code space
def SmallCode : Predicate<"TM.getCodeModel() == CodeModel::Small">;

// Helper fragment for condition inversion
def notcc  : PatFrag<(ops node:$in), (i1 (setne node:$in, (i1 -1)))>;

class Pseudo<dag outs, dag ins, string asmstr, list<dag> pattern>
    : InstLemberg<outs, ins, asmstr, pattern, IINone>;

// Lemberg predicate operand. Default to -1 = always. Second part is
// condition register.
def pred : PredicateOperand<OtherVT, (ops i32imm, C),
							(ops (i32 -1), (i32 zero_reg))> {
  let PrintMethod = "printPredicateOperand";
}

// These are target-independent nodes, but have target-specific formats.
def SDT_LembergCallSeqStart : SDCallSeqStart<[SDTCisVT<0, i32>]>;
def SDT_LembergCallSeqEnd   : SDCallSeqEnd<[SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;

def callseq_start : SDNode<"ISD::CALLSEQ_START", SDT_LembergCallSeqStart,
                           [SDNPHasChain, SDNPOutGlue]>;
def callseq_end   : SDNode<"ISD::CALLSEQ_END", SDT_LembergCallSeqEnd,
                           [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue]>;

// Call
def SDT_LembergCall : SDTypeProfile<0, 1, [SDTCisVT<0, i32>]>;
def LembergCall : SDNode<"LembergISD::Call", SDT_LembergCall,
						 [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue, SDNPVariadic]>;
// Return
def SDT_LembergReturn : SDTypeProfile<0, 0, []>;
def LembergReturn : SDNode<"LembergISD::Return", SDT_LembergReturn,
						   [SDNPHasChain, SDNPOptInGlue]>;
// Carry and Borrow
def LembergCarry: SDNode<"LembergISD::Carry", SDTIntBinOp,
						 [SDNPCommutative]>;
def LembergBorrow: SDNode<"LembergISD::Borrow", SDTIntBinOp,
						  [SDNPCommutative]>;
// Multplication is a little special
def LembergMul: SDNode<"LembergISD::Mul", SDTIntBinOp,
					   [SDNPCommutative, SDNPAssociative]>;

// Masking
def SDT_LembergMask : SDTypeProfile<1, 2, [SDTCisVT<0, i32>, SDTCisVT<2, i32>]>;
def LembergMask: SDNode<"LembergISD::Mask", SDT_LembergMask, []>;

// Magic
def SDT_LembergWrapper : SDTypeProfile<1, 1, [SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;
def LembergWrapper: SDNode<"LembergISD::Wrapper", SDT_LembergWrapper, []>;

// WaitLoad
def SDT_LembergWaitLoad : SDTypeProfile<1, 2, [SDTCisVT<0, i32>, SDTCisVT<1, i32>, SDTCisVT<2, i32>]>;
def LembergWaitLoad : SDNode<"LembergISD::WaitLoad", SDT_LembergWaitLoad,
							 [SDNPHasChain, SDNPOutGlue, SDNPInGlue, SDNPSideEffect]>;

// Load
def SDT_LembergLoad : SDTypeProfile<0, 1, [SDTCisVT<0, i32>]>;
def LembergLoad : SDNode<"LembergISD::Load", SDT_LembergLoad,
						 [SDNPHasChain, SDNPMayLoad, SDNPOutGlue, SDNPMemOperand]>;
def LembergLoadStack : SDNode<"LembergISD::LoadStack", SDT_LembergLoad,
							  [SDNPHasChain, SDNPMayLoad, SDNPOutGlue, SDNPMemOperand]>;

// Cached and volatile loads
def LembergLoadCached : PatFrag<(ops node:$ptr),
								(LembergLoad node:$ptr), [{
  return !cast<MemSDNode>(N)->isVolatile();
}]>;
def LembergLoadVolatile : PatFrag<(ops node:$ptr),
								  (LembergLoad node:$ptr), [{
  return cast<MemSDNode>(N)->isVolatile();
}]>;

// Store
def SDT_LembergStore : SDTypeProfile<0, 2, [SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;
def LembergStore : SDNode<"LembergISD::Store", SDT_LembergStore,
						  [SDNPHasChain, SDNPMayStore, SDNPOutGlue, SDNPMemOperand]>;
def LembergStoreStack : SDNode<"LembergISD::StoreStack", SDT_LembergStore,
							   [SDNPHasChain, SDNPMayStore, SDNPOutGlue, SDNPMemOperand]>;

// Stores of different widths
def LembergStore8 : PatFrag<(ops node:$val, node:$ptr),
							(LembergStore node:$val, node:$ptr), [{
  return cast<MemSDNode>(N)->getMemoryVT() == MVT::i8;
}]>;
def LembergStoreStack8 : PatFrag<(ops node:$val, node:$ptr),
								 (LembergStoreStack node:$val, node:$ptr), [{
  return cast<MemSDNode>(N)->getMemoryVT() == MVT::i8;
}]>;
def LembergStore16 : PatFrag<(ops node:$val, node:$ptr),
							 (LembergStore node:$val, node:$ptr), [{
  return cast<MemSDNode>(N)->getMemoryVT() == MVT::i16;
}]>;
def LembergStoreStack16 : PatFrag<(ops node:$val, node:$ptr),
								  (LembergStoreStack node:$val, node:$ptr), [{
  return cast<MemSDNode>(N)->getMemoryVT() == MVT::i16;
}]>;
def LembergStore32 : PatFrag<(ops node:$val, node:$ptr),
							 (LembergStore node:$val, node:$ptr), [{
  EVT Ty = cast<MemSDNode>(N)->getMemoryVT();
  return (Ty == MVT::i32) || (Ty == MVT::f32);
}]>;
def LembergStoreStack32 : PatFrag<(ops node:$val, node:$ptr),
								  (LembergStoreStack node:$val, node:$ptr), [{
  EVT Ty = cast<MemSDNode>(N)->getMemoryVT();
  return (Ty == MVT::i32) || (Ty == MVT::f32);
}]>;

// Write back stack cache
def SDT_LembergWriteBack : SDTypeProfile<0, 2, [SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;
def LembergWriteBack : SDNode<"LembergISD::WriteBack", SDT_LembergWriteBack,
							  [SDNPSideEffect, SDNPMayStore, SDNPHasChain]>;

//===----------------------------------------------------------------------===//
// Lemberg transformation functions
//===----------------------------------------------------------------------===//

// Transformation Function - get the lower 11 bits.
def low11 : SDNodeXForm<imm, [{
  return getI32Imm((unsigned)N->getZExtValue() & 0x7ff);
}]>;

// Transformation Function - get the middle 11 bits.
def mid11 : SDNodeXForm<imm, [{
 return getI32Imm(((unsigned)N->getZExtValue() >> 11) & 0x7ff);
}]>;

// Transformation Function - get the middle 10 bits
def mid10 : SDNodeXForm<imm, [{
 return getI32Imm(((unsigned)N->getZExtValue() >> 11) & 0x3ff);
}]>;

// Transformation Function - get the upper 11 bits.
def high11 : SDNodeXForm<imm, [{
 return getI32Imm(((unsigned)N->getZExtValue() >> 21) & 0x7ff);
}]>;

// Transformation Function - get the lower 21 bits.
def low21 : SDNodeXForm<imm, [{
  return getI32Imm((unsigned)N->getZExtValue() & 0x1fffff);
}]>;

// Transformation Function - count trailing zeros.
def trailingZeros : SDNodeXForm<imm, [{
 return CurDAG->getTargetConstant(N->getAPIntValue().countTrailingZeros(), 
								  MVT::i32);
}]>;

// Transformation Function - count trailing zeros.
def trailingOnes : SDNodeXForm<imm, [{
 return CurDAG->getTargetConstant(N->getAPIntValue().countTrailingOnes(), 
								  MVT::i32);
}]>;

// Transformation Function - shift right by one/two bits
def shrOne : SDNodeXForm<imm, [{
 return CurDAG->getTargetConstant(N->getZExtValue() >> 1, MVT::i32);
}]>;
def shrTwo : SDNodeXForm<imm, [{
 return CurDAG->getTargetConstant(N->getZExtValue() >> 2, MVT::i32);
}]>;

// Transformation Function - negate
def negate : SDNodeXForm<imm, [{
 return CurDAG->getTargetConstant(- N->getAPIntValue(), MVT::i32);
}]>;

// Transformation Functions
def fpbits32 : SDNodeXForm<fpimm, [{
 return CurDAG->getTargetConstant
	 (FloatToBits(N->getValueAPF().convertToFloat()), MVT::i32);
}]>;
def fpbits64lo : SDNodeXForm<fpimm, [{
 return CurDAG->getTargetConstant
	 (DoubleToBits(N->getValueAPF().convertToDouble()) & 0xffffffff, MVT::i32);
}]>;
def fpbits64hi : SDNodeXForm<fpimm, [{
 return CurDAG->getTargetConstant
	 (DoubleToBits(N->getValueAPF().convertToDouble()) >> 32, MVT::i32);
}]>;

//===----------------------------------------------------------------------===//
// Addressing frame
//===----------------------------------------------------------------------===//

// Addressing modes
def addr : ComplexPattern<i32, 2, "SelectAddr", [add, frameindex], []>;

// Address operands
def mem : Operand<i32> {
  let PrintMethod = "printMemoryOperand";
  let MIOperandInfo = (ops i32imm, i32imm);
}

//===----------------------------------------------------------------------===//
// Special operand types
//===----------------------------------------------------------------------===//

def imm5     : PatLeaf<(imm), [{return isInt<5>(N->getSExtValue());}]>;
def uimm5    : PatLeaf<(imm), [{return isUInt<5>(N->getZExtValue());}]>;
def imm10    : PatLeaf<(imm), [{return isInt<10>(N->getSExtValue());}]>;
def imm11    : PatLeaf<(imm), [{return isInt<11>(N->getSExtValue());}]>;
def uimm11   : PatLeaf<(imm), [{return isUInt<11>(N->getZExtValue());}]>;
def imm22    : PatLeaf<(imm), [{return isInt<22>(N->getSExtValue());}]>;
def uimm19s2 : PatLeaf<(imm), [{return ((N->getSExtValue() & 0x03) == 0)
								   && isInt<19>(N->getZExtValue() >> 2);}]>;
def imm32s2  : PatLeaf<(imm), [{return (N->getZExtValue() & 0x03) == 0;}]>;

def fpimm0    : PatLeaf<(fpimm), [{return N->isExactlyValue(+0.0);}]>;
def fpimm0neg : PatLeaf<(fpimm), [{return N->isExactlyValue(-0.0);}]>;

def brtarget : Operand<OtherVT>;

// 32-bit bitmask transformed to a bit number
def uimm5mask : Operand<i32>, PatLeaf<(imm), [{
 return isPowerOf2_32(N->getZExtValue());
}], trailingZeros>;

// 32-bit inverse bitmask transformed to a bit number
def uimm5imask : Operand<i32>, PatLeaf<(imm), [{
 return isPowerOf2_32(~N->getZExtValue());
}], trailingOnes>;

// 5 bit value, shifted by one bit (for 16-bit stores)
def uimm5s1 : Operand<i32>, PatLeaf<(imm), [{
 return isUInt<5>(N->getZExtValue() >> 1) && ((N->getZExtValue() & 0x01) == 0);
}], shrOne>;
// 5 bit value, shifted by two bits (for 32-bit stores)
def uimm5s2 : Operand<i32>, PatLeaf<(imm), [{
 return isUInt<5>(N->getZExtValue() >> 2) && ((N->getZExtValue() & 0x03) == 0);
}], shrTwo>;

// negated unsigned 5 bit value
def neg_uimm5 : Operand<i32>, PatLeaf<(imm), [{
 return isUInt<5>(-N->getSExtValue());
}], negate>;

//===----------------------------------------------------------------------===//
// Patterns to expand to variants of operations
//===----------------------------------------------------------------------===//

multiclass OP3<SDNode opnode, string opstr, PatLeaf immtype> {

	def aaa : F1<(outs A:$dst), (ins pred:$p, A:$src1, A:$src2),
		!strconcat("$p ", !strconcat(opstr, "\t$src1, $src2 -> $dst")),
		[(set A:$dst, (opnode A:$src1, A:$src2))],
		IIAlu>;
	def aia : F1<(outs A:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
		!strconcat("$p ", !strconcat(opstr, "\t$src1, $src2 -> $dst")),
		[(set A:$dst, (opnode A:$src1, (i32 immtype:$src2)))],
		IIAlu>;
}

multiclass OPCMP<PatFrag opnode, PatFrag revnode, string opstr, PatLeaf immtype> {

	def aac : F1<(outs C:$dst), (ins pred:$p, A:$src1, A:$src2),
		!strconcat("$p ", !strconcat(opstr, "\t$src1, $src2 -> $dst")),
		[(set C:$dst, (opnode A:$src1, A:$src2))],
		IIAlu>;
	def aic : F1<(outs C:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
		!strconcat("$p ", !strconcat(opstr, "\t$src1, $src2 -> $dst")),
		[(set C:$dst, (opnode A:$src1, (i32 immtype:$src2)))],
		IIAlu>;
	def aan : F1<(outs C:$dst), (ins pred:$p, A:$src1, A:$src2),
		!strconcat("$p ", !strconcat(opstr, "\t$src1, $src2 -> $dst")),
		[(set C:$dst, (revnode A:$src2, A:$src1))],
		IIAlu>;
	def ain : F1<(outs C:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
		!strconcat("$p ", !strconcat(opstr, "\t$src1, $src2 -> $dst")),
		[(set C:$dst, (revnode (i32 immtype:$src2), A:$src1))],
		IIAlu>;
}

multiclass OPST4<PatFrag opnode, string opstr> {

	def p : F1<(outs), (ins pred:$p, A:$val, A:$ptr),
               !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, 0")),
               [(opnode A:$val, A:$ptr)],
		       IIMem>;
	def pi : F1<(outs), (ins pred:$p, A:$val, A:$ptr, i32imm:$off),
		        !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, $off")),
		        [(opnode A:$val, (add A:$ptr, (i32 uimm5s2:$off)))],
		        IIMem>;
	def p_imm : F1<(outs), (ins pred:$p, A:$val, A:$ptr),
                   !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, 0")),
                   [(opnode imm5:$val, A:$ptr)],
		           IIMem>;
	def pi_imm : F1<(outs), (ins pred:$p, i32imm:$val, A:$ptr, i32imm:$off),
		            !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, $off")),
		            [(opnode imm5:$val, (add A:$ptr, (i32 uimm5s2:$off)))],
		            IIMem>;
}

multiclass OPST2<PatFrag opnode, string opstr> {

	def p : F1<(outs), (ins pred:$p, A:$val, A:$ptr),
               !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, 0")),
               [(opnode A:$val, A:$ptr)],
		       IIMem>;
	def pi : F1<(outs), (ins pred:$p, A:$val, A:$ptr, i32imm:$off),
		        !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, $off")),
		        [(opnode A:$val, (add A:$ptr, (i32 uimm5s1:$off)))],
		        IIMem>;
	def p_imm : F1<(outs), (ins pred:$p, A:$val, A:$ptr),
                   !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, 0")),
                   [(opnode imm5:$val, A:$ptr)],
		           IIMem>;
	def pi_imm : F1<(outs), (ins pred:$p, i32imm:$val, A:$ptr, i32imm:$off),
		            !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, $off")),
		            [(opnode imm5:$val, (add A:$ptr, (i32 uimm5s1:$off)))],
		            IIMem>;
}

multiclass OPST1<PatFrag opnode, string opstr> {

	def p : F1<(outs), (ins pred:$p, A:$val, A:$ptr),
               !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, 0")),
               [(opnode A:$val, A:$ptr)],
		       IIMem>;
	def pi : F1<(outs), (ins pred:$p, A:$val, A:$ptr, i32imm:$off),
		        !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, $off")),
		        [(opnode A:$val, (add A:$ptr, (i32 uimm5:$off)))],
		        IIMem>;
	def p_imm : F1<(outs), (ins pred:$p, A:$val, A:$ptr),
                   !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, 0")),
                   [(opnode imm5:$val, A:$ptr)],
		           IIMem>;
	def pi_imm : F1<(outs), (ins pred:$p, i32imm:$val, A:$ptr, i32imm:$off),
		            !strconcat("$p ", !strconcat(opstr, "\t$val, $ptr, $off")),
		            [(opnode imm5:$val, (add A:$ptr, (i32 uimm5:$off)))],
		            IIMem>;
}

multiclass OPST_MATCH<PatFrag opnode, string opstr> {

	def _match: Pseudo<(outs), (ins A:$val, mem:$ptr),
		               !strconcat("${:comment} ", !strconcat(opstr, "\t$val, $ptr")),
		               [(opnode A:$val, addr:$ptr)]>;
	def _match_imm: Pseudo<(outs), (ins i32imm:$val, mem:$ptr),
                           !strconcat("${:comment} ", !strconcat(opstr, "\t$val, $ptr")),
		                   [(opnode imm5:$val, addr:$ptr)]>;
}

//===----------------------------------------------------------------------===//
// Lemberg Instructions
//===----------------------------------------------------------------------===//

// Simple moves
let neverHasSideEffects = 1 in {
	def MOVEaa: F1<(outs A:$dst), (ins pred:$p, A:$src), "$p or\t$src, 0 -> $dst", [], IIAlu>;
    def MOVExa: F1<(outs A:$dst), (ins pred:$p, X:$src), "$p ldx\t$$$src, 0 -> $dst", [], IIAlu>;
    def MOVEax: F1<(outs X:$dst), (ins pred:$p, A:$src), "$p stx\t$src -> $$$dst", [], IIAlu>;
}

// Load special register, to be used when loading memory results to simplify scheduling
def LDXa : F1<(outs A:$dst), (ins pred:$p, Mem:$src, A:$off),
			  "$p ldx\t$$$src, $off -> $dst",
			  [(set A:$dst, (LembergWaitLoad Mem:$src, A:$off))], 
			  IIAlu>;
def LDXi : F1<(outs A:$dst), (ins pred:$p, Mem:$src, i32imm:$off),
			  "$p ldx\t$$$src, $off -> $dst",
			  [(set A:$dst, (LembergWaitLoad Mem:$src, uimm5:$off))], 
			  IIAlu>;

// Memory loads
let Defs = [MEM, MEMHU, MEMHS, MEMBU, MEMBS] in {

  // Normal loads
  def LOAD32fp: F1<(outs), (ins pred:$p, A:$ptr),
 				   "$p ldm.f\t$ptr, 0",
				   [(LembergLoadCached A:$ptr)],
				   IIMem>;

  def LOAD32fpi: F1<(outs), (ins pred:$p, A:$ptr, i32imm:$off),
				    "$p ldm.f\t$ptr, $off",
				    [(LembergLoadCached (add A:$ptr, (i32 imm11:$off)))],
				    IIMem>;

  // Load from static address
  def LOAD32d_ga: F1<(outs), (ins i32imm:$addr),
                    "       ldmg.d\t$addr",
				    [(LembergLoadCached (LembergWrapper tglobaladdr:$addr))],
				    IIMem>,
	  Requires<[SmallCode]>;

  def LOAD32d_gai: F1<(outs), (ins i32imm:$addr, i32imm:$off),
                      "       ldmg.d\t$addr+$off",
                      [(LembergLoadCached (add (LembergWrapper tglobaladdr:$addr), imm:$off))],
				      IIMem>,
	  Requires<[SmallCode]>;

  // Loads constants
  def LOAD32cp: F1<(outs), (ins pred:$p, A:$ptr),
  				   "$p ldm.d\t$ptr, 0",
                   [(LembergLoadCached A:$ptr)],
                   IIMem>;

  // Volatile loads
  def LOAD32fpv: F1<(outs), (ins pred:$p, A:$ptr),
 				   "$p ldm.b\t$ptr, 0",
				   [(LembergLoadVolatile A:$ptr)],
				   IIMem>;

  def LOAD32fpiv: F1<(outs), (ins pred:$p, A:$ptr, i32imm:$off),
				    "$p ldm.b\t$ptr, $off",
				    [(LembergLoadVolatile (add A:$ptr, (i32 imm11:$off)))],
				    IIMem>;
}

// Pseudo-load from stack, to be expanded
def LOAD32s_pseudo: Pseudo<(outs A:$dst), (ins mem:$ptr),
						   "${:comment} LDM.S $ptr; LDX $$mem -> $dst",
						   [(set A:$dst, (load addr:$ptr))]>;
def LOAD32s_xpseudo: Pseudo<(outs X:$dst), (ins mem:$ptr),
							"${:comment} LDM.S $ptr; LDX $$mem -> $dst",
							[(set X:$dst, (load addr:$ptr))]>;
def LOAD64s_xpseudo: Pseudo<(outs D:$dst), (ins mem:$ptr),
							"${:comment} LDM.S $ptr; LDX $$mem -> $dst",
							[(set D:$dst, (load addr:$ptr))]>;

let Defs = [MEM, MEMHU, MEMHS, MEMBU, MEMBS] in {
	// Matching load from stack
  def LOAD32s_match: Pseudo<(outs), (ins mem:$ptr),
                            "${:comment} LDM.S $ptr",
                            [(LembergLoadStack addr:$ptr)]>;

  // Real loads from stack
  def LOAD32sp: F1<(outs), (ins pred:$p, A:$ptr),
                   "$p ldm.s\t$ptr, 0",
				   [(LembergLoadStack A:$ptr)],
                   IIMem>;
  def LOAD32spi: F1<(outs), (ins pred:$p, A:$ptr, i32imm:$off),
				    "$p ldm.s\t$ptr, $off",
				    [(LembergLoadStack (add A:$ptr, (i32 imm11:$off)))],
                    IIMem>;
}

// Memory stores

let Defs = [MEM, MEMHU, MEMHS, MEMBU, MEMBS] in {
	// Normal stores
	defm STORE32a: OPST4<LembergStore32, "stm.a">;
	defm STORE16a: OPST2<LembergStore16, "stmh.a">;
	defm STORE8a: OPST1<LembergStore8, "stmb.a">;
}

// Pseudo stores to stack
def STORE32s_pseudo: Pseudo<(outs), (ins A:$val, mem:$ptr),
							"${:comment} STM.S $val, $ptr",
							[(store A:$val, addr:$ptr)]>;
def STORE32s_pseudo_imm: Pseudo<(outs), (ins i32imm:$val, mem:$ptr),
							    "${:comment} STM.S $val, $ptr",
							    [(store (i32 imm5:$val), addr:$ptr)]>;
def STORE32s_xpseudo: Pseudo<(outs), (ins X:$val, mem:$ptr),
							 "${:comment} STM.S $val, $ptr",
							 [(store X:$val, addr:$ptr)]>;
def STORE64s_xpseudo: Pseudo<(outs), (ins D:$val, mem:$ptr),
							 "${:comment} STM.S $val, $ptr",
							 [(store D:$val, addr:$ptr)]>;

let Defs = [MEM, MEMHU, MEMHS, MEMBU, MEMBS] in {
	// Matching stores to stack
	defm STORE32s: OPST_MATCH<LembergStoreStack32, "STM.S">;
	defm STORE16s: OPST_MATCH<LembergStoreStack16, "STMH.S">;
	defm STORE8s: OPST_MATCH<LembergStoreStack8, "STMB.S">;

	// Real stores to stack
	defm STORE32s: OPST4<LembergStoreStack32, "stm.s">;
	defm STORE16s: OPST2<LembergStoreStack16, "stmh.s">;
	defm STORE8s: OPST1<LembergStoreStack8, "stmb.s">;
}

// Write back stack cache
def WB: F1<(outs), (ins pred:$p, A:$src1, i32imm:$src2),
		   "$p wb.s\t$src1, $src2",
		   [(LembergWriteBack A:$src1, uimm11:$src2)],
		   IIMem>;

// Masking operation for sub-word accesses
defm MASK: OP3<LembergMask, "mask", uimm5>;

// Load frame pointer
def LEAs: F1<(outs A:$dst), (ins pred:$p, mem:$ptr),
			 "$p add\t$ptr -> $dst",
			 [(set A:$dst, addr:$ptr)],
			 IIAlu>;

// Arithmetic operations
defm ADD: OP3<add, "add", uimm5>;
defm SUB: OP3<sub, "sub", uimm5>;
defm CARR: OP3<LembergCarry, "carr", uimm5>;
defm BORR: OP3<LembergBorrow, "borr", uimm5>;

// Transform add/sub for negative immediates
def : Pat<(add A:$src1, neg_uimm5:$src2),
		  (SUBaia A:$src1, (negate neg_uimm5:$src2))>;
def : Pat<(sub A:$src1, neg_uimm5:$src2),
		  (ADDaia A:$src1, (negate neg_uimm5:$src2))>;

// Add scaled offset
def S2ADDaaa: F1<(outs A:$dst), (ins pred:$p, A:$src1, A:$src2),
			     "$p s2add\t$src1, $src2 -> $dst",
			     [(set A:$dst, (add A:$src1, (shl A:$src2, (i32 2))))],
				 IIAlu>;
def S2ADDaia: F1<(outs A:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
				 "$p s2add\t$src1, $src2 -> $dst",
				 [(set A:$dst, (add A:$src1, (i32 uimm5s2:$src2)))],
				 IIAlu>;

// Multiplication is a little special
def MULaa: F1<(outs Mul:$dst), (ins pred:$p, A:$src1, A:$src2),
              "$p mul\t$src1, $src2 -> $$$dst",
			  [(set Mul:$dst, (LembergMul A:$src1, A:$src2))],
			  IIAlu>;
def MULai: F1<(outs Mul:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
              "$p mul\t$src1, $src2 -> $$$dst", 
			  [(set Mul:$dst, (LembergMul A:$src1, imm5:$src2))],
			  IIAlu>;
// Avoid spilling for multiplication registers
def : Pat<(mul A:$src1, A:$src2),
		  (COPY_TO_REGCLASS (MULaa A:$src1, A:$src2), A)>;
def : Pat<(mul A:$src1, imm5:$src2),
		  (COPY_TO_REGCLASS (MULai A:$src1, imm5:$src2), A)>;

// Logic operations
defm AND: OP3<and, "and", uimm5>;
defm OR:  OP3<or, "or", uimm5>;
defm XOR: OP3<xor, "xor", imm5>;

// Shift operations
defm SL:  OP3<shl, "sl", uimm5>;
defm SR:  OP3<srl, "sr", uimm5>;
defm SRA: OP3<sra, "sra", uimm5>;
defm RL:  OP3<rotl, "rl", uimm5>;

// Compares
defm CMPEQ:  OPCMP<seteq, seteq, "cmpeq", imm5>;
defm CMPNE:  OPCMP<setne, setne, "cmpne", imm5>;
defm CMPLT:  OPCMP<setlt, setgt, "cmplt", imm5>;
defm CMPLE:  OPCMP<setle, setge, "cmple", imm5>;
defm CMPULT: OPCMP<setult, setugt, "cmpult", uimm5>;
defm CMPULE: OPCMP<setule, setuge, "cmpule", uimm5>;

// Bit test
def BTEST: F1<(outs C:$dst), (ins pred:$p, A:$src1, uimm5mask:$src2),
              "$p btest\t$src1, $src2 -> $dst",
              [(set C:$dst, (setne (and A:$src1, uimm5mask:$src2), (i32 0)))],
			  IIAlu>;

// Immediate constant loads
let isReMaterializable = 1, isAsCheapAsAMove = 1 in {
  def LOADimm11: F1<(outs A:$dst), (ins pred:$p, i32imm:$src),
                    "$p ldi\t$src -> $dst",
                    [(set A:$dst, imm11:$src)],
		            IIAlu>;

  def LOADuimm11: F1<(outs A:$dst), (ins pred:$p, i32imm:$src),
				     "$p ldiu\t$src -> $dst",
				     [(set A:$dst, uimm11:$src)],
				     IIAlu>;

  def LOADuimm19s2: F1<(outs AImm:$dst), (ins i32imm:$src),
                       "       ldga\t$src -> $dst",
				       [(set AImm:$dst, uimm19s2:$src)],
				       IIAlu>;
}

let Constraints = "$src1 = $dst" in {
  def LOADimm11mi: F1<(outs A:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
                      "$p ldim\t$src2 -> $dst",
                      [(set A:$dst, (or A:$src1, (shl imm11:$src2, (i32 11))))],
					  IIAlu>;

  def LOADimm11hi: F1<(outs A:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
					  "$p ldih\t$src2 -> $dst",
					  [(set A:$dst, (or A:$src1, (shl imm11:$src2, (i32 21))))],
					  IIAlu>;
}

// load 22-bit constants
def : Pat<(i32 imm22:$imm),
		  (LOADimm11mi (LOADuimm11
						(low11 imm:$imm)),
		   (mid11 imm:$imm))>;

// load 32 bits constants with low two bits cleared
def : Pat<(i32 imm32s2:$imm),
		  (LOADimm11hi (LOADuimm19s2
						(low21 imm32s2:$imm)),
		   (high11 imm32s2:$imm))>;

// load full 32 bits constants
def : Pat<(i32 imm:$imm),
		  (LOADimm11hi (LOADimm11mi (LOADuimm11
									 (low11 imm:$imm)),
						(mid10 imm:$imm)),
		   (high11 imm:$imm))>;

// load symbolic constants
let isReMaterializable = 1, isAsCheapAsAMove = 1 in {
  def LOADsym11lo: F1<(outs A:$dst), (ins pred:$p, i32imm:$src),
				      "$p ldiu\tlo11\\{ $src \\} -> $dst", 
					  [(set A:$dst, (and imm:$src, (i32 0x000007ff)))],
					  IIAlu>;
}

let Constraints = "$src1 = $dst" in {
	def LOADsym10mi: F1<(outs A:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
	                    "$p ldim\tmi10\\{ $src2 \\} -> $dst",
                      	[(set A:$dst, (or A:$src1, (and imm:$src2, (i32 0x001ff800))))],
	                    IIAlu>;

	def LOADsym11hi: F1<(outs A:$dst), (ins pred:$p, A:$src1, i32imm:$src2),
                        "$p ldih\thi11\\{ $src2 \\} -> $dst",
	                    [(set A:$dst, (or A:$src1, (and imm:$src2, (i32 0xffe00000))))],
                        IIAlu>;
}

// load global address in small code model
let isReMaterializable = 1, isAsCheapAsAMove = 1 in {
  def LOADga: F1<(outs AImm:$dst), (ins i32imm:$addr),
			     "       ldga\t$addr -> $dst",
                 [(set AImm:$dst, (LembergWrapper tglobaladdr:$addr))],
			     IIAlu>,
	  Requires<[SmallCode]>;
}

// load the full 32 bits
def : Pat<(LembergWrapper tglobaladdr:$addr),
		  (LOADsym11hi (LOADsym10mi (LOADsym11lo 
									 tglobaladdr:$addr),
						tglobaladdr:$addr),
		   tglobaladdr:$addr)>;

// just load 22 bits for the small code model
def : Pat<(LembergLoadCached (add (LembergWrapper tjumptable:$addr), (shl A:$off, (i32 2)))),
          (LOAD32cp (S2ADDaaa (LOADga tjumptable:$addr), A:$off))>,
	Requires<[SmallCode]>;

// load the full 32 bits
def : Pat<(LembergLoadCached (add (LembergWrapper tjumptable:$addr), (shl A:$off, (i32 2)))),
          (LOAD32cp (S2ADDaaa (LOADsym11hi (LOADsym10mi (LOADsym11lo 
														 tjumptable:$addr),
											tjumptable:$addr),
							   tjumptable:$addr),
					 A:$off))>;

// pattern for stores to global addresses
def : Pat <(LembergStore32 A:$val, (LembergWrapper tglobaladdr:$addr)),
		   (STORE32ap A:$val, (LOADga tglobaladdr:$addr))>,
	Requires<[SmallCode]>;

def : Pat <(LembergStore32 imm5:$val, (LembergWrapper tglobaladdr:$addr)),
		   (STORE32ap_imm imm5:$val, (LOADga tglobaladdr:$addr))>,
	Requires<[SmallCode]>;

// Nifty mask/shift operations
def : Pat<(sext_inreg A:$src, i8),
		  (MASKaia A:$src, (i32 8))>;

def : Pat<(sext_inreg (srl A:$src, (i32 8)), i8),
		  (MASKaia A:$src, (i32 9))>;
def : Pat<(sext_inreg (srl A:$src, (i32 16)), i8),
		  (MASKaia A:$src, (i32 10))>;

def : Pat<(and A:$src, (i32 0xff)),
		  (MASKaia A:$src, (i32 0))>;

def : Pat<(and (srl A:$src, (i32 8)), (i32 0xff)),
		  (MASKaia A:$src, (i32 1))>;
def : Pat<(and (srl A:$src, (i32 16)), (i32 0xff)),
		  (MASKaia A:$src, (i32 2))>;

def : Pat<(shl (and A:$src, (i32 0xff)), (i32 8)),
		  (MASKaia A:$src, (i32 17))>;
def : Pat<(shl (and A:$src, (i32 0xff)), (i32 16)),
		  (MASKaia A:$src, (i32 18))>;

def : Pat<(and A:$src, (i32 0x0000ff00)),
		  (MASKaia A:$src, (i32 25))>;
def : Pat<(and A:$src, (i32 0x00ff0000)),
		  (MASKaia A:$src, (i32 26))>;

def : Pat<(sext_inreg A:$src, i16),
		  (MASKaia A:$src, (i32 12))>;

def : Pat<(and A:$src, (i32 0x0000ffff)),
		  (MASKaia A:$src, (i32 4))>;

def : Pat<(and A:$src, (i32 0xffff0000)),
		  (MASKaia A:$src, (i32 28))>;

let Constraints = "$src2 = $dst" in {
    // Conditional move
	def MOVEtrue: F1<(outs A:$dst), (ins C:$cond, A:$src1, A:$src2),
	                 "if  $cond or\t$src1, 0 -> $dst",
				     [(set A:$dst, (select C:$cond, A:$src1, A:$src2))],
				     IIAlu>;
	def MOVEfalse: F1<(outs A:$dst), (ins C:$cond, A:$src1, A:$src2),
	                  "if !$cond or\t$src1, 0 -> $dst",
	                  [(set A:$dst, (select (notcc C:$cond), A:$src1, A:$src2))],
				      IIAlu>;
    // Condition flag handling
	def MOVCCtrue: F1<(outs C:$dst), (ins C:$cond, C:$src1, C:$src2),
				      "if  $cond comb\tand $src1, $src1 -> $dst",
				      [(set C:$dst, (select C:$cond, C:$src1, C:$src2))],
				      IIAlu>;
	def MOVCCfalse: F1<(outs C:$dst), (ins C:$cond, C:$src1, C:$src2),
				       "if !$cond comb\tand $src1, $src1 -> $dst",
                       [(set C:$dst, (select (notcc C:$cond), C:$src1, C:$src2))],
				       IIAlu>;
    // Conditional move for floats
	def FMOVtrue: F1<(outs F:$dst), (ins C:$cond, F:$src1, F:$src2),
	                 "if  $cond fop\tfmov\t$src1 -> $dst",
	                 [(set (f32 F:$dst), (select C:$cond, F:$src1, F:$src2))],
				     IIFpu0>;
	def FMOVfalse: F1<(outs F:$dst), (ins C:$cond, F:$src1, F:$src2),
	                  "if !$cond fop\tfmov\t$src1 -> $dst",
                      [(set (f32 F:$dst), (select (notcc C:$cond), F:$src1, F:$src2))],
				      IIFpu0>;
    // Conditional move for doubles
	def DMOVtrue: F1<(outs D:$dst), (ins C:$cond, D:$src1, D:$src2),
	                 "if  $cond fop\tdmov\t$src1 -> $dst",
	                 [(set (f64 D:$dst), (select C:$cond, D:$src1, D:$src2))],
				     IIFpu0>;
	def DMOVfalse: F1<(outs D:$dst), (ins C:$cond, D:$src1, D:$src2),
	                  "if !$cond fop\tdmov\t$src1 -> $dst",
                      [(set (f64 D:$dst), (select (notcc C:$cond), D:$src1, D:$src2))],
				      IIFpu0>;
}

let neverHasSideEffects = 1 in
def MOVCC: F1<(outs C:$dst), (ins pred:$p, C:$src),
			   "$p comb\tand $src, $src -> $dst",
			   [], IIAlu>;

def ANDCC: F1<(outs C:$dst), (ins pred:$p, C:$src1, C:$src2),
			  "$p comb\tand $src1, $src2 -> $dst",
			  [(set C:$dst, (and C:$src1, C:$src2))],
			  IIAlu>;
def ORCC: F1<(outs C:$dst), (ins pred:$p, C:$src1, C:$src2),
			 "$p comb\tor $src1, $src2 -> $dst",
			 [(set C:$dst, (or C:$src1, C:$src2))],
			 IIAlu>;
def XORCC: F1<(outs C:$dst), (ins pred:$p, C:$src1, C:$src2),
			  "$p comb\txor $src1, $src2 -> $dst",
			  [(set C:$dst, (xor C:$src1, C:$src2))],
			  IIAlu>;
def NOTCC: F1<(outs C:$dst), (ins pred:$p, C:$src1),
			  "$p comb\tand !$src1, !$src1 -> $dst",
			  [(set C:$dst, (notcc C:$src1))],
			  IIAlu>;
def NORCC: F1<(outs C:$dst), (ins pred:$p, C:$src1, C:$src2),
			  "$p comb\tand !$src1, !$src2 -> $dst",
			  [(set C:$dst, (notcc (or C:$src1, C:$src2)))],
			  IIAlu>;
def NANDCC: F1<(outs C:$dst), (ins pred:$p, C:$src1, C:$src2),
			   "$p comb\tor !$src1, !$src2 -> $dst",
			   [(set C:$dst, (notcc (and C:$src1, C:$src2)))],
			   IIAlu>;
def NXORCC: F1<(outs C:$dst), (ins pred:$p, C:$src1, C:$src2),
			   "$p comb\txor $src1, !$src2 -> $dst",
			   [(set C:$dst, (notcc (xor C:$src1, C:$src2)))],
			   IIAlu>;

// Alternative representations of XOR
def : Pat<(add C:$src1, C:$src2),
		  (XORCC C:$src1, C:$src2)>;
def : Pat<(notcc (add C:$src1, C:$src2)),
		  (NXORCC C:$src1, C:$src2)>;
def : Pat<(setne C:$src1, C:$src2),
		  (XORCC C:$src1, C:$src2)>;
def : Pat<(notcc (setne C:$src1, C:$src2)),
		  (NXORCC C:$src1, C:$src2)>;

// Boolean constants
def TRUECC: F1<(outs C:$dst), (ins pred:$p),
				"$p comb\tor $dst, !$dst -> $dst",
				[(set C:$dst, (i1 -1))],
				IIAlu>;
def FALSECC: F1<(outs C:$dst), (ins pred:$p),
				"$p comb\tand $dst, !$dst -> $dst",
				[(set C:$dst, (i1 0))],
				IIAlu>;

// Conversion from a flag to a register
def EXTCC: F1<(outs A:$dst), (ins pred:$p, C:$src),
			  "$p ldx\t$$$src -> $dst",
			  [(set A:$dst, (i32 (zext C:$src)))],
			  IIAlu>;

def : Pat<(i32 (anyext C:$src)),
		  (EXTCC C:$src)>;

// Conversion from a register to a flag
def TRNCC: F1<(outs C:$dst), (ins pred:$p, A:$src),
			  "$p btest\t$src, 0 -> $dst",
			  [(set C:$dst, (i1 (trunc A:$src)))],
			  IIAlu>;

// Sign-extension of flags
def : Pat<(sext_inreg A:$src, i1),
		  (SRAaia (SLaia A:$src, (i32 31)), (i32 31))>;
def : Pat<(i32 (sext C:$src)),
		  (SRAaia (SLaia (EXTCC C:$src), (i32 31)), (i32 31))>;

// Special case where we do not need to extract flag explicitly
let Constraints = "$src2 = $dst" in
def ORcond: F1<(outs A:$dst), (ins C:$src1, A:$src2),
			   "if  $src1 or\t$src2, 1 -> $dst",
			   [(set A:$dst, (or (i32 (zext C:$src1)), A:$src2))],
			   IIAlu>;		 

// Single-precision floating-point operations
let neverHasSideEffects = 1 in
def FMOV: F1<(outs F:$dst), (ins pred:$p, F:$src),
			 "$p fop\tfmov\t$src -> $dst",
			 [], IIFpu0>;

def FNEG: F1<(outs F:$dst), (ins pred:$p, F:$src),
			 "$p fop\tfneg\t$src -> $dst",
			 [(set F:$dst, (fneg F:$src))],
			 IIFpu0>;
def FABS: F1<(outs F:$dst), (ins pred:$p, F:$src),
			 "$p fop\tfabs\t$src -> $dst",
			 [(set F:$dst, (fabs F:$src))],
			 IIFpu0>;

def FADD: F1<(outs F:$dst), (ins pred:$p, F:$src1, F:$src2),
			 "$p fop\tfadd\t$src1, $src2 -> $dst",
			 [(set F:$dst, (fadd F:$src1, F:$src2))],
			 IIFpu6>;
def FSUB: F1<(outs F:$dst), (ins pred:$p, F:$src1, F:$src2),
			 "$p fop\tfsub\t$src1, $src2 -> $dst",
			 [(set F:$dst, (fsub F:$src1, F:$src2))],
			 IIFpu6>;
def FMUL: F1<(outs F:$dst), (ins pred:$p, F:$src1, F:$src2),
 			 "$p fop\tfmul\t$src1, $src2 -> $dst",
 			 [(set F:$dst, (fmul F:$src1, F:$src2))],
 			 IIFpu6>;
let Constraints = "$src1 = $dst" in
def FMAC: F1<(outs F:$dst), (ins pred:$p, F:$src1, F:$src2, F:$src3),
 			 "$p fop\tfmac\t$src2, $src3 -> $dst",
 			 [(set F:$dst, (fadd (fmul F:$src2, F:$src3), F:$src1))],
 			 IIFpu6>;

// Double-precision floating-point operations
let neverHasSideEffects = 1 in
def DMOV: F1<(outs D:$dst), (ins pred:$p, D:$src),
			 "$p fop\tdmov\t$src -> $dst",
			 [], IIFpu0>;

def DNEG: F1<(outs D:$dst), (ins pred:$p, D:$src),
			 "$p fop\tdabs\t$src -> $dst",
			 [(set D:$dst, (fneg D:$src))],
			 IIFpu0>;
def DABS: F1<(outs D:$dst), (ins pred:$p, D:$src),
			 "$p fop\tdabs\t$src -> $dst",
			 [(set D:$dst, (fabs D:$src))],
			 IIFpu0>;

def DADD: F1<(outs D:$dst), (ins pred:$p, D:$src1, D:$src2),
			 "$p fop\tdadd\t$src1, $src2 -> $dst",
			 [(set D:$dst, (fadd D:$src1, D:$src2))],
			 IIFpu7>;
def DSUB: F1<(outs D:$dst), (ins pred:$p, D:$src1, D:$src2),
			 "$p fop\tdsub\t$src1, $src2 -> $dst",
			 [(set D:$dst, (fsub D:$src1, D:$src2))],
			 IIFpu7>;
def DMUL: F1<(outs D:$dst), (ins pred:$p, D:$src1, D:$src2),
 			 "$p fop\tdmul\t$src1, $src2 -> $dst",
 			 [(set D:$dst, (fmul D:$src1, D:$src2))],
 			 IIFpu7>;
let Constraints = "$src1 = $dst" in
def DMAC: F1<(outs D:$dst), (ins pred:$p, D:$src1, D:$src2, D:$src3),
 			 "$p fop\tdmac\t$src2, $src3 -> $dst",
 			 [(set D:$dst, (fadd (fmul D:$src2, D:$src3), D:$src1))],
 			 IIFpu7>;

// All kinds of floating-point conversions
def SF2SI: F1<(outs F:$dst), (ins pred:$p, F:$src),
			  "$p fop\tsf2si\t$src -> $dst",
			  [(set F:$dst, (fp_to_sint F:$src))],
			  IIFpu2>;
def SI2SF: F1<(outs F:$dst), (ins pred:$p, F:$src),
			  "$p fop\tsi2sf\t$src -> $dst",
			  [(set F:$dst, (sint_to_fp F:$src))],
			  IIFpu2>;

def DF2SI: F1<(outs F:$dst), (ins pred:$p, D:$src),
			  "$p fop\tdf2si\t$src -> $dst",
			  [(set F:$dst, (fp_to_sint D:$src))],
			  IIFpu2>;
def SI2DF: F1<(outs D:$dst), (ins pred:$p, F:$src),
			  "$p fop\tsi2df\t$src -> $dst",
			  [(set D:$dst, (sint_to_fp F:$src))],
			  IIFpu2>;

def D2F: F1<(outs F:$dst), (ins pred:$p, D:$src),
			"$p fop\trnd\t$src -> $dst",
			[(set F:$dst, (f32 (fround D:$src)))],
			IIFpu4>;
def F2D: F1<(outs D:$dst), (ins pred:$p, F:$src),
			"$p fop\text\t$src -> $dst",
			[(set D:$dst, (f64 (fextend F:$src)))],
			IIFpu3>;

// Same as MOVEax/MOVExa, but with proper typing and execution unit
def MOVEaf: F1<(outs F:$dst), (ins pred:$p, A:$src),
			   "$p stx\t$src -> $$$dst",
			   [(set (f32 F:$dst), (bitconvert (i32 A:$src)))],
			   IIFpu0>;
def MOVEfa: F1<(outs A:$dst), (ins pred:$p, F:$src),
			   "$p ldx\t$$$src -> $dst",
			   [(set (i32 A:$dst), (bitconvert (f32 F:$src)))],
			   IIFpu0>;

// load +0.0 and -0.0
let isReMaterializable = 1, isAsCheapAsAMove = 1 in {
	def FZERO: F1<(outs F:$dst), (ins pred:$p),
	              "$p fop\tfzero -> $dst",
	              [(set (f32 F:$dst), fpimm0)],
			      IIFpu0>;
}
def : Pat<(f32 fpimm0neg), (FNEG (FZERO))>;

let isReMaterializable = 1, isAsCheapAsAMove = 1 in {
	def DZERO: F1<(outs D:$dst), (ins pred:$p),
			      "$p fop\tdzero -> $dst",
			      [(set D:$dst, fpimm0)],
			      IIFpu0>;
}
def : Pat<(f64 fpimm0neg), (DNEG (DZERO))>;

// load floating-point constants
def : Pat<(f32 fpimm:$imm),
		  (f32 (COPY_TO_REGCLASS
				(LOADimm11hi (LOADimm11mi (LOADuimm11
										   (low11 (i32 (fpbits32 fpimm:$imm)))),
							  (mid10 (i32 (fpbits32 fpimm:$imm)))),
				 (high11 (i32 (fpbits32 fpimm:$imm)))), F))>;

def : Pat<(f64 fpimm:$imm),
		  (INSERT_SUBREG 
		   (INSERT_SUBREG (f64 (IMPLICIT_DEF)),
			(f32 (COPY_TO_REGCLASS
				  (LOADimm11hi (LOADimm11mi (LOADuimm11
											 (low11 (i32 (fpbits64lo fpimm:$imm)))),
								(mid10 (i32 (fpbits64lo fpimm:$imm)))),
				   (high11 (i32 (fpbits64lo fpimm:$imm)))), F)),
			sub_even),
		   (f32 (COPY_TO_REGCLASS
				 (LOADimm11hi (LOADimm11mi (LOADuimm11
											(low11 (i32 (fpbits64hi fpimm:$imm)))),
							   (mid10 (i32 (fpbits64hi fpimm:$imm)))),
				  (high11 (i32 (fpbits64hi fpimm:$imm)))), F)),
			sub_odd)>;

// Comparison result must be checked with btest to get actual condition
def FCMP: F1<(outs F:$dst), (ins pred:$p, F:$src1, F:$src2),
			 "$p fop\tfcmp\t$src1, $src2 -> $dst", [], IIFpu1>;

def : Pat<(setoeq (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 0))>;
def : Pat<(setone (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 1))>;
def : Pat<(setolt (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 2))>;
def : Pat<(setole (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 3))>;
def : Pat<(setogt (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 4))>;
def : Pat<(setoge (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 5))>;

def : Pat<(seto (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 6))>;
def : Pat<(setuo (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 7))>;

def : Pat<(setueq (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 8))>;
def : Pat<(setune (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 9))>;
def : Pat<(setult (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 10))>;
def : Pat<(setule (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 11))>;
def : Pat<(setugt (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 12))>;
def : Pat<(setuge (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 13))>;

def : Pat<(seteq (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 8))>;
def : Pat<(setne (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 9))>;
def : Pat<(setlt (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 10))>;
def : Pat<(setle (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 11))>;
def : Pat<(setgt (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 12))>;
def : Pat<(setge (f32 F:$src1), (f32 F:$src2)),
		  (BTEST (COPY_TO_REGCLASS (FCMP F:$src1, F:$src2), A), (i32 13))>;

// Comparison of doubles
def DCMP: F1<(outs F:$dst), (ins pred:$p, D:$src1, D:$src2),
			 "$p fop\tdcmp\t$src1, $src2 -> $dst", [], IIFpu2>;

def : Pat<(setoeq (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 0))>;
def : Pat<(setone (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 1))>;
def : Pat<(setolt (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 2))>;
def : Pat<(setole (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 3))>;
def : Pat<(setogt (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 4))>;
def : Pat<(setoge (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 5))>;

def : Pat<(seto (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 6))>;
def : Pat<(setuo (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 7))>;

def : Pat<(setueq (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 8))>;
def : Pat<(setune (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 9))>;
def : Pat<(setult (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 10))>;
def : Pat<(setule (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 11))>;
def : Pat<(setugt (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 12))>;
def : Pat<(setuge (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 13))>;

def : Pat<(seteq (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 8))>;
def : Pat<(setne (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 9))>;
def : Pat<(setlt (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 10))>;
def : Pat<(setle (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 11))>;
def : Pat<(setgt (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 12))>;
def : Pat<(setge (f64 D:$src1), (f64 D:$src2)),
		  (BTEST (COPY_TO_REGCLASS (DCMP D:$src1, D:$src2), A), (i32 13))>;


// Jump
let isBranch = 1, isTerminator = 1, hasDelaySlot=1 in {

	let isBarrier=1 in
	def JUMP : F1<(outs), (ins brtarget:$target),
                  "       br\t$target",
                  [(br bb:$target)],
                  IIBranch>;

	let isIndirectBranch = 1, isBarrier=1 in
	def JUMPp : F1<(outs), (ins pred:$p, A:$target),
	               "$p br\t$target",
	               [(brind A:$target)],
                   IIBranch>;

	def JUMPtrue : F1<(outs), (ins C:$cond, brtarget:$target),
	                  "if  $cond br\t$target",
	                  [(brcond C:$cond, bb:$target)],
	                  IIBranch>;
	def JUMPfalse : F1<(outs), (ins C:$cond, brtarget:$target),
	                  "if !$cond br\t$target", 
                      [(brcond (notcc C:$cond), bb:$target)],
	                  IIBranch>;

	// predicated version for easier if-conversion
	def JUMPpred : F1<(outs), (ins pred:$p, brtarget:$target),
	                  "$p br\t$target", [], IIBranch>;
}

// Patterns to match special cases of conditions
def : Pat<(brcond (i1 (seteq (and A:$src1, uimm5mask:$src2), (i32 0))), bb:$target),
		  (JUMPfalse (BTEST A:$src1, (trailingZeros uimm5mask:$src2)), bb:$target)>;
def : Pat<(select (i1 (seteq (and A:$src1, uimm5mask:$src2), (i32 0))), A:$src3, A:$src4),
		  (MOVEfalse (BTEST A:$src1, (trailingZeros uimm5mask:$src2)), A:$src3, A:$src4)>;

// Pseudo instructions for calls
let Defs = [R15], Uses = [R15] in {
    def ADJCALLSTACKDOWN : Pseudo<(outs), (ins i32imm:$amt),
                                  "${:comment} ADJCALLSTACKDOWN $amt",
							      [(callseq_start timm:$amt)]>;
    def ADJCALLSTACKUP : Pseudo<(outs), (ins i32imm:$amt1, i32imm:$amt2),
							    "${:comment} ADJCALLSTACKUP $amt1 $amt2",
							    [(callseq_end timm:$amt1, timm:$amt2)]>;
}

// Call
let isCall=1, hasDelaySlot=1,
    Defs = [R0, R1, R2, R3,
			R4, R5, R6, R7, R8, R9,
			R0_16, R1_16, R2_16, R3_16,
			R0_17, R1_17, R2_17, R3_17,
			R0_18, R1_18, R2_18, R3_18,
			R0_19, R1_19, R2_19, R3_19,
			R0_20, R1_20, R2_20, R3_20,
			R0_21, R1_21, R2_21, R3_21,
			R0_22, R1_22, R2_22, R3_22,
			C0, C1, C2, C3,
			MUL0, MUL1, MUL2, MUL3,
			MEM, MEMHU, MEMHS, MEMBU, MEMBS,
			F0, F1, F2, F3,
			F4, F5, F6, F7, F8, F9,
			D0, D1,
			D2, D3, D4] in {
	def CALL : F1<(outs), (ins pred:$p, A:$target, variable_ops),
				  "$p call\t$target",
				  [(LembergCall A:$target)],
				  IIBranch>;

	def CALLga : F1<(outs), (ins i32imm:$target, variable_ops),
				    "       callg\t$target",
				    [(LembergCall (LembergWrapper tglobaladdr:$target))],
				    IIBranch>,
	Requires<[SmallCode]>;
}

// Return
let isReturn=1, isTerminator=1, hasDelaySlot=1, isBarrier=1 in
	def RET : F1<(outs), (ins pred:$p),
				 "$p ret",
				 [(LembergReturn)],
				 IIBranch>;

// Pseudo operation to separate bundles
def SEP : Pseudo<(outs), (ins), ";;", []>;
// NOP
def NOP : Pseudo<(outs), (ins i32imm:$val), "       nop\t$val", []>;
