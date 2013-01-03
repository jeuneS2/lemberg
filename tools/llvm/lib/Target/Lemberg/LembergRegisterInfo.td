//===- LembergRegisterInfo.td - Lemberg Register defs -----------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the Lemberg register file
//===----------------------------------------------------------------------===//

// We have banks of 32 registers each.
class LembergReg<string n> : Register<n> {
  field bits<5> Num;
  let Namespace = "Lemberg";
}

// Lemberg global registers
class LembergGlobalReg<bits<5> num, string n> : LembergReg<n> {
  let Num = num;
}

// Lemberg local registers
class LembergLocalReg<bits<5> num, int cluster, string n> : LembergReg<n> {
  let Num = num;
  int Cluster = cluster;
  let CostPerUse = 1;
}

// Lemberg registers for doubles
let Namespace = "Lemberg" in {
  def sub_even : SubRegIndex;
  def sub_odd  : SubRegIndex;
}
class LembergDoubleReg<bits<5> num, string n,
					   list<Register> subregs> : LembergReg<n> {
  let Num = num;
  let SubRegs = subregs;
  let SubRegIndices = [sub_even, sub_odd];
  let CoveredBySubRegs = 1;
}

//===----------------------------------------------------------------------===//
//  Registers
//===----------------------------------------------------------------------===//

