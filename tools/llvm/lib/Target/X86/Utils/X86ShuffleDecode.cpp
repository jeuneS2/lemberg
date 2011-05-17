//===-- X86ShuffleDecode.cpp - X86 shuffle decode logic -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Define several functions to decode x86 specific shuffle semantics into a
// generic vector mask.
//
//===----------------------------------------------------------------------===//

#include "X86ShuffleDecode.h"

//===----------------------------------------------------------------------===//
//  Vector Mask Decoding
//===----------------------------------------------------------------------===//

namespace llvm {

void DecodeINSERTPSMask(unsigned Imm, SmallVectorImpl<unsigned> &ShuffleMask) {
  // Defaults the copying the dest value.
  ShuffleMask.push_back(0);
  ShuffleMask.push_back(1);
  ShuffleMask.push_back(2);
  ShuffleMask.push_back(3);

  // Decode the immediate.
  unsigned ZMask = Imm & 15;
  unsigned CountD = (Imm >> 4) & 3;
  unsigned CountS = (Imm >> 6) & 3;

  // CountS selects which input element to use.
  unsigned InVal = 4+CountS;
  // CountD specifies which element of destination to update.
  ShuffleMask[CountD] = InVal;
  // ZMask zaps values, potentially overriding the CountD elt.
  if (ZMask & 1) ShuffleMask[0] = SM_SentinelZero;
  if (ZMask & 2) ShuffleMask[1] = SM_SentinelZero;
  if (ZMask & 4) ShuffleMask[2] = SM_SentinelZero;
  if (ZMask & 8) ShuffleMask[3] = SM_SentinelZero;
}

// <3,1> or <6,7,2,3>
void DecodeMOVHLPSMask(unsigned NElts,
                       SmallVectorImpl<unsigned> &ShuffleMask) {
  for (unsigned i = NElts/2; i != NElts; ++i)
    ShuffleMask.push_back(NElts+i);

  for (unsigned i = NElts/2; i != NElts; ++i)
    ShuffleMask.push_back(i);
}

// <0,2> or <0,1,4,5>
void DecodeMOVLHPSMask(unsigned NElts,
                       SmallVectorImpl<unsigned> &ShuffleMask) {
  for (unsigned i = 0; i != NElts/2; ++i)
    ShuffleMask.push_back(i);

  for (unsigned i = 0; i != NElts/2; ++i)
    ShuffleMask.push_back(NElts+i);
}

void DecodePSHUFMask(unsigned NElts, unsigned Imm,
                     SmallVectorImpl<unsigned> &ShuffleMask) {
  for (unsigned i = 0; i != NElts; ++i) {
    ShuffleMask.push_back(Imm % NElts);
    Imm /= NElts;
  }
}

void DecodePSHUFHWMask(unsigned Imm,
                       SmallVectorImpl<unsigned> &ShuffleMask) {
  ShuffleMask.push_back(0);
  ShuffleMask.push_back(1);
  ShuffleMask.push_back(2);
  ShuffleMask.push_back(3);
  for (unsigned i = 0; i != 4; ++i) {
    ShuffleMask.push_back(4+(Imm & 3));
    Imm >>= 2;
  }
}

void DecodePSHUFLWMask(unsigned Imm,
                       SmallVectorImpl<unsigned> &ShuffleMask) {
  for (unsigned i = 0; i != 4; ++i) {
    ShuffleMask.push_back((Imm & 3));
    Imm >>= 2;
  }
  ShuffleMask.push_back(4);
  ShuffleMask.push_back(5);
  ShuffleMask.push_back(6);
  ShuffleMask.push_back(7);
}

void DecodePUNPCKLBWMask(unsigned NElts,
                         SmallVectorImpl<unsigned> &ShuffleMask) {
  DecodeUNPCKLPMask(MVT::getVectorVT(MVT::i8, NElts), ShuffleMask);
}

void DecodePUNPCKLWDMask(unsigned NElts,
                         SmallVectorImpl<unsigned> &ShuffleMask) {
  DecodeUNPCKLPMask(MVT::getVectorVT(MVT::i16, NElts), ShuffleMask);
}

void DecodePUNPCKLDQMask(unsigned NElts,
                         SmallVectorImpl<unsigned> &ShuffleMask) {
  DecodeUNPCKLPMask(MVT::getVectorVT(MVT::i32, NElts), ShuffleMask);
}

void DecodePUNPCKLQDQMask(unsigned NElts,
                          SmallVectorImpl<unsigned> &ShuffleMask) {
  DecodeUNPCKLPMask(MVT::getVectorVT(MVT::i64, NElts), ShuffleMask);
}

void DecodePUNPCKLMask(EVT VT,
                       SmallVectorImpl<unsigned> &ShuffleMask) {
  DecodeUNPCKLPMask(VT, ShuffleMask);
}

void DecodePUNPCKHMask(unsigned NElts,
                       SmallVectorImpl<unsigned> &ShuffleMask) {
  for (unsigned i = 0; i != NElts/2; ++i) {
    ShuffleMask.push_back(i+NElts/2);
    ShuffleMask.push_back(i+NElts+NElts/2);
  }
}

void DecodeSHUFPSMask(unsigned NElts, unsigned Imm,
                      SmallVectorImpl<unsigned> &ShuffleMask) {
  // Part that reads from dest.
  for (unsigned i = 0; i != NElts/2; ++i) {
    ShuffleMask.push_back(Imm % NElts);
    Imm /= NElts;
  }
  // Part that reads from src.
  for (unsigned i = 0; i != NElts/2; ++i) {
    ShuffleMask.push_back(Imm % NElts + NElts);
    Imm /= NElts;
  }
}

void DecodeUNPCKHPMask(unsigned NElts,
                       SmallVectorImpl<unsigned> &ShuffleMask) {
  for (unsigned i = 0; i != NElts/2; ++i) {
    ShuffleMask.push_back(i+NElts/2);        // Reads from dest
    ShuffleMask.push_back(i+NElts+NElts/2);  // Reads from src
  }
}

void DecodeUNPCKLPSMask(unsigned NElts,
                        SmallVectorImpl<unsigned> &ShuffleMask) {
  DecodeUNPCKLPMask(MVT::getVectorVT(MVT::i32, NElts), ShuffleMask);
}

void DecodeUNPCKLPDMask(unsigned NElts,
                        SmallVectorImpl<unsigned> &ShuffleMask) {
  DecodeUNPCKLPMask(MVT::getVectorVT(MVT::i64, NElts), ShuffleMask);
}

/// DecodeUNPCKLPMask - This decodes the shuffle masks for unpcklps/unpcklpd
/// etc.  VT indicates the type of the vector allowing it to handle different
/// datatypes and vector widths.
void DecodeUNPCKLPMask(EVT VT,
                       SmallVectorImpl<unsigned> &ShuffleMask) {
  unsigned NumElts = VT.getVectorNumElements();

  // Handle vector lengths > 128 bits.  Define a "section" as a set of
  // 128 bits.  AVX defines UNPCK* to operate independently on 128-bit
  // sections.
  unsigned NumSections = VT.getSizeInBits() / 128;
  if (NumSections == 0 ) NumSections = 1;  // Handle MMX
  unsigned NumSectionElts = NumElts / NumSections;

  unsigned Start = 0;
  unsigned End = NumSectionElts / 2;
  for (unsigned s = 0; s < NumSections; ++s) {
    for (unsigned i = Start; i != End; ++i) {
      ShuffleMask.push_back(i);                 // Reads from dest/src1
      ShuffleMask.push_back(i+NumSectionElts);  // Reads from src/src2
    }
    // Process the next 128 bits.
    Start += NumSectionElts;
    End += NumSectionElts;
  }
}

} // llvm namespace
