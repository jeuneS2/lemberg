//===-- llvm/CodeGen/DwarfDebug.h - Dwarf Debug Framework ------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains support for writing dwarf debug info into asm files.
//
//===----------------------------------------------------------------------===//

#ifndef CODEGEN_ASMPRINTER_DWARFDEBUG_H__
#define CODEGEN_ASMPRINTER_DWARFDEBUG_H__

#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineLocation.h"
#include "DIE.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/FoldingSet.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/ADT/UniqueVector.h"
#include "llvm/Support/Allocator.h"
#include "llvm/Support/DebugLoc.h"

namespace llvm {

class CompileUnit;
class DbgConcreteScope;
class DbgScope;
class DbgVariable;
class MachineFrameInfo;
class MachineModuleInfo;
class MachineOperand;
class MCAsmInfo;
class DIEAbbrev;
class DIE;
class DIEBlock;
class DIEEntry;

class DIEnumerator;
class DIDescriptor;
class DIVariable;
class DIGlobal;
class DIGlobalVariable;
class DISubprogram;
class DIBasicType;
class DIDerivedType;
class DIType;
class DINameSpace;
class DISubrange;
class DICompositeType;
class DITemplateTypeParameter;
class DITemplateValueParameter;

//===----------------------------------------------------------------------===//
/// SrcLineInfo - This class is used to record source line correspondence.
///
class SrcLineInfo {
  unsigned Line;                     // Source line number.
  unsigned Column;                   // Source column.
  unsigned SourceID;                 // Source ID number.
  MCSymbol *Label;                   // Label in code ID number.
public:
  SrcLineInfo(unsigned L, unsigned C, unsigned S, MCSymbol *label)
    : Line(L), Column(C), SourceID(S), Label(label) {}

  // Accessors
  unsigned getLine() const { return Line; }
  unsigned getColumn() const { return Column; }
  unsigned getSourceID() const { return SourceID; }
  MCSymbol *getLabel() const { return Label; }
};

/// DotDebugLocEntry - This struct describes location entries emitted in
/// .debug_loc section.
typedef struct DotDebugLocEntry {
  const MCSymbol *Begin;
  const MCSymbol *End;
  MachineLocation Loc;
  bool Merged;
  DotDebugLocEntry() : Begin(0), End(0), Merged(false) {}
  DotDebugLocEntry(const MCSymbol *B, const MCSymbol *E, MachineLocation &L) 
    : Begin(B), End(E), Loc(L), Merged(false) {}
  /// Empty entries are also used as a trigger to emit temp label. Such
  /// labels are referenced is used to find debug_loc offset for a given DIE.
  bool isEmpty() { return Begin == 0 && End == 0; }
  bool isMerged() { return Merged; }
  void Merge(DotDebugLocEntry *Next) {
    if (!(Begin && Loc == Next->Loc && End == Next->Begin))
      return;
    Next->Begin = Begin;
    Merged = true;
  }
} DotDebugLocEntry;

class DwarfDebug {
  /// Asm - Target of Dwarf emission.
  AsmPrinter *Asm;

  /// MMI - Collected machine module information.
  MachineModuleInfo *MMI;

  //===--------------------------------------------------------------------===//
  // Attributes used to construct specific Dwarf sections.
  //

  CompileUnit *FirstCU;
  DenseMap <const MDNode *, CompileUnit *> CUMap;

  /// AbbreviationsSet - Used to uniquely define abbreviations.
  ///
  FoldingSet<DIEAbbrev> AbbreviationsSet;

  /// Abbreviations - A list of all the unique abbreviations in use.
  ///
  std::vector<DIEAbbrev *> Abbreviations;

  /// SourceIdMap - Source id map, i.e. pair of directory id and source file
  /// id mapped to a unique id.
  StringMap<unsigned> SourceIdMap;

  /// DIEBlocks - A list of all the DIEBlocks in use.
  std::vector<DIEBlock *> DIEBlocks;

  // DIEValueAllocator - All DIEValues are allocated through this allocator.
  BumpPtrAllocator DIEValueAllocator;