let Namespace = "Lemberg" in {

  // Global general purpose Registers
  def R0   : LembergGlobalReg< 0,  "r0">,  DwarfRegNum<[0]>;
  def R1   : LembergGlobalReg< 1,  "r1">,  DwarfRegNum<[1]>;
  def R2   : LembergGlobalReg< 2,  "r2">,  DwarfRegNum<[2]>;
  def R3   : LembergGlobalReg< 3,  "r3">,  DwarfRegNum<[3]>;
  def R4   : LembergGlobalReg< 4,  "r4">,  DwarfRegNum<[4]>;
  def R5   : LembergGlobalReg< 5,  "r5">,  DwarfRegNum<[5]>;
  def R6   : LembergGlobalReg< 6,  "r6">,  DwarfRegNum<[6]>;
  def R7   : LembergGlobalReg< 7,  "r7">,  DwarfRegNum<[7]>;
  def R8   : LembergGlobalReg< 8,  "r8">,  DwarfRegNum<[8]>;
  def R9   : LembergGlobalReg< 9,  "r9">,  DwarfRegNum<[9]>;
  def R10  : LembergGlobalReg< 10, "r10">, DwarfRegNum<[10]>;
  def R11  : LembergGlobalReg< 11, "r11">, DwarfRegNum<[11]>;
  def R12  : LembergGlobalReg< 12, "r12">, DwarfRegNum<[12]>;
  def R13  : LembergGlobalReg< 13, "r13">, DwarfRegNum<[13]>;
  def R14  : LembergGlobalReg< 14, "r14">, DwarfRegNum<[14]>;
  def R15  : LembergGlobalReg< 15, "r15">, DwarfRegNum<[15]>;

  // Local general purpose Registers
  def R0_16 : LembergLocalReg< 16, 0, "r0.16">,  DwarfRegNum<[16]>;
  def R0_17 : LembergLocalReg< 17, 0, "r0.17">,  DwarfRegNum<[17]>;
  def R0_18 : LembergLocalReg< 18, 0, "r0.18">,  DwarfRegNum<[18]>;
  def R0_19 : LembergLocalReg< 19, 0, "r0.19">,  DwarfRegNum<[19]>;
  def R0_20 : LembergLocalReg< 20, 0, "r0.20">,  DwarfRegNum<[20]>;
  def R0_21 : LembergLocalReg< 21, 0, "r0.21">,  DwarfRegNum<[21]>;
  def R0_22 : LembergLocalReg< 22, 0, "r0.22">,  DwarfRegNum<[22]>;
  def R0_23 : LembergLocalReg< 23, 0, "r0.23">,  DwarfRegNum<[23]>;
  def R0_24 : LembergLocalReg< 24, 0, "r0.24">,  DwarfRegNum<[24]>;
  def R0_25 : LembergLocalReg< 25, 0, "r0.25">,  DwarfRegNum<[25]>;
  def R0_26 : LembergLocalReg< 26, 0, "r0.26">,  DwarfRegNum<[26]>;
  def R0_27 : LembergLocalReg< 27, 0, "r0.27">,  DwarfRegNum<[27]>;
  def R0_28 : LembergLocalReg< 28, 0, "r0.28">,  DwarfRegNum<[28]>;
  def R0_29 : LembergLocalReg< 29, 0, "r0.29">,  DwarfRegNum<[29]>;
  def R0_30 : LembergLocalReg< 30, 0, "r0.30">,  DwarfRegNum<[30]>;

  def R1_16 : LembergLocalReg< 16, 1, "r1.16">,  DwarfRegNum<[32]>;
  def R1_17 : LembergLocalReg< 17, 1, "r1.17">,  DwarfRegNum<[33]>;
  def R1_18 : LembergLocalReg< 18, 1, "r1.18">,  DwarfRegNum<[34]>;
  def R1_19 : LembergLocalReg< 19, 1, "r1.19">,  DwarfRegNum<[35]>;
  def R1_20 : LembergLocalReg< 20, 1, "r1.20">,  DwarfRegNum<[36]>;
  def R1_21 : LembergLocalReg< 21, 1, "r1.21">,  DwarfRegNum<[37]>;
  def R1_22 : LembergLocalReg< 22, 1, "r1.22">,  DwarfRegNum<[38]>;
  def R1_23 : LembergLocalReg< 23, 1, "r1.23">,  DwarfRegNum<[39]>;
  def R1_24 : LembergLocalReg< 24, 1, "r1.24">,  DwarfRegNum<[40]>;
  def R1_25 : LembergLocalReg< 25, 1, "r1.25">,  DwarfRegNum<[41]>;
  def R1_26 : LembergLocalReg< 26, 1, "r1.26">,  DwarfRegNum<[42]>;
  def R1_27 : LembergLocalReg< 27, 1, "r1.27">,  DwarfRegNum<[43]>;
  def R1_28 : LembergLocalReg< 28, 1, "r1.28">,  DwarfRegNum<[44]>;
  def R1_29 : LembergLocalReg< 29, 1, "r1.29">,  DwarfRegNum<[45]>;
  def R1_30 : LembergLocalReg< 30, 1, "r1.30">,  DwarfRegNum<[46]>;

  def R2_16 : LembergLocalReg< 16, 2, "r2.16">,  DwarfRegNum<[48]>;
  def R2_17 : LembergLocalReg< 17, 2, "r2.17">,  DwarfRegNum<[49]>;
  def R2_18 : LembergLocalReg< 18, 2, "r2.18">,  DwarfRegNum<[50]>;
  def R2_19 : LembergLocalReg< 19, 2, "r2.19">,  DwarfRegNum<[51]>;
  def R2_20 : LembergLocalReg< 20, 2, "r2.20">,  DwarfRegNum<[52]>;
  def R2_21 : LembergLocalReg< 21, 2, "r2.21">,  DwarfRegNum<[53]>;
  def R2_22 : LembergLocalReg< 22, 2, "r2.22">,  DwarfRegNum<[54]>;
  def R2_23 : LembergLocalReg< 23, 2, "r2.23">,  DwarfRegNum<[55]>;
  def R2_24 : LembergLocalReg< 24, 2, "r2.24">,  DwarfRegNum<[56]>;
  def R2_25 : LembergLocalReg< 25, 2, "r2.25">,  DwarfRegNum<[57]>;
  def R2_26 : LembergLocalReg< 26, 2, "r2.26">,  DwarfRegNum<[58]>;
  def R2_27 : LembergLocalReg< 27, 2, "r2.27">,  DwarfRegNum<[59]>;
  def R2_28 : LembergLocalReg< 28, 2, "r2.28">,  DwarfRegNum<[60]>;
  def R2_29 : LembergLocalReg< 29, 2, "r2.29">,  DwarfRegNum<[61]>;
  def R2_30 : LembergLocalReg< 30, 2, "r2.30">,  DwarfRegNum<[62]>;

  def R3_16 : LembergLocalReg< 16, 3, "r3.16">,  DwarfRegNum<[64]>;
  def R3_17 : LembergLocalReg< 17, 3, "r3.17">,  DwarfRegNum<[65]>;
  def R3_18 : LembergLocalReg< 18, 3, "r3.18">,  DwarfRegNum<[66]>;
  def R3_19 : LembergLocalReg< 19, 3, "r3.19">,  DwarfRegNum<[67]>;
  def R3_20 : LembergLocalReg< 20, 3, "r3.20">,  DwarfRegNum<[68]>;
  def R3_21 : LembergLocalReg< 21, 3, "r3.21">,  DwarfRegNum<[69]>;
  def R3_22 : LembergLocalReg< 22, 3, "r3.22">,  DwarfRegNum<[70]>;
  def R3_23 : LembergLocalReg< 23, 3, "r3.23">,  DwarfRegNum<[71]>;
  def R3_24 : LembergLocalReg< 24, 3, "r3.24">,  DwarfRegNum<[72]>;
  def R3_25 : LembergLocalReg< 25, 3, "r3.25">,  DwarfRegNum<[73]>;
  def R3_26 : LembergLocalReg< 26, 3, "r3.26">,  DwarfRegNum<[74]>;
  def R3_27 : LembergLocalReg< 27, 3, "r3.27">,  DwarfRegNum<[75]>;
  def R3_28 : LembergLocalReg< 28, 3, "r3.28">,  DwarfRegNum<[76]>;
  def R3_29 : LembergLocalReg< 29, 3, "r3.29">,  DwarfRegNum<[77]>;
  def R3_30 : LembergLocalReg< 30, 3, "r3.30">,  DwarfRegNum<[78]>;

  // Register for memory results
  def R31  : LembergGlobalReg< 31, "r31">, DwarfRegNum<[31]>;

  // Condition flags, C0 hardwired to true
  def C0   : LembergGlobalReg<  0, "c0">, DwarfRegNum<[80]>;
  def C1   : LembergGlobalReg<  1, "c1">, DwarfRegNum<[81]>;
  def C2   : LembergGlobalReg<  2, "c2">, DwarfRegNum<[82]>;
  def C3   : LembergGlobalReg<  3, "c3">, DwarfRegNum<[83]>;

  // Local special registers
  def MUL0_0 : LembergLocalReg< 9, 0, "mul0.0">, DwarfRegNum<[89]>;
  def MUL1_0 : LembergLocalReg< 9, 1, "mul1.0">, DwarfRegNum<[89]>;
  def MUL2_0 : LembergLocalReg< 9, 2, "mul2.0">, DwarfRegNum<[89]>;
  def MUL3_0 : LembergLocalReg< 9, 3, "mul3.0">, DwarfRegNum<[89]>;
  def MUL0_1 : LembergLocalReg< 9, 0, "mul0.1">, DwarfRegNum<[90]>;
  def MUL1_1 : LembergLocalReg< 9, 1, "mul1.1">, DwarfRegNum<[90]>;
  def MUL2_1 : LembergLocalReg< 9, 2, "mul2.1">, DwarfRegNum<[90]>;
  def MUL3_1 : LembergLocalReg< 9, 3, "mul3.1">, DwarfRegNum<[90]>;

  // Global special registers for call/return
  def RB   : LembergGlobalReg< 10, "rb">,   DwarfRegNum<[90]>;
  def RO   : LembergGlobalReg< 11, "ro">,   DwarfRegNum<[91]>;
  def BA   : LembergGlobalReg< 12, "ba">,   DwarfRegNum<[92]>;

  // Floating-point registers
  def F0   : LembergGlobalReg< 16, "f0">,   DwarfRegNum<[96]>;
  def F1   : LembergGlobalReg< 17, "f1">,   DwarfRegNum<[97]>;
  def F2   : LembergGlobalReg< 18, "f2">,   DwarfRegNum<[98]>;
  def F3   : LembergGlobalReg< 19, "f3">,   DwarfRegNum<[99]>;
  def F4   : LembergGlobalReg< 20, "f4">,   DwarfRegNum<[100]>;
  def F5   : LembergGlobalReg< 21, "f5">,   DwarfRegNum<[101]>;
  def F6   : LembergGlobalReg< 22, "f6">,   DwarfRegNum<[102]>;
  def F7   : LembergGlobalReg< 23, "f7">,   DwarfRegNum<[103]>;
  def F8   : LembergGlobalReg< 24, "f8">,   DwarfRegNum<[104]>;
  def F9   : LembergGlobalReg< 25, "f9">,   DwarfRegNum<[105]>;
  def F10  : LembergGlobalReg< 26, "f10">,  DwarfRegNum<[106]>;
  def F11  : LembergGlobalReg< 27, "f11">,  DwarfRegNum<[107]>;
  def F12  : LembergGlobalReg< 28, "f12">,  DwarfRegNum<[108]>;
  def F13  : LembergGlobalReg< 29, "f13">,  DwarfRegNum<[109]>;
  def F14  : LembergGlobalReg< 30, "f14">,  DwarfRegNum<[110]>;
  def F15  : LembergGlobalReg< 31, "f15">,  DwarfRegNum<[111]>;

  def D0   : LembergDoubleReg< 16, "d0", [F0, F1]>,   DwarfRegNum<[96, 97]>;
  def D1   : LembergDoubleReg< 18, "d1", [F2, F3]>,   DwarfRegNum<[98, 99]>;
  def D2   : LembergDoubleReg< 20, "d2", [F4, F5]>,   DwarfRegNum<[100, 101]>;
  def D3   : LembergDoubleReg< 22, "d3", [F6, F7]>,   DwarfRegNum<[102, 103]>;
  def D4   : LembergDoubleReg< 24, "d4", [F8, F9]>,   DwarfRegNum<[104, 105]>;
  def D5   : LembergDoubleReg< 26, "d5", [F10, F11]>, DwarfRegNum<[106, 107]>;
  def D6   : LembergDoubleReg< 28, "d6", [F12, F13]>, DwarfRegNum<[108, 109]>;
  def D7   : LembergDoubleReg< 30, "d7", [F14, F15]>, DwarfRegNum<[110, 111]>;
}

