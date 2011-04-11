//===- LembergSchedule.td - Lemberg Scheduling Definitions ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Functional units across Lemberg chips sets
//===----------------------------------------------------------------------===//
def SLOT0   : FuncUnit;
def SLOT1   : FuncUnit;
def SLOT2   : FuncUnit;
def SLOT3   : FuncUnit;

def ALU0    : FuncUnit;
def ALU1    : FuncUnit;
def ALU2    : FuncUnit;
def ALU3    : FuncUnit;
def MEMU    : FuncUnit;
def JMPU    : FuncUnit;

def FPU_DEC : FuncUnit;
def FPU_EX1 : FuncUnit;
def FPU_EX2 : FuncUnit;
def FPU_EX3 : FuncUnit;
def FPU_EX4 : FuncUnit;
def FPU_EX5 : FuncUnit;
def FPU_EX6 : FuncUnit;
def FPU_EX7 : FuncUnit;
def FPU_WB  : FuncUnit;

//===----------------------------------------------------------------------===//
// Instruction Itinerary classes used for Lemberg 
//===----------------------------------------------------------------------===//

// General itineraries
def IIAlu              : InstrItinClass;
def IIMem              : InstrItinClass;
def IIBranch           : InstrItinClass;
def IIFpu0             : InstrItinClass;
def IIFpu1             : InstrItinClass;
def IIFpu2             : InstrItinClass;
def IIFpu3             : InstrItinClass;
def IIFpu4             : InstrItinClass;
def IIFpu6             : InstrItinClass;
def IIFpu7             : InstrItinClass;

// Pseudo itinerary
def IINone             : InstrItinClass;

// Slot- and cluster-specific itineraries
def IIAlu0             : InstrItinClass;
def IIAlu1             : InstrItinClass;
def IIAlu2             : InstrItinClass;
def IIAlu3             : InstrItinClass;
def IIMem0             : InstrItinClass;
def IIMem1             : InstrItinClass;
def IIMem2             : InstrItinClass;
def IIMem3             : InstrItinClass;
def IIBranch0          : InstrItinClass;
def IIBranch1          : InstrItinClass;
def IIBranch2          : InstrItinClass;
def IIBranch3          : InstrItinClass;
def IIFpu0_0           : InstrItinClass;
def IIFpu0_1           : InstrItinClass;
def IIFpu0_2           : InstrItinClass;
def IIFpu0_3           : InstrItinClass;
def IIFpu1_0           : InstrItinClass;
def IIFpu1_1           : InstrItinClass;
def IIFpu1_2           : InstrItinClass;
def IIFpu1_3           : InstrItinClass;
def IIFpu2_0           : InstrItinClass;
def IIFpu2_1           : InstrItinClass;
def IIFpu2_2           : InstrItinClass;
def IIFpu2_3           : InstrItinClass;
def IIFpu3_0           : InstrItinClass;
def IIFpu3_1           : InstrItinClass;
def IIFpu3_2           : InstrItinClass;
def IIFpu3_3           : InstrItinClass;
def IIFpu4_0           : InstrItinClass;
def IIFpu4_1           : InstrItinClass;
def IIFpu4_2           : InstrItinClass;
def IIFpu4_3           : InstrItinClass;
def IIFpu6_0           : InstrItinClass;
def IIFpu6_1           : InstrItinClass;
def IIFpu6_2           : InstrItinClass;
def IIFpu6_3           : InstrItinClass;
def IIFpu7_0           : InstrItinClass;
def IIFpu7_1           : InstrItinClass;
def IIFpu7_2           : InstrItinClass;
def IIFpu7_3           : InstrItinClass;

