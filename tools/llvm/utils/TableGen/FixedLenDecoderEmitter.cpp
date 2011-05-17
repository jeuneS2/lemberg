//===------------ FixedLenDecoderEmitter.cpp - Decoder Generator ----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// It contains the tablegen backend that emits the decoder functions for
// targets with fixed length instruction set.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "decoder-emitter"

#include "FixedLenDecoderEmitter.h"
#include "CodeGenTarget.h"
#include "Record.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include <vector>
#include <map>
#include <string>

using namespace llvm;

// The set (BIT_TRUE, BIT_FALSE, BIT_UNSET) represents a ternary logic system
// for a bit value.
//
// BIT_UNFILTERED is used as the init value for a filter position.  It is used
// only for filter processings.
typedef enum {
  BIT_TRUE,      // '1'
  BIT_FALSE,     // '0'
  BIT_UNSET,     // '?'
  BIT_UNFILTERED // unfiltered
} bit_value_t;

static bool ValueSet(bit_value_t V) {
  return (V == BIT_TRUE || V == BIT_FALSE);
}
static bool ValueNotSet(bit_value_t V) {
  return (V == BIT_UNSET);
}
static int Value(bit_value_t V) {
  return ValueNotSet(V) ? -1 : (V == BIT_FALSE ? 0 : 1);
}
static bit_value_t bitFromBits(BitsInit &bits, unsigned index) {
  if (BitInit *bit = dynamic_cast<BitInit*>(bits.getBit(index)))
    return bit->getValue() ? BIT_TRUE : BIT_FALSE;

  // The bit is uninitialized.
  return BIT_UNSET;
}
// Prints the bit value for each position.
static void dumpBits(raw_ostream &o, BitsInit &bits) {
  unsigned index;

  for (index = bits.getNumBits(); index > 0; index--) {
    switch (bitFromBits(bits, index - 1)) {
    case BIT_TRUE:
      o << "1";
      break;
    case BIT_FALSE:
      o << "0";
      break;
    case BIT_UNSET:
      o << "_";
      break;
    default:
      assert(0 && "unexpected return value from bitFromBits");
    }
  }
}

static BitsInit &getBitsField(const Record &def, const char *str) {
  BitsInit *bits = def.getValueAsBitsInit(str);
  return *bits;
}

// Forward declaration.
class FilterChooser;

// FIXME: Possibly auto-detected?
#define BIT_WIDTH 32

// Representation of the instruction to work on.
typedef bit_value_t insn_t[BIT_WIDTH];

/// Filter - Filter works with FilterChooser to produce the decoding tree for
/// the ISA.
///
/// It is useful to think of a Filter as governing the switch stmts of the
/// decoding tree in a certain level.  Each case stmt delegates to an inferior
/// FilterChooser to decide what further decoding logic to employ, or in another
/// words, what other remaining bits to look at.  The FilterChooser eventually
/// chooses a best Filter to do its job.
///
/// This recursive scheme ends when the number of Opcodes assigned to the
/// FilterChooser becomes 1 or if there is a conflict.  A conflict happens when
/// the Filter/FilterChooser combo does not know how to distinguish among the
/// Opcodes assigned.
///
/// An example of a conflict is
///
/// Conflict:
///                     111101000.00........00010000....
///                     111101000.00........0001........
///                     1111010...00........0001........
///                     1111010...00....................
///                     1111010.........................
///                     1111............................
///                     ................................
///     VST4q8a         111101000_00________00010000____
///     VST4q8b         111101000_00________00010000____
///
/// The Debug output shows the path that the decoding tree follows to reach the
/// the conclusion that there is a conflict.  VST4q8a is a vst4 to double-spaced
/// even registers, while VST4q8b is a vst4 to double-spaced odd regsisters.
///
/// The encoding info in the .td files does not specify this meta information,
/// which could have been used by the decoder to resolve the conflict.  The
/// decoder could try to decode the even/odd register numbering and assign to
/// VST4q8a or VST4q8b, but for the time being, the decoder chooses the "a"
/// version and return the Opcode since the two have the same Asm format string.
class Filter {
protected:
  FilterChooser *Owner; // points to the FilterChooser who owns this filter
  unsigned StartBit; // the starting bit position
  unsigned NumBits; // number of bits to filter
  bool Mixed; // a mixed region contains both set and unset bits

  // Map of well-known segment value to the set of uid's with that value.
  std::map<uint64_t, std::vector<unsigned> > FilteredInstructions;

  // Set of uid's with non-constant segment values.
  std::vector<unsigned> VariableInstructions;

  // Map of well-known segment value to its delegate.
  std::map<unsigned, FilterChooser*> FilterChooserMap;

  // Number of instructions which fall under FilteredInstructions category.
  unsigned NumFiltered;

  // Keeps track of the last opcode in the filtered bucket.
  unsigned LastOpcFiltered;

  // Number of instructions which fall under VariableInstructions category.
  unsigned NumVariable;

public:
  unsigned getNumFiltered() { return NumFiltered; }
  unsigned getNumVariable() { return NumVariable; }
  unsigned getSingletonOpc() {
    assert(NumFiltered == 1);
    return LastOpcFiltered;
  }
  // Return the filter chooser for the group of instructions without constant
  // segment values.
  FilterChooser &getVariableFC() {
    assert(NumFiltered == 1);
    assert(FilterChooserMap.size() == 1);
    return *(FilterChooserMap.find((unsigned)-1)->second);
  }

  Filter(const Filter &f);
  Filter(FilterChooser &owner, unsigned startBit, unsigned numBits, bool mixed);

  ~Filter();

  // Divides the decoding task into sub tasks and delegates them to the
  // inferior FilterChooser's.
  //
  // A special case arises when there's only one entry in the filtered
  // instructions.  In order to unambiguously decode the singleton, we need to
  // match the remaining undecoded encoding bits against the singleton.
  void recurse();

  // Emit code to decode instructions given a segment or segments of bits.
  void emit(raw_ostream &o, unsigned &Indentation);

  // Returns the number of fanout produced by the filter.  More fanout implies
  // the filter distinguishes more categories of instructions.
  unsigned usefulness() const;
}; // End of class Filter