//===----------------------------------------------------------------------===//
// Register Classes
//===----------------------------------------------------------------------===//

// Local general purpose registers
def L0 : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Unpreserved local regs
   R0_16, R0_17, R0_18, R0_19,
   R0_20, R0_21, R0_22,
   // Callee saved local regs
   R0_23, R0_24, R0_25, R0_26,
   R0_27, R0_28, R0_29,
   // Reserved
   R0_30 )>;

def L1 : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Unpreserved local regs
   R1_16, R1_17, R1_18, R1_19,
   R1_20, R1_21, R1_22,
   // Callee saved local regs
   R1_23, R1_24, R1_25, R1_26,
   R1_27, R1_28, R1_29,
   // Reserved
   R1_30 )>;

def L2 : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Unpreserved local regs
   R2_16, R2_17, R2_18, R2_19,
   R2_20, R2_21, R2_22,
   // Callee saved local regs
   R2_23, R2_24, R2_25, R2_26,
   R2_27, R2_28, R2_29,
   // Reserved
   R2_30 )>;

def L3 : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Unpreserved local regs
   R3_16, R3_17, R3_18, R3_19,
   R3_20, R3_21, R3_22,
   // Callee saved local regs
   R3_23, R3_24, R3_25, R3_26,
   R3_27, R3_28, R3_29,
   // Reserved
   R3_30 )>;