  /// StringPool - A String->Symbol mapping of strings used by indirect
  /// references.
  StringMap<std::pair<MCSymbol*, unsigned> > StringPool;
  unsigned NextStringPoolNumber;
  
  MCSymbol *getStringPoolEntry(StringRef Str);

  /// SectionMap - Provides a unique id per text section.
  ///
  UniqueVector<const MCSection*> SectionMap;

  /// CurrentFnDbgScope - Top level scope for the current function.
  ///
  DbgScope *CurrentFnDbgScope;
  
  /// CurrentFnArguments - List of Arguments (DbgValues) for current function.
  SmallVector<DbgVariable *, 8> CurrentFnArguments;

  /// DbgScopeMap - Tracks the scopes in the current function.  Owns the
  /// contained DbgScope*s.
  ///
  DenseMap<const MDNode *, DbgScope *> DbgScopeMap;

  /// ConcreteScopes - Tracks the concrete scopees in the current function.
  /// These scopes are also included in DbgScopeMap.
  DenseMap<const MDNode *, DbgScope *> ConcreteScopes;

  /// AbstractScopes - Tracks the abstract scopes a module. These scopes are
  /// not included DbgScopeMap.  AbstractScopes owns its DbgScope*s.
  DenseMap<const MDNode *, DbgScope *> AbstractScopes;

  /// AbstractSPDies - Collection of abstract subprogram DIEs.
  DenseMap<const MDNode *, DIE *> AbstractSPDies;

  /// AbstractScopesList - Tracks abstract scopes constructed while processing
  /// a function. This list is cleared during endFunction().
  SmallVector<DbgScope *, 4>AbstractScopesList;

  /// AbstractVariables - Collection on abstract variables.  Owned by the
  /// DbgScopes in AbstractScopes.
  DenseMap<const MDNode *, DbgVariable *> AbstractVariables;

  /// DbgVariableToFrameIndexMap - Tracks frame index used to find 
  /// variable's value.
  DenseMap<const DbgVariable *, int> DbgVariableToFrameIndexMap;

  /// DbgVariableToDbgInstMap - Maps DbgVariable to corresponding DBG_VALUE
  /// machine instruction.
  DenseMap<const DbgVariable *, const MachineInstr *> DbgVariableToDbgInstMap;

  /// DotDebugLocEntries - Collection of DotDebugLocEntry.
  SmallVector<DotDebugLocEntry, 4> DotDebugLocEntries;

  /// UseDotDebugLocEntry - DW_AT_location attributes for the DIEs in this set
  /// idetifies corresponding .debug_loc entry offset.
  SmallPtrSet<const DIE *, 4> UseDotDebugLocEntry;

  /// VarToAbstractVarMap - Maps DbgVariable with corresponding Abstract
  /// DbgVariable, if any.
  DenseMap<const DbgVariable *, const DbgVariable *> VarToAbstractVarMap;

  /// InliendSubprogramDIEs - Collection of subprgram DIEs that are marked
  /// (at the end of the module) as DW_AT_inline.
  SmallPtrSet<DIE *, 4> InlinedSubprogramDIEs;

  /// ContainingTypeMap - This map is used to keep track of subprogram DIEs that
  /// need DW_AT_containing_type attribute. This attribute points to a DIE that
  /// corresponds to the MDNode mapped with the subprogram DIE.
  DenseMap<DIE *, const MDNode *> ContainingTypeMap;

  typedef SmallVector<DbgScope *, 2> ScopeVector;

  SmallPtrSet<const MachineInstr *, 8> InsnsEndScopeSet;

  /// InlineInfo - Keep track of inlined functions and their location.  This
  /// information is used to populate debug_inlined section.
  typedef std::pair<const MCSymbol *, DIE *> InlineInfoLabels;
  DenseMap<const MDNode *, SmallVector<InlineInfoLabels, 4> > InlineInfo;
  SmallVector<const MDNode *, 4> InlinedSPNodes;