// These are states of our finite state machines used in FilterChooser's
// filterProcessor() which produces the filter candidates to use.
typedef enum {
  ATTR_NONE,
  ATTR_FILTERED,
  ATTR_ALL_SET,
  ATTR_ALL_UNSET,
  ATTR_MIXED
} bitAttr_t;

/// FilterChooser - FilterChooser chooses the best filter among a set of Filters
/// in order to perform the decoding of instructions at the current level.
///
/// Decoding proceeds from the top down.  Based on the well-known encoding bits
/// of instructions available, FilterChooser builds up the possible Filters that
/// can further the task of decoding by distinguishing among the remaining
/// candidate instructions.
///
/// Once a filter has been chosen, it is called upon to divide the decoding task
/// into sub-tasks and delegates them to its inferior FilterChoosers for further
/// processings.
///
/// It is useful to think of a Filter as governing the switch stmts of the
/// decoding tree.  And each case is delegated to an inferior FilterChooser to
/// decide what further remaining bits to look at.
class FilterChooser {
protected:
  friend class Filter;

  // Vector of codegen instructions to choose our filter.
  const std::vector<const CodeGenInstruction*> &AllInstructions;

  // Vector of uid's for this filter chooser to work on.
  const std::vector<unsigned> Opcodes;

  // Lookup table for the operand decoding of instructions.
  std::map<unsigned, std::vector<OperandInfo> > &Operands;

  // Vector of candidate filters.
  std::vector<Filter> Filters;

  // Array of bit values passed down from our parent.
  // Set to all BIT_UNFILTERED's for Parent == NULL.
  bit_value_t FilterBitValues[BIT_WIDTH];

  // Links to the FilterChooser above us in the decoding tree.
  FilterChooser *Parent;

  // Index of the best filter from Filters.
  int BestIndex;

public:
  FilterChooser(const FilterChooser &FC) :
    AllInstructions(FC.AllInstructions), Opcodes(FC.Opcodes),
      Operands(FC.Operands), Filters(FC.Filters), Parent(FC.Parent),
      BestIndex(FC.BestIndex) {
    memcpy(FilterBitValues, FC.FilterBitValues, sizeof(FilterBitValues));
  }

  FilterChooser(const std::vector<const CodeGenInstruction*> &Insts,
                const std::vector<unsigned> &IDs,
    std::map<unsigned, std::vector<OperandInfo> > &Ops) :
      AllInstructions(Insts), Opcodes(IDs), Operands(Ops), Filters(),
      Parent(NULL), BestIndex(-1) {
    for (unsigned i = 0; i < BIT_WIDTH; ++i)
      FilterBitValues[i] = BIT_UNFILTERED;

    doFilter();
  }

  FilterChooser(const std::vector<const CodeGenInstruction*> &Insts,
                const std::vector<unsigned> &IDs,
        std::map<unsigned, std::vector<OperandInfo> > &Ops,
                bit_value_t (&ParentFilterBitValues)[BIT_WIDTH],
                FilterChooser &parent) :
      AllInstructions(Insts), Opcodes(IDs), Operands(Ops),
      Filters(), Parent(&parent), BestIndex(-1) {
    for (unsigned i = 0; i < BIT_WIDTH; ++i)
      FilterBitValues[i] = ParentFilterBitValues[i];

    doFilter();
  }

  // The top level filter chooser has NULL as its parent.
  bool isTopLevel() { return Parent == NULL; }

  // Emit the top level typedef and decodeInstruction() function.
  void emitTop(raw_ostream &o, unsigned Indentation);

protected:
  // Populates the insn given the uid.
  void insnWithID(insn_t &Insn, unsigned Opcode) const {
    BitsInit &Bits = getBitsField(*AllInstructions[Opcode]->TheDef, "Inst");

    for (unsigned i = 0; i < BIT_WIDTH; ++i)
      Insn[i] = bitFromBits(Bits, i);
  }

  // Returns the record name.
  const std::string &nameWithID(unsigned Opcode) const {
    return AllInstructions[Opcode]->TheDef->getName();
  }

  // Populates the field of the insn given the start position and the number of
  // consecutive bits to scan for.
  //
  // Returns false if there exists any uninitialized bit value in the range.
  // Returns true, otherwise.
  bool fieldFromInsn(uint64_t &Field, insn_t &Insn, unsigned StartBit,
      unsigned NumBits) const;

  /// dumpFilterArray - dumpFilterArray prints out debugging info for the given
  /// filter array as a series of chars.
  void dumpFilterArray(raw_ostream &o, bit_value_t (&filter)[BIT_WIDTH]);

  /// dumpStack - dumpStack traverses the filter chooser chain and calls
  /// dumpFilterArray on each filter chooser up to the top level one.
  void dumpStack(raw_ostream &o, const char *prefix);

  Filter &bestFilter() {
    assert(BestIndex != -1 && "BestIndex not set");
    return Filters[BestIndex];
  }

  // Called from Filter::recurse() when singleton exists.  For debug purpose.
  void SingletonExists(unsigned Opc);

  bool PositionFiltered(unsigned i) {
    return ValueSet(FilterBitValues[i]);
  }

  // Calculates the island(s) needed to decode the instruction.
  // This returns a lit of undecoded bits of an instructions, for example,
  // Inst{20} = 1 && Inst{3-0} == 0b1111 represents two islands of yet-to-be
  // decoded bits in order to verify that the instruction matches the Opcode.
  unsigned getIslands(std::vector<unsigned> &StartBits,
      std::vector<unsigned> &EndBits, std::vector<uint64_t> &FieldVals,
      insn_t &Insn);

  // Emits code to decode the singleton.  Return true if we have matched all the
  // well-known bits.
  bool emitSingletonDecoder(raw_ostream &o, unsigned &Indentation,unsigned Opc);

  // Emits code to decode the singleton, and then to decode the rest.
  void emitSingletonDecoder(raw_ostream &o, unsigned &Indentation,Filter &Best);

  // Assign a single filter and run with it.
  void runSingleFilter(FilterChooser &owner, unsigned startBit, unsigned numBit,
      bool mixed);

  // reportRegion is a helper function for filterProcessor to mark a region as
  // eligible for use as a filter region.
  void reportRegion(bitAttr_t RA, unsigned StartBit, unsigned BitIndex,
      bool AllowMixed);