// Global general purpose registers
def G : RegisterClass<"Lemberg", [i32], 32, 
  (add
   // Return Values and Arguments
   R0, R1, R2, R3,
   // Not preserved across procedure calls
   R4, R5, R6, R7, R8, R9,
   // Callee saved
   R10, R11, R12, R13, R14,
   // Reserved
   R15, R31 )>;

// Registers that may be accessed from an individual cluster
def LG0 : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Return Values and Arguments
   R0, R1, R2, R3,
   // Not preserved across procedure calls
   R4, R5, R6, R7, R8, R9,
   R0_16, R0_17, R0_18, R0_19,
   R0_20, R0_21, R0_22,
   // Callee saved
   R10, R11, R12, R13, R14,
   R0_23, R0_24, R0_25, R0_26,
   R0_27, R0_28, R0_29,
   // Reserved
   R15, R0_30, R31 )>;

def LG1 : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Return Values and Arguments
   R0, R1, R2, R3,
   // Not preserved across procedure calls
   R4, R5, R6, R7, R8, R9,
   R1_16, R1_17, R1_18, R1_19,
   R1_20, R1_21, R1_22,
   // Callee saved
   R10, R11, R12, R13, R14,
   R1_23, R1_24, R1_25, R1_26,
   R1_27, R1_28, R1_29,
   // Reserved
   R15, R1_30, R31 )>;

def LG2 : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Return Values and Arguments
   R0, R1, R2, R3,
   // Not preserved across procedure calls
   R4, R5, R6, R7, R8, R9,
   R2_16, R2_17, R2_18, R2_19,
   R2_20, R2_21, R2_22,
   // Callee saved
   R10, R11, R12, R13, R14,
   R2_23, R2_24, R2_25, R2_26,
   R2_27, R2_28, R2_29,
   // Reserved
   R15, R2_30, R31 )>;

def LG3 : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Return Values and Arguments
   R0, R1, R2, R3,
   // Not preserved across procedure calls
   R4, R5, R6, R7, R8, R9,
   R3_16, R3_17, R3_18, R3_19,
   R3_20, R3_21, R3_22,
   // Callee saved
   R10, R11, R12, R13, R14,
   R3_23, R3_24, R3_25, R3_26,
   R3_27, R3_28, R3_29,
   // Reserved
   R15, R3_30, R31 )>;

