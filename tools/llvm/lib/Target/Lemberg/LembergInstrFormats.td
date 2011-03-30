//===--- LembergInstrFormats.td ----------------------------*- tablegen -*-===//
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

class InstLemberg<dag outs, dag ins, string asmstr, list<dag> pattern,
	  			  InstrItinClass itin> : Instruction {
  field bits<26> Inst;

  let Namespace = "Lemberg";

  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString = asmstr;
  let Pattern = pattern;
  let Itinerary = itin;
}

// Single instructions
class F1<dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass itin>
    : InstLemberg<outs, ins, asmstr, pattern, itin> {
}