  // FilterProcessor scans the well-known encoding bits of the instructions and
  // builds up a list of candidate filters.  It chooses the best filter and
  // recursively descends down the decoding tree.
  bool filterProcessor(bool AllowMixed, bool Greedy = true);

  // Decides on the best configuration of filter(s) to use in order to decode
  // the instructions.  A conflict of instructions may occur, in which case we
  // dump the conflict set to the standard error.
  void doFilter();

  // Emits code to decode our share of instructions.  Returns true if the
  // emitted code causes a return, which occurs if we know how to decode
  // the instruction at this level or the instruction is not decodeable.
  bool emit(raw_ostream &o, unsigned &Indentation);
};

///////////////////////////
//                       //
// Filter Implmenetation //
//                       //
///////////////////////////

Filter::Filter(const Filter &f) :
  Owner(f.Owner), StartBit(f.StartBit), NumBits(f.NumBits), Mixed(f.Mixed),
  FilteredInstructions(f.FilteredInstructions),
  VariableInstructions(f.VariableInstructions),
  FilterChooserMap(f.FilterChooserMap), NumFiltered(f.NumFiltered),
  LastOpcFiltered(f.LastOpcFiltered), NumVariable(f.NumVariable) {
}

Filter::Filter(FilterChooser &owner, unsigned startBit, unsigned numBits,
    bool mixed) : Owner(&owner), StartBit(startBit), NumBits(numBits),
                  Mixed(mixed) {
  assert(StartBit + NumBits - 1 < BIT_WIDTH);

  NumFiltered = 0;
  LastOpcFiltered = 0;
  NumVariable = 0;

  for (unsigned i = 0, e = Owner->Opcodes.size(); i != e; ++i) {
    insn_t Insn;

    // Populates the insn given the uid.
    Owner->insnWithID(Insn, Owner->Opcodes[i]);

    uint64_t Field;
    // Scans the segment for possibly well-specified encoding bits.
    bool ok = Owner->fieldFromInsn(Field, Insn, StartBit, NumBits);

    if (ok) {
      // The encoding bits are well-known.  Lets add the uid of the
      // instruction into the bucket keyed off the constant field value.
      LastOpcFiltered = Owner->Opcodes[i];
      FilteredInstructions[Field].push_back(LastOpcFiltered);
      ++NumFiltered;
    } else {
      // Some of the encoding bit(s) are unspecfied.  This contributes to
      // one additional member of "Variable" instructions.
      VariableInstructions.push_back(Owner->Opcodes[i]);
      ++NumVariable;
    }
  }

  assert((FilteredInstructions.size() + VariableInstructions.size() > 0)
         && "Filter returns no instruction categories");
}

Filter::~Filter() {
  std::map<unsigned, FilterChooser*>::iterator filterIterator;
  for (filterIterator = FilterChooserMap.begin();
       filterIterator != FilterChooserMap.end();
       filterIterator++) {
    delete filterIterator->second;
  }
}

// Divides the decoding task into sub tasks and delegates them to the
// inferior FilterChooser's.
//
// A special case arises when there's only one entry in the filtered
// instructions.  In order to unambiguously decode the singleton, we need to
// match the remaining undecoded encoding bits against the singleton.
void Filter::recurse() {
  std::map<uint64_t, std::vector<unsigned> >::const_iterator mapIterator;

  bit_value_t BitValueArray[BIT_WIDTH];
  // Starts by inheriting our parent filter chooser's filter bit values.
  memcpy(BitValueArray, Owner->FilterBitValues, sizeof(BitValueArray));

  unsigned bitIndex;

  if (VariableInstructions.size()) {
    // Conservatively marks each segment position as BIT_UNSET.
    for (bitIndex = 0; bitIndex < NumBits; bitIndex++)
      BitValueArray[StartBit + bitIndex] = BIT_UNSET;

    // Delegates to an inferior filter chooser for futher processing on this
    // group of instructions whose segment values are variable.
    FilterChooserMap.insert(std::pair<unsigned, FilterChooser*>(
                              (unsigned)-1,
                              new FilterChooser(Owner->AllInstructions,
                                                VariableInstructions,
                                                Owner->Operands,
                                                BitValueArray,
                                                *Owner)
                              ));
  }

  // No need to recurse for a singleton filtered instruction.
  // See also Filter::emit().
  if (getNumFiltered() == 1) {
    //Owner->SingletonExists(LastOpcFiltered);
    assert(FilterChooserMap.size() == 1);
    return;
  }

  // Otherwise, create sub choosers.
  for (mapIterator = FilteredInstructions.begin();
       mapIterator != FilteredInstructions.end();
       mapIterator++) {

    // Marks all the segment positions with either BIT_TRUE or BIT_FALSE.
    for (bitIndex = 0; bitIndex < NumBits; bitIndex++) {
      if (mapIterator->first & (1ULL << bitIndex))
        BitValueArray[StartBit + bitIndex] = BIT_TRUE;
      else
        BitValueArray[StartBit + bitIndex] = BIT_FALSE;
    }

    // Delegates to an inferior filter chooser for futher processing on this
    // category of instructions.
    FilterChooserMap.insert(std::pair<unsigned, FilterChooser*>(
                              mapIterator->first,
                              new FilterChooser(Owner->AllInstructions,
                                                mapIterator->second,
                                                Owner->Operands,
                                                BitValueArray,
                                                *Owner)
                              ));
  }
}

