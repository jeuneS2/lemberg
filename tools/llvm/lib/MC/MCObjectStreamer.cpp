//===- lib/MC/MCObjectStreamer.cpp - Object File MCStreamer Interface -----===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCObjectStreamer.h"

#include "llvm/Support/ErrorHandling.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCDwarf.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Target/TargetAsmBackend.h"
#include "llvm/Target/TargetAsmInfo.h"
using namespace llvm;

MCObjectStreamer::MCObjectStreamer(MCContext &Context, TargetAsmBackend &TAB,
                                   raw_ostream &OS, MCCodeEmitter *Emitter_)
  : MCStreamer(Context),
    Assembler(new MCAssembler(Context, TAB,
                              *Emitter_, *TAB.createObjectWriter(OS),
                              OS)),
    CurSectionData(0)
{
}

MCObjectStreamer::~MCObjectStreamer() {
  delete &Assembler->getBackend();
  delete &Assembler->getEmitter();
  delete &Assembler->getWriter();
  delete Assembler;
}

MCFragment *MCObjectStreamer::getCurrentFragment() const {
  assert(getCurrentSectionData() && "No current section!");

  if (!getCurrentSectionData()->empty())
    return &getCurrentSectionData()->getFragmentList().back();

  return 0;
}

MCDataFragment *MCObjectStreamer::getOrCreateDataFragment() const {
  MCDataFragment *F = dyn_cast_or_null<MCDataFragment>(getCurrentFragment());
  if (!F)
    F = new MCDataFragment(getCurrentSectionData());
  return F;
}

const MCExpr *MCObjectStreamer::AddValueSymbols(const MCExpr *Value) {
  switch (Value->getKind()) {
  case MCExpr::Target:
    cast<MCTargetExpr>(Value)->AddValueSymbols(Assembler);
    break;

  case MCExpr::Constant:
    break;

  case MCExpr::Binary: {
    const MCBinaryExpr *BE = cast<MCBinaryExpr>(Value);
    AddValueSymbols(BE->getLHS());
    AddValueSymbols(BE->getRHS());
    break;
  }

  case MCExpr::SymbolRef:
    Assembler->getOrCreateSymbolData(cast<MCSymbolRefExpr>(Value)->getSymbol());
    break;

  case MCExpr::Unary:
    AddValueSymbols(cast<MCUnaryExpr>(Value)->getSubExpr());
    break;
  }

  return Value;
}

void MCObjectStreamer::EmitValueImpl(const MCExpr *Value, unsigned Size,
                                     bool isPCRel, unsigned AddrSpace) {
  assert(AddrSpace == 0 && "Address space must be 0!");
  MCDataFragment *DF = getOrCreateDataFragment();

  // Avoid fixups when possible.
  int64_t AbsValue;
  if (AddValueSymbols(Value)->EvaluateAsAbsolute(AbsValue, getAssembler())) {
    EmitIntValue(AbsValue, Size, AddrSpace);
    return;
  }
  DF->addFixup(MCFixup::Create(DF->getContents().size(),
                               Value,
                               MCFixup::getKindForSize(Size, isPCRel)));
  DF->getContents().resize(DF->getContents().size() + Size, 0);
}

void MCObjectStreamer::EmitLabel(MCSymbol *Symbol) {
  assert(!Symbol->isVariable() && "Cannot emit a variable symbol!");
  assert(getCurrentSection() && "Cannot emit before setting section!");

  Symbol->setSection(*getCurrentSection());

  MCSymbolData &SD = getAssembler().getOrCreateSymbolData(*Symbol);

  // FIXME: This is wasteful, we don't necessarily need to create a data
  // fragment. Instead, we should mark the symbol as pointing into the data
  // fragment if it exists, otherwise we should just queue the label and set its
  // fragment pointer when we emit the next fragment.
  MCDataFragment *F = getOrCreateDataFragment();
  assert(!SD.getFragment() && "Unexpected fragment on symbol data!");
  SD.setFragment(F);
  SD.setOffset(F->getContents().size());
}

void MCObjectStreamer::EmitULEB128Value(const MCExpr *Value,
                                        unsigned AddrSpace) {
  int64_t IntValue;
  if (Value->EvaluateAsAbsolute(IntValue, getAssembler())) {
    EmitULEB128IntValue(IntValue, AddrSpace);
    return;
  }
  new MCLEBFragment(*Value, false, getCurrentSectionData());
}

void MCObjectStreamer::EmitSLEB128Value(const MCExpr *Value,
                                        unsigned AddrSpace) {
  int64_t IntValue;
  if (Value->EvaluateAsAbsolute(IntValue, getAssembler())) {
    EmitSLEB128IntValue(IntValue, AddrSpace);
    return;
  }
  new MCLEBFragment(*Value, true, getCurrentSectionData());
}

void MCObjectStreamer::EmitWeakReference(MCSymbol *Alias,
                                         const MCSymbol *Symbol) {
  report_fatal_error("This file format doesn't support weak aliases.");
}

void MCObjectStreamer::ChangeSection(const MCSection *Section) {
  assert(Section && "Cannot switch to a null section!");

  CurSectionData = &getAssembler().getOrCreateSectionData(*Section);
}