// All general purpose registers
def A : RegisterClass<"Lemberg", [i32], 32,
  (add
   // Return Values and Arguments      
   R0, R1, R2, R3,
   // Not preserved across procedure calls
   R4, R5, R6, R7, R8, R9,
   // Unpreserved local regs
   R0_16, R1_16, R2_16, R3_16,
   R0_17, R1_17, R2_17, R3_17,
   R0_18, R1_18, R2_18, R3_18,
   R0_19, R1_19, R2_19, R3_19,
   R0_20, R1_20, R2_20, R3_20,
   R0_21, R1_21, R2_21, R3_21,
   R0_22, R1_22, R2_22, R3_22,
   // Callee saved
   R10, R11, R12, R13, R14,
   // Callee saved local regs
   R0_23, R1_23, R2_23, R3_23,
   R0_24, R1_24, R2_24, R3_24,
   R0_25, R1_25, R2_25, R3_25,
   R0_26, R1_26, R2_26, R3_26,
   R0_27, R1_27, R2_27, R3_27,
   R0_28, R1_28, R2_28, R3_28,
   R0_29, R1_29, R2_29, R3_29,
   // Reserved
   R15, R0_30, R1_30, R2_30, R3_30, R31 )>;

// Registers that can load global addresses directly
def LG0Imm : RegisterClass<"Lemberg", [i32], 32,
  (add R0, R1, R2, R3, R0_16, R0_17, R0_18, R0_19)>;
def LG1Imm : RegisterClass<"Lemberg", [i32], 32, 
  (add R0, R1, R2, R3, R1_16, R1_17, R1_18, R1_19)>;
def LG2Imm : RegisterClass<"Lemberg", [i32], 32,
  (add R0, R1, R2, R3, R2_16, R2_17, R2_18, R2_19)>;
def LG3Imm : RegisterClass<"Lemberg", [i32], 32,
  (add R0, R1, R2, R3, R3_16, R3_17, R3_18, R3_19)>;
def GImm   : RegisterClass<"Lemberg", [i32], 32,
  (add R0, R1, R2, R3)>;

def AImm : RegisterClass<"Lemberg", [i32], 32,
  (add 
   R0, R1, R2, R3,
   R0_16, R0_17, R0_18, R0_19,
   R1_16, R1_17, R1_18, R1_19,
   R2_16, R2_17, R2_18, R2_19,
   R3_16, R3_17, R3_18, R3_19 )>;

// Floating-point registers
def F : RegisterClass<"Lemberg", [f32, i32], 32,
  (add
   // Arguments and return value
   F0, F1, F2, F3,
   // Not preserved across procedure calls
   F4, F5, F6, F7, F8, F9,
   // Callee saved
   F10, F11, F12, F13, F14, F15 )>;

def D : RegisterClass<"Lemberg", [f64], 64,
  (add
   // Arguments and return value
   D0, D1,
   // Not preserved across procedure calls
   D2, D3, D4,
   // Callee saved
   D5, D6, D7 )>
{
	let SubRegClasses = [(F sub_even, sub_odd)];
}

// Various special registers
let CopyCost = -1 in {

  let Size = 32 in {
	// Condition registers
    def C : RegisterClass<"Lemberg", [i1], 32, (add C1, C2, C3)>;
  }

  // Multiplication results
  def Mul : RegisterClass<"Lemberg", [i32], 32,
  (add
   MUL0_0, MUL1_0, MUL2_0, MUL3_0,
   MUL0_1, MUL1_1, MUL2_1, MUL3_1 )>;

  // Classes for clusterizing multiplication results
  def M0 : RegisterClass<"Lemberg", [i32], 32, (add MUL0_0, MUL0_1)>;
  def M1 : RegisterClass<"Lemberg", [i32], 32, (add MUL1_0, MUL1_1)>;
  def M2 : RegisterClass<"Lemberg", [i32], 32, (add MUL2_0, MUL2_1)>;
  def M3 : RegisterClass<"Lemberg", [i32], 32, (add MUL3_0, MUL3_1)>;

  // Registers for call/return
  def CallRet : RegisterClass<"Lemberg", [i32], 32, (add RB, RO, BA)>;

  // All registers that are loaded through ldx
  def X : RegisterClass<"Lemberg", [i32], 32,
    (add
	 MUL0_0, MUL1_0, MUL2_0, MUL3_0,
	 MUL0_1, MUL1_1, MUL2_1, MUL3_1,
	 C1, C2, C3,
	 F0, F1, F2, F3, F4, F5, F6, F7,
	 F8, F9, F10, F11, F12, F13, F14, F15,
	 RB, RO, BA )>;

}