// Emit code to decode instructions given a segment or segments of bits.
void Filter::emit(raw_ostream &o, unsigned &Indentation) {
  o.indent(Indentation) << "// Check Inst{";

  if (NumBits > 1)
    o << (StartBit + NumBits - 1) << '-';

  o << StartBit << "} ...\n";

  o.indent(Indentation) << "switch (fieldFromInstruction(insn, "
                        << StartBit << ", " << NumBits << ")) {\n";

  std::map<unsigned, FilterChooser*>::iterator filterIterator;

  bool DefaultCase = false;
  for (filterIterator = FilterChooserMap.begin();
       filterIterator != FilterChooserMap.end();
       filterIterator++) {

    // Field value -1 implies a non-empty set of variable instructions.
    // See also recurse().
    if (filterIterator->first == (unsigned)-1) {
      DefaultCase = true;

      o.indent(Indentation) << "default:\n";
      o.indent(Indentation) << "  break; // fallthrough\n";

      // Closing curly brace for the switch statement.
      // This is unconventional because we want the default processing to be
      // performed for the fallthrough cases as well, i.e., when the "cases"
      // did not prove a decoded instruction.
      o.indent(Indentation) << "}\n";

    } else
      o.indent(Indentation) << "case " << filterIterator->first << ":\n";

    // We arrive at a category of instructions with the same segment value.
    // Now delegate to the sub filter chooser for further decodings.
    // The case may fallthrough, which happens if the remaining well-known
    // encoding bits do not match exactly.
    if (!DefaultCase) { ++Indentation; ++Indentation; }

    bool finished = filterIterator->second->emit(o, Indentation);
    // For top level default case, there's no need for a break statement.
    if (Owner->isTopLevel() && DefaultCase)
      break;
    if (!finished)
      o.indent(Indentation) << "break;\n";

    if (!DefaultCase) { --Indentation; --Indentation; }
  }

  // If there is no default case, we still need to supply a closing brace.
  if (!DefaultCase) {
    // Closing curly brace for the switch statement.
    o.indent(Indentation) << "}\n";
  }
}

// Returns the number of fanout produced by the filter.  More fanout implies
// the filter distinguishes more categories of instructions.
unsigned Filter::usefulness() const {
  if (VariableInstructions.size())
    return FilteredInstructions.size();
  else
    return FilteredInstructions.size() + 1;
}

//////////////////////////////////
//                              //
// Filterchooser Implementation //
//                              //
//////////////////////////////////

// Emit the top level typedef and decodeInstruction() function.
void FilterChooser::emitTop(raw_ostream &o, unsigned Indentation) {
  switch (BIT_WIDTH) {
  case 8:
    o.indent(Indentation) << "typedef uint8_t field_t;\n";
    break;
  case 16:
    o.indent(Indentation) << "typedef uint16_t field_t;\n";
    break;
  case 32:
    o.indent(Indentation) << "typedef uint32_t field_t;\n";
    break;
  case 64:
    o.indent(Indentation) << "typedef uint64_t field_t;\n";
    break;
  default:
    assert(0 && "Unexpected instruction size!");
  }

  o << '\n';

  o.indent(Indentation) << "static field_t " <<
    "fieldFromInstruction(field_t insn, unsigned startBit, unsigned numBits)\n";

  o.indent(Indentation) << "{\n";

  ++Indentation; ++Indentation;
  o.indent(Indentation) << "assert(startBit + numBits <= " << BIT_WIDTH
                        << " && \"Instruction field out of bounds!\");\n";
  o << '\n';
  o.indent(Indentation) << "field_t fieldMask;\n";
  o << '\n';
  o.indent(Indentation) << "if (numBits == " << BIT_WIDTH << ")\n";

  ++Indentation; ++Indentation;
  o.indent(Indentation) << "fieldMask = (field_t)-1;\n";
  --Indentation; --Indentation;

  o.indent(Indentation) << "else\n";

  ++Indentation; ++Indentation;
  o.indent(Indentation) << "fieldMask = ((1 << numBits) - 1) << startBit;\n";
  --Indentation; --Indentation;

  o << '\n';
  o.indent(Indentation) << "return (insn & fieldMask) >> startBit;\n";
  --Indentation; --Indentation;

  o.indent(Indentation) << "}\n";

  o << '\n';

  o.indent(Indentation) <<
    "static bool decodeInstruction(MCInst &MI, field_t insn) {\n";
  o.indent(Indentation) << "  unsigned tmp = 0;\n";

  ++Indentation; ++Indentation;
  // Emits code to decode the instructions.
  emit(o, Indentation);

  o << '\n';
  o.indent(Indentation) << "return false;\n";
  --Indentation; --Indentation;

  o.indent(Indentation) << "}\n";

  o << '\n';
}

// Populates the field of the insn given the start position and the number of
// consecutive bits to scan for.
//
// Returns false if and on the first uninitialized bit value encountered.
// Returns true, otherwise.
bool FilterChooser::fieldFromInsn(uint64_t &Field, insn_t &Insn,
    unsigned StartBit, unsigned NumBits) const {
  Field = 0;

  for (unsigned i = 0; i < NumBits; ++i) {
    if (Insn[StartBit + i] == BIT_UNSET)
      return false;

    if (Insn[StartBit + i] == BIT_TRUE)
      Field = Field | (1ULL << i);
  }

  return true;
}

/// dumpFilterArray - dumpFilterArray prints out debugging info for the given
/// filter array as a series of chars.
void FilterChooser::dumpFilterArray(raw_ostream &o,
                                    bit_value_t (&filter)[BIT_WIDTH]) {
  unsigned bitIndex;

  for (bitIndex = BIT_WIDTH; bitIndex > 0; bitIndex--) {
    switch (filter[bitIndex - 1]) {
    case BIT_UNFILTERED:
      o << ".";
      break;
    case BIT_UNSET:
      o << "_";
      break;
    case BIT_TRUE:
      o << "1";
      break;
    case BIT_FALSE:
      o << "0";
      break;
    }
  }
}

/// dumpStack - dumpStack traverses the filter chooser chain and calls
/// dumpFilterArray on each filter chooser up to the top level one.
void FilterChooser::dumpStack(raw_ostream &o, const char *prefix) {
  FilterChooser *current = this;

  while (current) {
    o << prefix;
    dumpFilterArray(o, current->FilterBitValues);
    o << '\n';
    current = current->Parent;
  }
}

// Called from Filter::recurse() when singleton exists.  For debug purpose.
void FilterChooser::SingletonExists(unsigned Opc) {
  insn_t Insn0;
  insnWithID(Insn0, Opc);

  errs() << "Singleton exists: " << nameWithID(Opc)
         << " with its decoding dominating ";
  for (unsigned i = 0; i < Opcodes.size(); ++i) {
    if (Opcodes[i] == Opc) continue;
    errs() << nameWithID(Opcodes[i]) << ' ';
  }
  errs() << '\n';

  dumpStack(errs(), "\t\t");
  for (unsigned i = 0; i < Opcodes.size(); i++) {
    const std::string &Name = nameWithID(Opcodes[i]);

    errs() << '\t' << Name << " ";
    dumpBits(errs(),
             getBitsField(*AllInstructions[Opcodes[i]]->TheDef, "Inst"));
    errs() << '\n';
  }
}