  // ProcessedSPNodes - This is a collection of subprogram MDNodes that
  // are processed to create DIEs.
  SmallPtrSet<const MDNode *, 16> ProcessedSPNodes;

  /// LabelsBeforeInsn - Maps instruction with label emitted before 
  /// instruction.
  DenseMap<const MachineInstr *, MCSymbol *> LabelsBeforeInsn;

  /// LabelsAfterInsn - Maps instruction with label emitted after
  /// instruction.
  DenseMap<const MachineInstr *, MCSymbol *> LabelsAfterInsn;

  /// insnNeedsLabel - Collection of instructions that need a label to mark
  /// a debuggging information entity.
  SmallPtrSet<const MachineInstr *, 8> InsnNeedsLabel;

  SmallVector<const MCSymbol *, 8> DebugRangeSymbols;

  /// Previous instruction's location information. This is used to determine
  /// label location to indicate scope boundries in dwarf debug info.
  DebugLoc PrevInstLoc;
  MCSymbol *PrevLabel;

  struct FunctionDebugFrameInfo {
    unsigned Number;
    std::vector<MachineMove> Moves;

    FunctionDebugFrameInfo(unsigned Num, const std::vector<MachineMove> &M)
      : Number(Num), Moves(M) {}
  };

  std::vector<FunctionDebugFrameInfo> DebugFrames;

  // Section Symbols: these are assembler temporary labels that are emitted at
  // the beginning of each supported dwarf section.  These are used to form
  // section offsets and are created by EmitSectionLabels.
  MCSymbol *DwarfFrameSectionSym, *DwarfInfoSectionSym, *DwarfAbbrevSectionSym;
  MCSymbol *DwarfStrSectionSym, *TextSectionSym, *DwarfDebugRangeSectionSym;
  MCSymbol *DwarfDebugLocSectionSym;
  MCSymbol *FunctionBeginSym, *FunctionEndSym;

  DIEInteger *DIEIntegerOne;
private:

  /// getNumSourceIds - Return the number of unique source ids.
  unsigned getNumSourceIds() const {
    return SourceIdMap.size();
  }

  /// assignAbbrevNumber - Define a unique number for the abbreviation.
  ///
  void assignAbbrevNumber(DIEAbbrev &Abbrev);

  /// createDIEEntry - Creates a new DIEEntry to be a proxy for a debug
  /// information entry.
  DIEEntry *createDIEEntry(DIE *Entry);

  /// addUInt - Add an unsigned integer attribute data and value.
  ///
  void addUInt(DIE *Die, unsigned Attribute, unsigned Form, uint64_t Integer);

  /// addSInt - Add an signed integer attribute data and value.
  ///
  void addSInt(DIE *Die, unsigned Attribute, unsigned Form, int64_t Integer);

  /// addString - Add a string attribute data and value.
  ///
  void addString(DIE *Die, unsigned Attribute, unsigned Form,
                 const StringRef Str);

  /// addLabel - Add a Dwarf label attribute data and value.
  ///
  void addLabel(DIE *Die, unsigned Attribute, unsigned Form,
                const MCSymbol *Label);

  /// addDelta - Add a label delta attribute data and value.
  ///
  void addDelta(DIE *Die, unsigned Attribute, unsigned Form,
                const MCSymbol *Hi, const MCSymbol *Lo);

  /// addDIEEntry - Add a DIE attribute data and value.
  ///
  void addDIEEntry(DIE *Die, unsigned Attribute, unsigned Form, DIE *Entry);
  
  /// addBlock - Add block data.
  ///
  void addBlock(DIE *Die, unsigned Attribute, unsigned Form, DIEBlock *Block);

  /// addSourceLine - Add location information to specified debug information
  /// entry.
  void addSourceLine(DIE *Die, DIVariable V);
  void addSourceLine(DIE *Die, DIGlobalVariable G);
  void addSourceLine(DIE *Die, DISubprogram SP);
  void addSourceLine(DIE *Die, DIType Ty);
  void addSourceLine(DIE *Die, DINameSpace NS);

