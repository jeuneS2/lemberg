//===--- LembergCallingConv.td - Calling Conventions -------*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This describes the calling conventions for the Lemberg architectures.
//
//===----------------------------------------------------------------------===//

// Lemberg C Calling convention.
def CC_Lemberg : CallingConv<[

  // Handle ByVal arguments
  CCIfByVal<CCCustom<"CC_Lemberg_Custom_ByVal">>,

  // Promote i1/i8/i16 arguments to i32
  CCIfType<[i1, i8, i16], CCPromoteToType<i32>>,
  // Convert f32 to i32
  CCIfType<[f32], CCBitConvertToType<i32>>,
  // Pass args in R0 to R3
  CCIfType<[i32], CCAssignToReg<[R0, R1, R2, R3]>>,

  // Split f64
  CCIfType<[f64], CCCustom<"CC_Lemberg_Custom_f64">>,

  // Pass on stack otherwise
  CCAssignToStack<4, 4>
]>;

//===----------------------------------------------------------------------===//
// Return Value Calling Conventions
//===----------------------------------------------------------------------===//

// Lemberg C return-value convention.
def RetCC_Lemberg : CallingConv<[

  // Return double floats in D0
  CCIfType<[f64], CCAssignToReg<[D0]>>,
  // Return single floats in F0 and F1
  CCIfType<[f32], CCAssignToReg<[F0, F1]>>,

  // Promote i1/i8/i16 arguments to i32
  CCIfType<[i1, i8, i16], CCPromoteToType<i32>>,
  // Return in R0 and R1
  CCIfType<[i32], CCAssignToReg<[R0, R1]>>
]>;