// Calculates the island(s) needed to decode the instruction.
// This returns a list of undecoded bits of an instructions, for example,
// Inst{20} = 1 && Inst{3-0} == 0b1111 represents two islands of yet-to-be
// decoded bits in order to verify that the instruction matches the Opcode.
unsigned FilterChooser::getIslands(std::vector<unsigned> &StartBits,
    std::vector<unsigned> &EndBits, std::vector<uint64_t> &FieldVals,
    insn_t &Insn) {
  unsigned Num, BitNo;
  Num = BitNo = 0;

  uint64_t FieldVal = 0;

  // 0: Init
  // 1: Water (the bit value does not affect decoding)
  // 2: Island (well-known bit value needed for decoding)
  int State = 0;
  int Val = -1;

  for (unsigned i = 0; i < BIT_WIDTH; ++i) {
    Val = Value(Insn[i]);
    bool Filtered = PositionFiltered(i);
    switch (State) {
    default:
      assert(0 && "Unreachable code!");
      break;
    case 0:
    case 1:
      if (Filtered || Val == -1)
        State = 1; // Still in Water
      else {
        State = 2; // Into the Island
        BitNo = 0;
        StartBits.push_back(i);
        FieldVal = Val;
      }
      break;
    case 2:
      if (Filtered || Val == -1) {
        State = 1; // Into the Water
        EndBits.push_back(i - 1);
        FieldVals.push_back(FieldVal);
        ++Num;
      } else {
        State = 2; // Still in Island
        ++BitNo;
        FieldVal = FieldVal | Val << BitNo;
      }
      break;
    }
  }
  // If we are still in Island after the loop, do some housekeeping.
  if (State == 2) {
    EndBits.push_back(BIT_WIDTH - 1);
    FieldVals.push_back(FieldVal);
    ++Num;
  }

  assert(StartBits.size() == Num && EndBits.size() == Num &&
         FieldVals.size() == Num);
  return Num;
}

// Emits code to decode the singleton.  Return true if we have matched all the
// well-known bits.
bool FilterChooser::emitSingletonDecoder(raw_ostream &o, unsigned &Indentation,
                                         unsigned Opc) {
  std::vector<unsigned> StartBits;
  std::vector<unsigned> EndBits;
  std::vector<uint64_t> FieldVals;
  insn_t Insn;
  insnWithID(Insn, Opc);

  // Look for islands of undecoded bits of the singleton.
  getIslands(StartBits, EndBits, FieldVals, Insn);

  unsigned Size = StartBits.size();
  unsigned I, NumBits;

  // If we have matched all the well-known bits, just issue a return.
  if (Size == 0) {
    o.indent(Indentation) << "{\n";
    o.indent(Indentation) << "  MI.setOpcode(" << Opc << ");\n";
    std::vector<OperandInfo>& InsnOperands = Operands[Opc];
    for (std::vector<OperandInfo>::iterator
         I = InsnOperands.begin(), E = InsnOperands.end(); I != E; ++I) {
      // If a custom instruction decoder was specified, use that.
      if (I->FieldBase == ~0U && I->FieldLength == ~0U) {
        o.indent(Indentation) << "  " << I->Decoder << "(MI, insn);\n";
        break;
      }

      o.indent(Indentation)
        << "  tmp = fieldFromInstruction(insn, " << I->FieldBase
        << ", " << I->FieldLength << ");\n";
      if (I->Decoder != "") {
        o.indent(Indentation) << "  " << I->Decoder << "(MI, tmp);\n";
      } else {
        o.indent(Indentation)
          << "  MI.addOperand(MCOperand::CreateImm(tmp));\n";
      }
    }

    o.indent(Indentation) << "  return true; // " << nameWithID(Opc)
                          << '\n';
    o.indent(Indentation) << "}\n";
    return true;
  }

  // Otherwise, there are more decodings to be done!

  // Emit code to match the island(s) for the singleton.
  o.indent(Indentation) << "// Check ";

  for (I = Size; I != 0; --I) {
    o << "Inst{" << EndBits[I-1] << '-' << StartBits[I-1] << "} ";
    if (I > 1)
      o << "&& ";
    else
      o << "for singleton decoding...\n";
  }

  o.indent(Indentation) << "if (";

  for (I = Size; I != 0; --I) {
    NumBits = EndBits[I-1] - StartBits[I-1] + 1;
    o << "fieldFromInstruction(insn, " << StartBits[I-1] << ", " << NumBits
      << ") == " << FieldVals[I-1];
    if (I > 1)
      o << " && ";
    else
      o << ") {\n";
  }
  o.indent(Indentation) << "  MI.setOpcode(" << Opc << ");\n";
  std::vector<OperandInfo>& InsnOperands = Operands[Opc];
  for (std::vector<OperandInfo>::iterator
       I = InsnOperands.begin(), E = InsnOperands.end(); I != E; ++I) {
    // If a custom instruction decoder was specified, use that.
    if (I->FieldBase == ~0U && I->FieldLength == ~0U) {
      o.indent(Indentation) << "  " << I->Decoder << "(MI, insn);\n";
      break;
    }

    o.indent(Indentation)
      << "  tmp = fieldFromInstruction(insn, " << I->FieldBase
      << ", " << I->FieldLength << ");\n";
    if (I->Decoder != "") {
      o.indent(Indentation) << "  " << I->Decoder << "(MI, tmp);\n";
    } else {
      o.indent(Indentation)
        << "  MI.addOperand(MCOperand::CreateImm(tmp));\n";
    }
  }
  o.indent(Indentation) << "  return true; // " << nameWithID(Opc)
                        << '\n';
  o.indent(Indentation) << "}\n";

  return false;
}

// Emits code to decode the singleton, and then to decode the rest.
void FilterChooser::emitSingletonDecoder(raw_ostream &o, unsigned &Indentation,
    Filter &Best) {

  unsigned Opc = Best.getSingletonOpc();

  emitSingletonDecoder(o, Indentation, Opc);

  // Emit code for the rest.
  o.indent(Indentation) << "else\n";

  Indentation += 2;
  Best.getVariableFC().emit(o, Indentation);
  Indentation -= 2;
}