  /// addAddress - Add an address attribute to a die based on the location
  /// provided.
  void addAddress(DIE *Die, unsigned Attribute,
                  const MachineLocation &Location);

  /// addRegisterAddress - Add register location entry in variable DIE.
  bool addRegisterAddress(DIE *Die, const MachineOperand &MO);

  /// addConstantValue - Add constant value entry in variable DIE.
  bool addConstantValue(DIE *Die, const MachineOperand &MO);
  bool addConstantValue(DIE *Die, ConstantInt *CI, bool Unsigned);

  /// addConstantFPValue - Add constant value entry in variable DIE.
  bool addConstantFPValue(DIE *Die, const MachineOperand &MO);

  /// addComplexAddress - Start with the address based on the location provided,
  /// and generate the DWARF information necessary to find the actual variable
  /// (navigating the extra location information encoded in the type) based on
  /// the starting location.  Add the DWARF information to the die.
  ///
  void addComplexAddress(DbgVariable *&DV, DIE *Die, unsigned Attribute,
                         const MachineLocation &Location);

  // FIXME: Should be reformulated in terms of addComplexAddress.
  /// addBlockByrefAddress - Start with the address based on the location
  /// provided, and generate the DWARF information necessary to find the
  /// actual Block variable (navigating the Block struct) based on the
  /// starting location.  Add the DWARF information to the die.  Obsolete,
  /// please use addComplexAddress instead.
  ///
  void addBlockByrefAddress(DbgVariable *&DV, DIE *Die, unsigned Attribute,
                            const MachineLocation &Location);

  /// addVariableAddress - Add DW_AT_location attribute for a DbgVariable based
  /// on provided frame index.
  void addVariableAddress(DbgVariable *&DV, DIE *Die, int64_t FI);

  /// addToContextOwner - Add Die into the list of its context owner's children.
  void addToContextOwner(DIE *Die, DIDescriptor Context);

  /// addType - Add a new type attribute to the specified entity.
  void addType(DIE *Entity, DIType Ty);

 
  /// getOrCreateNameSpace - Create a DIE for DINameSpace.
  DIE *getOrCreateNameSpace(DINameSpace NS);

  /// getOrCreateTypeDIE - Find existing DIE or create new DIE for the
  /// given DIType.
  DIE *getOrCreateTypeDIE(DIType Ty);

  /// getOrCreateTemplateTypeParameterDIE - Find existing DIE or create new DIE 
  /// for the given DITemplateTypeParameter.
  DIE *getOrCreateTemplateTypeParameterDIE(DITemplateTypeParameter TP);

  /// getOrCreateTemplateValueParameterDIE - Find existing DIE or create new DIE 
  /// for the given DITemplateValueParameter.
  DIE *getOrCreateTemplateValueParameterDIE(DITemplateValueParameter TVP);

  void addPubTypes(DISubprogram SP);

  /// constructTypeDIE - Construct basic type die from DIBasicType.
  void constructTypeDIE(DIE &Buffer,
                        DIBasicType BTy);

  /// constructTypeDIE - Construct derived type die from DIDerivedType.
  void constructTypeDIE(DIE &Buffer,
                        DIDerivedType DTy);

  /// constructTypeDIE - Construct type DIE from DICompositeType.
  void constructTypeDIE(DIE &Buffer,
                        DICompositeType CTy);

  /// constructSubrangeDIE - Construct subrange DIE from DISubrange.
  void constructSubrangeDIE(DIE &Buffer, DISubrange SR, DIE *IndexTy);

  /// constructArrayTypeDIE - Construct array type DIE from DICompositeType.
  void constructArrayTypeDIE(DIE &Buffer, 
                             DICompositeType *CTy);

  /// constructEnumTypeDIE - Construct enum type DIE from DIEnumerator.
  DIE *constructEnumTypeDIE(DIEnumerator ETy);

  /// createMemberDIE - Create new member DIE.
  DIE *createMemberDIE(DIDerivedType DT);

  /// createSubprogramDIE - Create new DIE using SP.
  DIE *createSubprogramDIE(DISubprogram SP);

