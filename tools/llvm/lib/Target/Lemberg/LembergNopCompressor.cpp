//===-- LembergNopCompressor.cpp - Lemberg pinner --------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Pass to compress NOPs to multi-cycle NOPs
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "nop-compression"
#include "Lemberg.h"
#include "LembergTargetMachine.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

STATISTIC(NumNopCompressed, "Number of NOPs eliminated");
STATISTIC(NumNopEncountered, "Number of NOPs encountered");

namespace {

	struct Compressor : public MachineFunctionPass {
		TargetMachine &TM;
		const TargetInstrInfo *TII;

		static char ID;
		Compressor(TargetMachine &tm) 
			: MachineFunctionPass(ID), TM(tm), TII(tm.getInstrInfo()) {
		}

		virtual const char *getPassName() const {
			return "Lemberg NOP-Compressor";
		}

		bool runOnMachineFunction(MachineFunction &F);
	};		
	char Compressor::ID = 0;
} // end of anonymous namespace

// createNopCompressorPass - Returns a pass that compresses NOPs
FunctionPass *llvm::createLembergNopCompressorPass(LembergTargetMachine &TM,
												   CodeGenOpt::Level OptLevel) {
	return new Compressor(TM);
}

bool Compressor::runOnMachineFunction(MachineFunction &F) 
{
	bool Changed = false;

	for (MachineFunction::iterator FI = F.begin(), FE = F.end(); FI != FE; ++FI) {

		for (MachineBasicBlock::iterator BI = FI->begin(), BE = FI->end(); BI != BE; ++BI) {

			MachineInstr *MI = BI;

			if (MI->getOpcode() == Lemberg::NOP) {

				assert(next(BI)->getOpcode() == Lemberg::SEP && "Expecting separator after NOP");

				++NumNopEncountered;

				// Don't go past end of basic block
				if (next(next(BI)) != FI->end()) {

					MachineInstr *NI = next(next(BI));

					if (NI->getOpcode() == Lemberg::NOP) {

						// Add cycles
						MI->getOperand(0).setImm(MI->getOperand(0).getImm()+NI->getOperand(0).getImm()+1);
						
						// Erase separator and next instruction
						next(BI)->eraseFromParent();
						next(BI)->eraseFromParent();
						
						// Look at this instruction again
						--BI;

						++NumNopCompressed;
						
						Changed = true;
					}
				}
			}
		}
	}

	return Changed;
}