// Assign a single filter and run with it.  Top level API client can initialize
// with a single filter to start the filtering process.
void FilterChooser::runSingleFilter(FilterChooser &owner, unsigned startBit,
    unsigned numBit, bool mixed) {
  Filters.clear();
  Filter F(*this, startBit, numBit, true);
  Filters.push_back(F);
  BestIndex = 0; // Sole Filter instance to choose from.
  bestFilter().recurse();
}

// reportRegion is a helper function for filterProcessor to mark a region as
// eligible for use as a filter region.
void FilterChooser::reportRegion(bitAttr_t RA, unsigned StartBit,
    unsigned BitIndex, bool AllowMixed) {
  if (RA == ATTR_MIXED && AllowMixed)
    Filters.push_back(Filter(*this, StartBit, BitIndex - StartBit, true));
  else if (RA == ATTR_ALL_SET && !AllowMixed)
    Filters.push_back(Filter(*this, StartBit, BitIndex - StartBit, false));
}

// FilterProcessor scans the well-known encoding bits of the instructions and
// builds up a list of candidate filters.  It chooses the best filter and
// recursively descends down the decoding tree.
bool FilterChooser::filterProcessor(bool AllowMixed, bool Greedy) {
  Filters.clear();
  BestIndex = -1;
  unsigned numInstructions = Opcodes.size();

  assert(numInstructions && "Filter created with no instructions");

  // No further filtering is necessary.
  if (numInstructions == 1)
    return true;

  // Heuristics.  See also doFilter()'s "Heuristics" comment when num of
  // instructions is 3.
  if (AllowMixed && !Greedy) {
    assert(numInstructions == 3);

    for (unsigned i = 0; i < Opcodes.size(); ++i) {
      std::vector<unsigned> StartBits;
      std::vector<unsigned> EndBits;
      std::vector<uint64_t> FieldVals;
      insn_t Insn;

      insnWithID(Insn, Opcodes[i]);

      // Look for islands of undecoded bits of any instruction.
      if (getIslands(StartBits, EndBits, FieldVals, Insn) > 0) {
        // Found an instruction with island(s).  Now just assign a filter.
        runSingleFilter(*this, StartBits[0], EndBits[0] - StartBits[0] + 1,
                        true);
        return true;
      }
    }
  }

  unsigned BitIndex, InsnIndex;

  // We maintain BIT_WIDTH copies of the bitAttrs automaton.
  // The automaton consumes the corresponding bit from each
  // instruction.
  //
  //   Input symbols: 0, 1, and _ (unset).
  //   States:        NONE, FILTERED, ALL_SET, ALL_UNSET, and MIXED.
  //   Initial state: NONE.
  //
  // (NONE) ------- [01] -> (ALL_SET)
  // (NONE) ------- _ ----> (ALL_UNSET)
  // (ALL_SET) ---- [01] -> (ALL_SET)
  // (ALL_SET) ---- _ ----> (MIXED)
  // (ALL_UNSET) -- [01] -> (MIXED)
  // (ALL_UNSET) -- _ ----> (ALL_UNSET)
  // (MIXED) ------ . ----> (MIXED)
  // (FILTERED)---- . ----> (FILTERED)

  bitAttr_t bitAttrs[BIT_WIDTH];

  // FILTERED bit positions provide no entropy and are not worthy of pursuing.
  // Filter::recurse() set either BIT_TRUE or BIT_FALSE for each position.
  for (BitIndex = 0; BitIndex < BIT_WIDTH; ++BitIndex)
    if (FilterBitValues[BitIndex] == BIT_TRUE ||
        FilterBitValues[BitIndex] == BIT_FALSE)
      bitAttrs[BitIndex] = ATTR_FILTERED;
    else
      bitAttrs[BitIndex] = ATTR_NONE;

  for (InsnIndex = 0; InsnIndex < numInstructions; ++InsnIndex) {
    insn_t insn;

    insnWithID(insn, Opcodes[InsnIndex]);

    for (BitIndex = 0; BitIndex < BIT_WIDTH; ++BitIndex) {
      switch (bitAttrs[BitIndex]) {
      case ATTR_NONE:
        if (insn[BitIndex] == BIT_UNSET)
          bitAttrs[BitIndex] = ATTR_ALL_UNSET;
        else
          bitAttrs[BitIndex] = ATTR_ALL_SET;
        break;
      case ATTR_ALL_SET:
        if (insn[BitIndex] == BIT_UNSET)
          bitAttrs[BitIndex] = ATTR_MIXED;
        break;
      case ATTR_ALL_UNSET:
        if (insn[BitIndex] != BIT_UNSET)
          bitAttrs[BitIndex] = ATTR_MIXED;
        break;
      case ATTR_MIXED:
      case ATTR_FILTERED:
        break;
      }
    }
  }

  // The regionAttr automaton consumes the bitAttrs automatons' state,
  // lowest-to-highest.
  //
  //   Input symbols: F(iltered), (all_)S(et), (all_)U(nset), M(ixed)
  //   States:        NONE, ALL_SET, MIXED
  //   Initial state: NONE
  //
  // (NONE) ----- F --> (NONE)
  // (NONE) ----- S --> (ALL_SET)     ; and set region start
  // (NONE) ----- U --> (NONE)
  // (NONE) ----- M --> (MIXED)       ; and set region start
  // (ALL_SET) -- F --> (NONE)        ; and report an ALL_SET region
  // (ALL_SET) -- S --> (ALL_SET)
  // (ALL_SET) -- U --> (NONE)        ; and report an ALL_SET region
  // (ALL_SET) -- M --> (MIXED)       ; and report an ALL_SET region
  // (MIXED) ---- F --> (NONE)        ; and report a MIXED region
  // (MIXED) ---- S --> (ALL_SET)     ; and report a MIXED region
  // (MIXED) ---- U --> (NONE)        ; and report a MIXED region
  // (MIXED) ---- M --> (MIXED)

  bitAttr_t RA = ATTR_NONE;
  unsigned StartBit = 0;

  for (BitIndex = 0; BitIndex < BIT_WIDTH; BitIndex++) {
    bitAttr_t bitAttr = bitAttrs[BitIndex];

    assert(bitAttr != ATTR_NONE && "Bit without attributes");

    switch (RA) {
    case ATTR_NONE:
      switch (bitAttr) {
      case ATTR_FILTERED:
        break;
      case ATTR_ALL_SET:
        StartBit = BitIndex;
        RA = ATTR_ALL_SET;
        break;
      case ATTR_ALL_UNSET:
        break;
      case ATTR_MIXED:
        StartBit = BitIndex;
        RA = ATTR_MIXED;
        break;
      default:
        assert(0 && "Unexpected bitAttr!");
      }
      break;
    case ATTR_ALL_SET:
      switch (bitAttr) {
      case ATTR_FILTERED:
        reportRegion(RA, StartBit, BitIndex, AllowMixed);
        RA = ATTR_NONE;
        break;
      case ATTR_ALL_SET:
        break;
      case ATTR_ALL_UNSET:
        reportRegion(RA, StartBit, BitIndex, AllowMixed);
        RA = ATTR_NONE;
        break;
      case ATTR_MIXED:
        reportRegion(RA, StartBit, BitIndex, AllowMixed);
        StartBit = BitIndex;
        RA = ATTR_MIXED;
        break;
      default:
        assert(0 && "Unexpected bitAttr!");
      }
      break;
    case ATTR_MIXED:
      switch (bitAttr) {
      case ATTR_FILTERED:
        reportRegion(RA, StartBit, BitIndex, AllowMixed);
        StartBit = BitIndex;
        RA = ATTR_NONE;
        break;
      case ATTR_ALL_SET:
        reportRegion(RA, StartBit, BitIndex, AllowMixed);
        StartBit = BitIndex;
        RA = ATTR_ALL_SET;
        break;
      case ATTR_ALL_UNSET:
        reportRegion(RA, StartBit, BitIndex, AllowMixed);
        RA = ATTR_NONE;
        break;
      case ATTR_MIXED:
        break;
      default:
        assert(0 && "Unexpected bitAttr!");
      }
      break;
    case ATTR_ALL_UNSET:
      assert(0 && "regionAttr state machine has no ATTR_UNSET state");
    case ATTR_FILTERED:
      assert(0 && "regionAttr state machine has no ATTR_FILTERED state");
    }
  }

  // At the end, if we're still in ALL_SET or MIXED states, report a region
  switch (RA) {
  case ATTR_NONE:
    break;
  case ATTR_FILTERED:
    break;
  case ATTR_ALL_SET:
    reportRegion(RA, StartBit, BitIndex, AllowMixed);
    break;
  case ATTR_ALL_UNSET:
    break;
  case ATTR_MIXED:
    reportRegion(RA, StartBit, BitIndex, AllowMixed);
    break;
  }

  // We have finished with the filter processings.  Now it's time to choose
  // the best performing filter.
  BestIndex = 0;
  bool AllUseless = true;
  unsigned BestScore = 0;

  for (unsigned i = 0, e = Filters.size(); i != e; ++i) {
    unsigned Usefulness = Filters[i].usefulness();

    if (Usefulness)
      AllUseless = false;

    if (Usefulness > BestScore) {
      BestIndex = i;
      BestScore = Usefulness;
    }
  }

  if (!AllUseless)
    bestFilter().recurse();

  return !AllUseless;
} // end of FilterChooser::filterProcessor(bool)