//===----------------------------------------------------------------------===//
// Lemberg Generic instruction itineraries
//===----------------------------------------------------------------------===//
def LembergItineraries : ProcessorItineraries<
	[SLOT0, SLOT1, SLOT2, SLOT3,
	 ALU0, ALU1, ALU2, ALU3, MEMU, JMPU,
	 FPU_DEC, FPU_EX1, FPU_EX2, FPU_EX3, FPU_EX4, FPU_EX5, FPU_EX6, FPU_EX7, FPU_WB],
	[// Generic itineraries
	 InstrItinData<IIAlu,    [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							  InstrStage<1, [ALU0, ALU1, ALU2, ALU3]>]>,
	 InstrItinData<IIMem,    [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							  InstrStage<1, [MEMU]>]>,
	 InstrItinData<IIBranch, [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							  InstrStage<1, [JMPU]>]>,

	 InstrItinData<IIFpu0,  [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							 InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpu1,   [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
							  InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpu2,   [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], 0>, InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpu3, [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
							InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpu4, [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							InstrStage<1, [FPU_EX4], 0>, InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpu6, [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							InstrStage<1, [FPU_EX6], 0>, InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpu7,  [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							 InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							 InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
							 InstrStage<1, [FPU_WB]>]>,

	 // Pseudo itinerary
	 InstrItinData<IINone, [InstrStage<0, [SLOT0, SLOT1, SLOT2, SLOT3]>]>,

	 // Slot- and cluster-specific itineraries
	 InstrItinData<IIAlu0,    [InstrStage<1, [SLOT0], 0>, InstrStage<1, [ALU0]>]>,
	 InstrItinData<IIAlu1,    [InstrStage<1, [SLOT1], 0>, InstrStage<1, [ALU1]>]>,
	 InstrItinData<IIAlu2,    [InstrStage<1, [SLOT2], 0>, InstrStage<1, [ALU2]>]>,
	 InstrItinData<IIAlu3,    [InstrStage<1, [SLOT3], 0>, InstrStage<1, [ALU3]>]>,

	 InstrItinData<IIMem0,    [InstrStage<1, [SLOT0], 0>, InstrStage<1, [MEMU]>]>,
	 InstrItinData<IIMem1,    [InstrStage<1, [SLOT1], 0>, InstrStage<1, [MEMU]>]>,
	 InstrItinData<IIMem2,    [InstrStage<1, [SLOT2], 0>, InstrStage<1, [MEMU]>]>,
	 InstrItinData<IIMem3,    [InstrStage<1, [SLOT3], 0>, InstrStage<1, [MEMU]>]>,

	 InstrItinData<IIBranch0, [InstrStage<1, [SLOT0], 0>, InstrStage<1, [JMPU]>]>,
	 InstrItinData<IIBranch1, [InstrStage<1, [SLOT1], 0>, InstrStage<1, [JMPU]>]>,
	 InstrItinData<IIBranch2, [InstrStage<1, [SLOT2], 0>, InstrStage<1, [JMPU]>]>,
	 InstrItinData<IIBranch3, [InstrStage<1, [SLOT3], 0>, InstrStage<1, [JMPU]>]>,

     InstrItinData<IIFpu0_0,  [InstrStage<1, [SLOT0], 0>,
							   InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu0_1,  [InstrStage<1, [SLOT1], 0>,
							   InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu0_2,  [InstrStage<1, [SLOT2], 0>,
							   InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu0_3,  [InstrStage<1, [SLOT3], 0>,
							   InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpu1_0,   [InstrStage<1, [SLOT0], 0>,
								InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu1_1,   [InstrStage<1, [SLOT1], 0>,
								InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu1_2,   [InstrStage<1, [SLOT2], 0>,
								InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu1_3,   [InstrStage<1, [SLOT3], 0>,
								InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpu2_0, [InstrStage<1, [SLOT0], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu2_1, [InstrStage<1, [SLOT1], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu2_2, [InstrStage<1, [SLOT2], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu2_3, [InstrStage<1, [SLOT3], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], 0>, InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpu3_0, [InstrStage<1, [SLOT0], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
							  InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu3_1, [InstrStage<1, [SLOT1], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
							  InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu3_2, [InstrStage<1, [SLOT2], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
							  InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu3_3, [InstrStage<1, [SLOT3], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
							  InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpu4_0, [InstrStage<1, [SLOT0], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							  InstrStage<1, [FPU_EX4], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu4_1, [InstrStage<1, [SLOT1], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							  InstrStage<1, [FPU_EX4], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu4_2, [InstrStage<1, [SLOT2], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							  InstrStage<1, [FPU_EX4], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu4_3, [InstrStage<1, [SLOT3], 0>,
							  InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							  InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							  InstrStage<1, [FPU_EX4], 0>, InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpu6_0,  [InstrStage<1, [SLOT0], 0>,
							   InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							   InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							   InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							   InstrStage<1, [FPU_EX6], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu6_1,  [InstrStage<1, [SLOT1], 0>,
							   InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							   InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							   InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							   InstrStage<1, [FPU_EX6], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu6_2,  [InstrStage<1, [SLOT2], 0>,
							   InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							   InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							   InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							   InstrStage<1, [FPU_EX6], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu6_3,  [InstrStage<1, [SLOT3], 0>,
							   InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							   InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							   InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							   InstrStage<1, [FPU_EX6], 0>, InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpu7_0,  [InstrStage<1, [SLOT0], 0>,
							   InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							   InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							   InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							   InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
							   InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu7_1,  [InstrStage<1, [SLOT1], 0>,
							   InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							   InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							   InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							   InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
							   InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu7_2,  [InstrStage<1, [SLOT2], 0>,
							   InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							   InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							   InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							   InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
							   InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpu7_3,  [InstrStage<1, [SLOT3], 0>,
							   InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							   InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
							   InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
							   InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
							   InstrStage<1, [FPU_WB]>]>
]>;
