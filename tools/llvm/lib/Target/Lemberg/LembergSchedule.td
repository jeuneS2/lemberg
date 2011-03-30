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
def IIFpuZero          : InstrItinClass;
def IIFpuOne           : InstrItinClass;
def IIFpuThree         : InstrItinClass;
def IIFpuFull          : InstrItinClass;

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
def IIFpuZero0         : InstrItinClass;
def IIFpuZero1         : InstrItinClass;
def IIFpuZero2         : InstrItinClass;
def IIFpuZero3         : InstrItinClass;
def IIFpuOne0          : InstrItinClass;
def IIFpuOne1          : InstrItinClass;
def IIFpuOne2          : InstrItinClass;
def IIFpuOne3          : InstrItinClass;
def IIFpuThree0        : InstrItinClass;
def IIFpuThree1        : InstrItinClass;
def IIFpuThree2        : InstrItinClass;
def IIFpuThree3        : InstrItinClass;
def IIFpuFull0         : InstrItinClass;
def IIFpuFull1         : InstrItinClass;
def IIFpuFull2         : InstrItinClass;
def IIFpuFull3         : InstrItinClass;

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

	 InstrItinData<IIFpuZero,  [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							    InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpuOne,   [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							    InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpuThree, [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
							    InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
							    InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
								InstrStage<1, [FPU_WB]>]>,
	 InstrItinData<IIFpuFull,  [InstrStage<1, [SLOT0, SLOT1, SLOT2, SLOT3], 0>,
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

     InstrItinData<IIFpuZero0,  [InstrStage<1, [SLOT0], 0>,
								 InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuZero1,  [InstrStage<1, [SLOT1], 0>,
								 InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuZero2,  [InstrStage<1, [SLOT2], 0>,
								 InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuZero3,  [InstrStage<1, [SLOT3], 0>,
								 InstrStage<1, [FPU_DEC], 0>, InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpuOne0,   [InstrStage<1, [SLOT0], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuOne1,   [InstrStage<1, [SLOT1], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuOne2,   [InstrStage<1, [SLOT2], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuOne3,   [InstrStage<1, [SLOT3], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], 0>,
								 InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpuThree0, [InstrStage<1, [SLOT0], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
								 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuThree1, [InstrStage<1, [SLOT1], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
								 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuThree2, [InstrStage<1, [SLOT2], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
								 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuThree3, [InstrStage<1, [SLOT3], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
								 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], 0>,
								 InstrStage<1, [FPU_WB]>]>,

     InstrItinData<IIFpuFull0,  [InstrStage<1, [SLOT0], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
								 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
								 InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
								 InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuFull1,  [InstrStage<1, [SLOT1], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
								 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
								 InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
								 InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuFull2,  [InstrStage<1, [SLOT2], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
								 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
								 InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
								 InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
								 InstrStage<1, [FPU_WB]>]>,
     InstrItinData<IIFpuFull3,  [InstrStage<1, [SLOT3], 0>,
								 InstrStage<1, [FPU_DEC], -1>, InstrStage<1, [FPU_EX1], -1>,
								 InstrStage<1, [FPU_EX2], -1>, InstrStage<1, [FPU_EX3], -1>,
								 InstrStage<1, [FPU_EX4], -1>, InstrStage<1, [FPU_EX5], -1>,
								 InstrStage<1, [FPU_EX6], -1>, InstrStage<1, [FPU_EX7], 0>,
								 InstrStage<1, [FPU_WB]>]>
]>;