// Decides on the best configuration of filter(s) to use in order to decode
// the instructions.  A conflict of instructions may occur, in which case we
// dump the conflict set to the standard error.
void FilterChooser::doFilter() {
  unsigned Num = Opcodes.size();
  assert(Num && "FilterChooser created with no instructions");

  // Try regions of consecutive known bit values first.
  if (filterProcessor(false))
    return;

  // Then regions of mixed bits (both known and unitialized bit values allowed).
  if (filterProcessor(true))
    return;

  // Heuristics to cope with conflict set {t2CMPrs, t2SUBSrr, t2SUBSrs} where
  // no single instruction for the maximum ATTR_MIXED region Inst{14-4} has a
  // well-known encoding pattern.  In such case, we backtrack and scan for the
  // the very first consecutive ATTR_ALL_SET region and assign a filter to it.
  if (Num == 3 && filterProcessor(true, false))
    return;

  // If we come to here, the instruction decoding has failed.
  // Set the BestIndex to -1 to indicate so.
  BestIndex = -1;
}

// Emits code to decode our share of instructions.  Returns true if the
// emitted code causes a return, which occurs if we know how to decode
// the instruction at this level or the instruction is not decodeable.
bool FilterChooser::emit(raw_ostream &o, unsigned &Indentation) {
  if (Opcodes.size() == 1)
    // There is only one instruction in the set, which is great!
    // Call emitSingletonDecoder() to see whether there are any remaining
    // encodings bits.
    return emitSingletonDecoder(o, Indentation, Opcodes[0]);

  // Choose the best filter to do the decodings!
  if (BestIndex != -1) {
    Filter &Best = bestFilter();
    if (Best.getNumFiltered() == 1)
      emitSingletonDecoder(o, Indentation, Best);
    else
      bestFilter().emit(o, Indentation);
    return false;
  }

  // We don't know how to decode these instructions!  Return 0 and dump the
  // conflict set!
  o.indent(Indentation) << "return 0;" << " // Conflict set: ";
  for (int i = 0, N = Opcodes.size(); i < N; ++i) {
    o << nameWithID(Opcodes[i]);
    if (i < (N - 1))
      o << ", ";
    else
      o << '\n';
  }

  // Print out useful conflict information for postmortem analysis.
  errs() << "Decoding Conflict:\n";

  dumpStack(errs(), "\t\t");

  for (unsigned i = 0; i < Opcodes.size(); i++) {
    const std::string &Name = nameWithID(Opcodes[i]);

    errs() << '\t' << Name << " ";
    dumpBits(errs(),
             getBitsField(*AllInstructions[Opcodes[i]]->TheDef, "Inst"));
    errs() << '\n';
  }

  return true;
}

