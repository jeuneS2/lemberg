//===-- LembergAsmPrinter.cpp - Lemberg LLVM assembly writer --------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "asm-printer"

#include "Lemberg.h"
#include "LembergAsmPrinter.h"
#include "LembergInstrInfo.h"
#include "LembergTargetMachine.h"
#include "llvm/Module.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/DwarfWriter.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/Target/Mangler.h"
#include "llvm/Target/TargetRegistry.h"
#include "llvm/Target/TargetLoweringObjectFile.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/SmallString.h"

using namespace llvm;

#include "LembergGenAsmWriter.inc"

extern "C" void LLVMInitializeLembergAsmPrinter() {
  RegisterAsmPrinter<LembergAsmPrinter> X(TheLembergTarget);
}

void LembergAsmPrinter::EmitInstruction(const MachineInstr *MI) {
	SmallString<128> Str;
	raw_svector_ostream OS(Str);
	printCluster(MI, OS);
	printInstruction(MI, OS);
	OutStreamer.EmitRawText(OS.str());
}

void LembergAsmPrinter::printOperand(const MachineInstr *MI, int opNum, raw_ostream &O) {
  const MachineOperand &MO = MI->getOperand (opNum);

  switch (MO.getType()) {
  case MachineOperand::MO_Register:
    assert(TargetRegisterInfo::isPhysicalRegister(MO.getReg()) &&
           "Virtual registers should be already mapped!");
	if (MO.getSubReg() == 0)
		O << getRegisterName(MO.getReg());
	else
		O << getRegisterName(TM.getRegisterInfo()->getSubReg(MO.getReg(), MO.getSubReg()));
    break;

  case MachineOperand::MO_Immediate:
    O << MO.getImm();
    break;
  case MachineOperand::MO_MachineBasicBlock:
    O << *MO.getMBB()->getSymbol();
    return;
  case MachineOperand::MO_GlobalAddress:
    O << *Mang->getSymbol(MO.getGlobal());
    break;
  case MachineOperand::MO_ExternalSymbol:
    O << *GetExternalSymbolSymbol(MO.getSymbolName());
    break;
  case MachineOperand::MO_ConstantPoolIndex:
    O << *GetCPISymbol(MO.getIndex()) << "-" << *CurrentFnSym << "_end";
    break;
  case MachineOperand::MO_JumpTableIndex:
    O << *GetJTISymbol(MO.getIndex());
    break;
  default:
    llvm_unreachable("<unknown operand type>");
    break;
  }
}

void LembergAsmPrinter::printMemoryOperand(const MachineInstr *MI, int opNum, raw_ostream &O) {
	printOperand(MI, opNum+1, O);
  O << ", ";
  printOperand(MI, opNum, O);
}

void LembergAsmPrinter::printPredicateOperand(const MachineInstr *MI, int opNum, raw_ostream &O) {
  int Code = MI->getOperand(opNum).getImm();
  if (Code == 0) {
	  O << "if !";
	  printOperand(MI, opNum+1, O);
  } else if (Code == 1) {
	  O << "if  ";
	  printOperand(MI, opNum+1, O);
  } else {
	  O << "      ";
  }
}

void LembergAsmPrinter::printCluster(const MachineInstr *MI, raw_ostream &O) {

	if (MI->getOpcode() != Lemberg::SEP
		&& MI->getOpcode() != Lemberg::NOP) {
		const LembergSubtarget *LST = ((LembergTargetMachine &)TM).getSubtargetImpl();
		const InstrItineraryData &IID = LST->getInstrItins();
		const InstrItinerary *IITab = IID.Itineraries;
		const InstrStage *IIStages = IID.Stages;
		
		const TargetInstrDesc &TID = MI->getDesc();
		unsigned SchedClass = TID.getSchedClass();
		
		unsigned FirstUnit = IIStages[IITab[SchedClass].FirstStage].getUnits();
		if (FirstUnit == LST->getFuncUnit(LembergFU::SLOT0)) {
			O << "#0:";
		} else if (FirstUnit == LST->getFuncUnit(LembergFU::SLOT1)) {
			O << "#1:";
		} else if (FirstUnit == LST->getFuncUnit(LembergFU::SLOT2)) {
			O << "#2:";
		} else if (FirstUnit == LST->getFuncUnit(LembergFU::SLOT3)) {
			O << "#3:";
		} else {
			llvm_unreachable("Cannot compute slot from function unit");
		}
	}
}

/// EmitFunctionBodyStart - Targets can override this to emit stuff before
/// the first basic block in the function.
void LembergAsmPrinter::EmitFunctionBodyStart() {
  // Emit function size size
  SmallString<128> Str;
  raw_svector_ostream OS(Str);
  OS << "\t.size\t" << *CurrentFnSym << "_end-" << *CurrentFnSym << "\n";
  OS << *CurrentFnSym << "_start:\n";
  OutStreamer.EmitRawText(OS.str());
}

/// EmitFunctionBodyEnd - Targets can override this to emit stuff after
/// the last basic block in the function.
void LembergAsmPrinter::EmitFunctionBodyEnd() {
  // Make sure we are at a word boundary
  EmitAlignment(2);
  // Emit label for size computation
  SmallString<128> Str;
  raw_svector_ostream OS(Str);
  OS << *CurrentFnSym << "_end:\n";
  OutStreamer.EmitRawText(OS.str());
}

/// isBlockOnlyReachableByFallthough - Return true if the basic block has
/// exactly one predecessor and the control transfer mechanism between
/// the predecessor and this block is a fall-through.
bool LembergAsmPrinter::
isBlockOnlyReachableByFallthrough(const MachineBasicBlock *MBB) const {
  // The predecessor has to be immediately before this block.
  const MachineBasicBlock *Pred = *MBB->pred_begin();

  // Make all basic blocks reachable
  return false;
}