void MCObjectStreamer::EmitInstruction(const MCInst &Inst) {
  // Scan for values.
  for (unsigned i = Inst.getNumOperands(); i--; )
    if (Inst.getOperand(i).isExpr())
      AddValueSymbols(Inst.getOperand(i).getExpr());

  getCurrentSectionData()->setHasInstructions(true);

  // Now that a machine instruction has been assembled into this section, make
  // a line entry for any .loc directive that has been seen.
  MCLineEntry::Make(this, getCurrentSection());

  // If this instruction doesn't need relaxation, just emit it as data.
  if (!getAssembler().getBackend().MayNeedRelaxation(Inst)) {
    EmitInstToData(Inst);
    return;
  }

  // Otherwise, if we are relaxing everything, relax the instruction as much as
  // possible and emit it as data.
  if (getAssembler().getRelaxAll()) {
    MCInst Relaxed;
    getAssembler().getBackend().RelaxInstruction(Inst, Relaxed);
    while (getAssembler().getBackend().MayNeedRelaxation(Relaxed))
      getAssembler().getBackend().RelaxInstruction(Relaxed, Relaxed);
    EmitInstToData(Relaxed);
    return;
  }

  // Otherwise emit to a separate fragment.
  EmitInstToFragment(Inst);
}

void MCObjectStreamer::EmitInstToFragment(const MCInst &Inst) {
  MCInstFragment *IF = new MCInstFragment(Inst, getCurrentSectionData());

  raw_svector_ostream VecOS(IF->getCode());
  getAssembler().getEmitter().EncodeInstruction(Inst, VecOS, IF->getFixups());
}

static const MCExpr *BuildSymbolDiff(MCContext &Context,
                                     const MCSymbol *A, const MCSymbol *B) {
  MCSymbolRefExpr::VariantKind Variant = MCSymbolRefExpr::VK_None;
  const MCExpr *ARef =
    MCSymbolRefExpr::Create(A, Variant, Context);
  const MCExpr *BRef =
    MCSymbolRefExpr::Create(B, Variant, Context);
  const MCExpr *AddrDelta =
    MCBinaryExpr::Create(MCBinaryExpr::Sub, ARef, BRef, Context);
  return AddrDelta;
}

static const MCExpr *ForceExpAbs(MCObjectStreamer *Streamer,
                                  MCContext &Context, const MCExpr* Expr) {
 if (Context.getAsmInfo().hasAggressiveSymbolFolding())
   return Expr;

 MCSymbol *ABS = Context.CreateTempSymbol();
 Streamer->EmitAssignment(ABS, Expr);
 return MCSymbolRefExpr::Create(ABS, Context);
}

void MCObjectStreamer::EmitDwarfAdvanceLineAddr(int64_t LineDelta,
                                                const MCSymbol *LastLabel,
                                                const MCSymbol *Label) {
  if (!LastLabel) {
    int PointerSize = getContext().getTargetAsmInfo().getPointerSize();
    EmitDwarfSetLineAddr(LineDelta, Label, PointerSize);
    return;
  }
  const MCExpr *AddrDelta = BuildSymbolDiff(getContext(), Label, LastLabel);
  int64_t Res;
  if (AddrDelta->EvaluateAsAbsolute(Res, getAssembler())) {
    MCDwarfLineAddr::Emit(this, LineDelta, Res);
    return;
  }
  AddrDelta = ForceExpAbs(this, getContext(), AddrDelta);
  new MCDwarfLineAddrFragment(LineDelta, *AddrDelta, getCurrentSectionData());
}

void MCObjectStreamer::EmitDwarfAdvanceFrameAddr(const MCSymbol *LastLabel,
                                                 const MCSymbol *Label) {
  const MCExpr *AddrDelta = BuildSymbolDiff(getContext(), Label, LastLabel);
  int64_t Res;
  if (AddrDelta->EvaluateAsAbsolute(Res, getAssembler())) {
    MCDwarfFrameEmitter::EmitAdvanceLoc(*this, Res);
    return;
  }
  AddrDelta = ForceExpAbs(this, getContext(), AddrDelta);
  new MCDwarfCallFrameFragment(*AddrDelta, getCurrentSectionData());
}

void MCObjectStreamer::EmitValueToOffset(const MCExpr *Offset,
                                        unsigned char Value) {
  int64_t Res;
  if (Offset->EvaluateAsAbsolute(Res, getAssembler())) {
    new MCOrgFragment(*Offset, Value, getCurrentSectionData());
    return;
  }

  MCSymbol *CurrentPos = getContext().CreateTempSymbol();
  EmitLabel(CurrentPos);
  MCSymbolRefExpr::VariantKind Variant = MCSymbolRefExpr::VK_None;
  const MCExpr *Ref =
    MCSymbolRefExpr::Create(CurrentPos, Variant, getContext());
  const MCExpr *Delta =
    MCBinaryExpr::Create(MCBinaryExpr::Sub, Offset, Ref, getContext());

  if (!Delta->EvaluateAsAbsolute(Res, getAssembler()))
    report_fatal_error("expected assembly-time absolute expression");
  EmitFill(Res, Value, 0);
}

void MCObjectStreamer::Finish() {
  // Dump out the dwarf file & directory tables and line tables.
  if (getContext().hasDwarfFiles())
    MCDwarfFileTable::Emit(this);

  getAssembler().Finish();
}