bool FixedLenDecoderEmitter::populateInstruction(const CodeGenInstruction &CGI,
                                                 unsigned Opc){
  const Record &Def = *CGI.TheDef;
  // If all the bit positions are not specified; do not decode this instruction.
  // We are bound to fail!  For proper disassembly, the well-known encoding bits
  // of the instruction must be fully specified.
  //
  // This also removes pseudo instructions from considerations of disassembly,
  // which is a better design and less fragile than the name matchings.
  BitsInit &Bits = getBitsField(Def, "Inst");
  if (Bits.allInComplete()) return false;

  // Ignore "asm parser only" instructions.
  if (Def.getValueAsBit("isAsmParserOnly"))
    return false;

  std::vector<OperandInfo> InsnOperands;

  // If the instruction has specified a custom decoding hook, use that instead
  // of trying to auto-generate the decoder.
  std::string InstDecoder = Def.getValueAsString("DecoderMethod");
  if (InstDecoder != "") {
    InsnOperands.push_back(OperandInfo(~0U, ~0U, InstDecoder));
    Operands[Opc] = InsnOperands;
    return true;
  }

  // Generate a description of the operand of the instruction that we know
  // how to decode automatically.
  // FIXME: We'll need to have a way to manually override this as needed.

  // Gather the outputs/inputs of the instruction, so we can find their
  // positions in the encoding.  This assumes for now that they appear in the
  // MCInst in the order that they're listed.
  std::vector<std::pair<Init*, std::string> > InOutOperands;
  DagInit *Out  = Def.getValueAsDag("OutOperandList");
  DagInit *In  = Def.getValueAsDag("InOperandList");
  for (unsigned i = 0; i < Out->getNumArgs(); ++i)
    InOutOperands.push_back(std::make_pair(Out->getArg(i), Out->getArgName(i)));
  for (unsigned i = 0; i < In->getNumArgs(); ++i)
    InOutOperands.push_back(std::make_pair(In->getArg(i), In->getArgName(i)));

  // For each operand, see if we can figure out where it is encoded.
  for (std::vector<std::pair<Init*, std::string> >::iterator
       NI = InOutOperands.begin(), NE = InOutOperands.end(); NI != NE; ++NI) {
    unsigned PrevBit = ~0;
    unsigned Base = ~0;
    unsigned PrevPos = ~0;
    std::string Decoder = "";

    for (unsigned bi = 0; bi < Bits.getNumBits(); ++bi) {
      VarBitInit *BI = dynamic_cast<VarBitInit*>(Bits.getBit(bi));
      if (!BI) continue;

      VarInit *Var = dynamic_cast<VarInit*>(BI->getVariable());
      assert(Var);
      unsigned CurrBit = BI->getBitNum();
      if (Var->getName() != NI->second) continue;

      // Figure out the lowest bit of the value, and the width of the field.
      // Deliberately don't try to handle cases where the field is scattered,
      // or where not all bits of the the field are explicit.
      if (Base == ~0U && PrevBit == ~0U && PrevPos == ~0U) {
        if (CurrBit == 0)
          Base = bi;
        else
          continue;
      }

      if ((PrevPos != ~0U && bi-1 != PrevPos) ||
          (CurrBit != ~0U && CurrBit-1 != PrevBit)) {
        PrevBit = ~0;
        Base = ~0;
        PrevPos = ~0;
      }

      PrevPos = bi;
      PrevBit = CurrBit;

      // At this point, we can locate the field, but we need to know how to
      // interpret it.  As a first step, require the target to provide callbacks
      // for decoding register classes.
      // FIXME: This need to be extended to handle instructions with custom
      // decoder methods, and operands with (simple) MIOperandInfo's.
      TypedInit *TI = dynamic_cast<TypedInit*>(NI->first);
      RecordRecTy *Type = dynamic_cast<RecordRecTy*>(TI->getType());
      Record *TypeRecord = Type->getRecord();
      bool isReg = false;
      if (TypeRecord->isSubClassOf("RegisterClass")) {
        Decoder = "Decode" + Type->getRecord()->getName() + "RegisterClass";
        isReg = true;
      }

      RecordVal *DecoderString = TypeRecord->getValue("DecoderMethod");
      StringInit *String = DecoderString ?
        dynamic_cast<StringInit*>(DecoderString->getValue()) :
        0;
      if (!isReg && String && String->getValue() != "")
        Decoder = String->getValue();
    }

    if (Base != ~0U) {
      InsnOperands.push_back(OperandInfo(Base, PrevBit+1, Decoder));
      DEBUG(errs() << "ENCODED OPERAND: $" << NI->second << " @ ("
                   << utostr(Base+PrevBit) << ", " << utostr(Base) << ")\n");
    }
  }

  Operands[Opc] = InsnOperands;


#if 0
  DEBUG({
      // Dumps the instruction encoding bits.
      dumpBits(errs(), Bits);

      errs() << '\n';

      // Dumps the list of operand info.
      for (unsigned i = 0, e = CGI.Operands.size(); i != e; ++i) {
        const CGIOperandList::OperandInfo &Info = CGI.Operands[i];
        const std::string &OperandName = Info.Name;
        const Record &OperandDef = *Info.Rec;

        errs() << "\t" << OperandName << " (" << OperandDef.getName() << ")\n";
      }
    });
#endif

  return true;
}

void FixedLenDecoderEmitter::populateInstructions() {
  for (unsigned i = 0, e = NumberedInstructions.size(); i < e; ++i) {
    Record *R = NumberedInstructions[i]->TheDef;
    if (R->getValueAsString("Namespace") == "TargetOpcode")
      continue;

    if (populateInstruction(*NumberedInstructions[i], i))
      Opcodes.push_back(i);
  }
}

// Emits disassembler code for instruction decoding.
void FixedLenDecoderEmitter::run(raw_ostream &o)
{
  o << "#include \"llvm/MC/MCInst.h\"\n";
  o << "#include \"llvm/Support/DataTypes.h\"\n";
  o << "#include <assert.h>\n";
  o << '\n';
  o << "namespace llvm {\n\n";

  NumberedInstructions = Target.getInstructionsByEnumValue();
  populateInstructions();
  FilterChooser FC(NumberedInstructions, Opcodes, Operands);
  FC.emitTop(o, 0);

  o << "\n} // End llvm namespace \n";
}