  /// getOrCreateDbgScope - Create DbgScope for the scope.
  DbgScope *getOrCreateDbgScope(const MDNode *Scope, const MDNode *InlinedAt);

  DbgScope *getOrCreateAbstractScope(const MDNode *N);

  /// findAbstractVariable - Find abstract variable associated with Var.
  DbgVariable *findAbstractVariable(DIVariable &Var, DebugLoc Loc);

  /// updateSubprogramScopeDIE - Find DIE for the given subprogram and 
  /// attach appropriate DW_AT_low_pc and DW_AT_high_pc attributes.
  /// If there are global variables in this scope then create and insert
  /// DIEs for these variables.
  DIE *updateSubprogramScopeDIE(const MDNode *SPNode);

  /// constructLexicalScope - Construct new DW_TAG_lexical_block 
  /// for this scope and attach DW_AT_low_pc/DW_AT_high_pc labels.
  DIE *constructLexicalScopeDIE(DbgScope *Scope);

  /// constructInlinedScopeDIE - This scope represents inlined body of
  /// a function. Construct DIE to represent this concrete inlined copy
  /// of the function.
  DIE *constructInlinedScopeDIE(DbgScope *Scope);

  /// constructVariableDIE - Construct a DIE for the given DbgVariable.
  DIE *constructVariableDIE(DbgVariable *DV, DbgScope *S);

  /// constructScopeDIE - Construct a DIE for this scope.
  DIE *constructScopeDIE(DbgScope *Scope);

  /// EmitSectionLabels - Emit initial Dwarf sections with a label at
  /// the start of each one.
  void EmitSectionLabels();

  /// emitDIE - Recusively Emits a debug information entry.
  ///
  void emitDIE(DIE *Die);

  /// computeSizeAndOffset - Compute the size and offset of a DIE.
  ///
  unsigned computeSizeAndOffset(DIE *Die, unsigned Offset, bool Last);

  /// computeSizeAndOffsets - Compute the size and offset of all the DIEs.
  ///
  void computeSizeAndOffsets();

  /// EmitDebugInfo - Emit the debug info section.
  ///
  void emitDebugInfo();

  /// emitAbbreviations - Emit the abbreviation section.
  ///
  void emitAbbreviations() const;

  /// emitEndOfLineMatrix - Emit the last address of the section and the end of
  /// the line matrix.
  ///
  void emitEndOfLineMatrix(unsigned SectionEnd);

  /// emitCommonDebugFrame - Emit common frame info into a debug frame section.
  ///
  void emitCommonDebugFrame();

  /// emitFunctionDebugFrame - Emit per function frame info into a debug frame
  /// section.
  void emitFunctionDebugFrame(const FunctionDebugFrameInfo &DebugFrameInfo);

  /// emitDebugPubNames - Emit visible names into a debug pubnames section.
  ///
  void emitDebugPubNames();

  /// emitDebugPubTypes - Emit visible types into a debug pubtypes section.
  ///
  void emitDebugPubTypes();

  /// emitDebugStr - Emit visible names into a debug str section.
  ///
  void emitDebugStr();

  /// emitDebugLoc - Emit visible names into a debug loc section.
  ///
  void emitDebugLoc();

  /// EmitDebugARanges - Emit visible names into a debug aranges section.
  ///
  void EmitDebugARanges();

  /// emitDebugRanges - Emit visible names into a debug ranges section.
  ///
  void emitDebugRanges();

  /// emitDebugMacInfo - Emit visible names into a debug macinfo section.
  ///
  void emitDebugMacInfo();

  /// emitDebugInlineInfo - Emit inline info using following format.
  /// Section Header:
  /// 1. length of section
  /// 2. Dwarf version number
  /// 3. address size.
  ///
  /// Entries (one "entry" for each function that was inlined):
  ///
  /// 1. offset into __debug_str section for MIPS linkage name, if exists; 
  ///   otherwise offset into __debug_str for regular function name.
  /// 2. offset into __debug_str section for regular function name.
  /// 3. an unsigned LEB128 number indicating the number of distinct inlining 
  /// instances for the function.
  /// 
  /// The rest of the entry consists of a {die_offset, low_pc}  pair for each 
  /// inlined instance; the die_offset points to the inlined_subroutine die in
  /// the __debug_info section, and the low_pc is the starting address  for the
  ///  inlining instance.
  void emitDebugInlineInfo();

  /// GetOrCreateSourceID - Look up the source id with the given directory and
  /// source file names. If none currently exists, create a new id and insert it
  /// in the SourceIds map.
  unsigned GetOrCreateSourceID(StringRef FullName);

  /// constructCompileUnit - Create new CompileUnit for the given 
  /// metadata node with tag DW_TAG_compile_unit.
  void constructCompileUnit(const MDNode *N);

  /// getCompielUnit - Get CompileUnit DIE.
  CompileUnit *getCompileUnit(const MDNode *N) const;

  /// constructGlobalVariableDIE - Construct global variable DIE.
  void constructGlobalVariableDIE(const MDNode *N);

  /// construct SubprogramDIE - Construct subprogram DIE.
  void constructSubprogramDIE(const MDNode *N);

  /// recordSourceLine - Register a source line with debug info. Returns the
  /// unique label that was emitted and which provides correspondence to
  /// the source line list.
  MCSymbol *recordSourceLine(unsigned Line, unsigned Col, const MDNode *Scope);
  
  /// recordVariableFrameIndex - Record a variable's index.
  void recordVariableFrameIndex(const DbgVariable *V, int Index);

  /// findVariableFrameIndex - Return true if frame index for the variable
  /// is found. Update FI to hold value of the index.
  bool findVariableFrameIndex(const DbgVariable *V, int *FI);

  /// findDbgScope - Find DbgScope for the debug loc attached with an 
  /// instruction.
  DbgScope *findDbgScope(const MachineInstr *MI);

  /// identifyScopeMarkers() - Indentify instructions that are marking
  /// beginning of or end of a scope.
  void identifyScopeMarkers();

  /// extractScopeInformation - Scan machine instructions in this function
  /// and collect DbgScopes. Return true, if atleast one scope was found.
  bool extractScopeInformation();
  
  /// addCurrentFnArgument - If Var is an current function argument that add
  /// it in CurrentFnArguments list.
  bool addCurrentFnArgument(const MachineFunction *MF,
                            DbgVariable *Var, DbgScope *Scope);

  /// collectVariableInfo - Populate DbgScope entries with variables' info.
  void collectVariableInfo(const MachineFunction *,
                           SmallPtrSet<const MDNode *, 16> &ProcessedVars);
  
  /// collectVariableInfoFromMMITable - Collect variable information from
  /// side table maintained by MMI.
  void collectVariableInfoFromMMITable(const MachineFunction * MF,
                                       SmallPtrSet<const MDNode *, 16> &P);
public:
  //===--------------------------------------------------------------------===//
  // Main entry points.
  //
  DwarfDebug(AsmPrinter *A, Module *M);
  ~DwarfDebug();

  /// beginModule - Emit all Dwarf sections that should come prior to the
  /// content.
  void beginModule(Module *M);

  /// endModule - Emit all Dwarf sections that should come after the content.
  ///
  void endModule();

  /// beginFunction - Gather pre-function debug information.  Assumes being
  /// emitted immediately after the function entry point.
  void beginFunction(const MachineFunction *MF);

  /// endFunction - Gather and emit post-function debug information.
  ///
  void endFunction(const MachineFunction *MF);

  /// getLabelBeforeInsn - Return Label preceding the instruction.
  const MCSymbol *getLabelBeforeInsn(const MachineInstr *MI);

  /// getLabelAfterInsn - Return Label immediately following the instruction.
  const MCSymbol *getLabelAfterInsn(const MachineInstr *MI);

  /// beginInstruction - Process beginning of an instruction.
  void beginInstruction(const MachineInstr *MI);

  /// endInstruction - Prcess end of an instruction.
  void endInstruction(const MachineInstr *MI);
};
} // End of namespace llvm

#endif
