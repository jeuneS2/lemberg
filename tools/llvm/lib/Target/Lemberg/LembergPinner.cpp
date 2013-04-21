//===-- LembergPinner.cpp - Lemberg pinner --------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Pass to pin instructions onto clusters
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "pinning"
#include "Lemberg.h"
#include "LembergTargetMachine.h"
#include "LembergSubtarget.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

STATISTIC(NumPinned, "Number of pinned instructions");
STATISTIC(NumUnpinned, "Number of unpinned instructions");

namespace {

	static LembergFU::FuncUnit AluItins [LembergSubtarget::MaxClusters][2] = {
		{LembergFU::SLOT0, LembergFU::ALU0},
		{LembergFU::SLOT1, LembergFU::ALU1},
		{LembergFU::SLOT2, LembergFU::ALU2},
		{LembergFU::SLOT3, LembergFU::ALU3}
	};

	static LembergFU::FuncUnit MemItins [LembergSubtarget::MaxClusters][2] = {
		{LembergFU::SLOT0, LembergFU::MEMU},
		{LembergFU::SLOT1, LembergFU::MEMU},
		{LembergFU::SLOT2, LembergFU::MEMU},
		{LembergFU::SLOT3, LembergFU::MEMU}
	};

	static LembergFU::FuncUnit JmpItins [LembergSubtarget::MaxClusters][2] = {
		{LembergFU::SLOT0, LembergFU::JMPU},
		{LembergFU::SLOT1, LembergFU::JMPU},
		{LembergFU::SLOT2, LembergFU::JMPU},
		{LembergFU::SLOT3, LembergFU::JMPU}
	};

	static LembergFU::FuncUnit Fpu0Itins [LembergSubtarget::MaxClusters][3] = {
		{LembergFU::SLOT0, LembergFU::FPU_DEC, LembergFU::FPU_WB},
		{LembergFU::SLOT1, LembergFU::FPU_DEC, LembergFU::FPU_WB},
		{LembergFU::SLOT2, LembergFU::FPU_DEC, LembergFU::FPU_WB},
		{LembergFU::SLOT3, LembergFU::FPU_DEC, LembergFU::FPU_WB}
	};

	static LembergFU::FuncUnit Fpu1Itins [LembergSubtarget::MaxClusters][4] = {
		{LembergFU::SLOT0, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_WB},
		{LembergFU::SLOT1, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_WB},
		{LembergFU::SLOT2, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_WB},
		{LembergFU::SLOT3, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_WB}
	};

	static LembergFU::FuncUnit Fpu2Itins [LembergSubtarget::MaxClusters][5] = {
		{LembergFU::SLOT0, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_WB},
		{LembergFU::SLOT1, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_WB},
		{LembergFU::SLOT2, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_WB},
		{LembergFU::SLOT3, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_WB}
	};

	static LembergFU::FuncUnit Fpu3Itins [LembergSubtarget::MaxClusters][6] = {
		{LembergFU::SLOT0, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_WB},
		{LembergFU::SLOT1, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_WB},
		{LembergFU::SLOT2, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_WB},
		{LembergFU::SLOT3, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_WB}
	};

	static LembergFU::FuncUnit Fpu4Itins [LembergSubtarget::MaxClusters][7] = {
		{LembergFU::SLOT0, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4, 
		 LembergFU::FPU_WB},
		{LembergFU::SLOT1, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4, 
		 LembergFU::FPU_WB},
		{LembergFU::SLOT2, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4, 
		 LembergFU::FPU_WB},
		{LembergFU::SLOT3, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4, 
		 LembergFU::FPU_WB}
	};

	static LembergFU::FuncUnit Fpu6Itins [LembergSubtarget::MaxClusters][9] = {
		{LembergFU::SLOT0, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4,
		 LembergFU::FPU_EX5, LembergFU::FPU_EX6, LembergFU::FPU_WB},
		{LembergFU::SLOT1, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4,
		 LembergFU::FPU_EX5, LembergFU::FPU_EX6, LembergFU::FPU_WB},
		{LembergFU::SLOT2, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4,
		 LembergFU::FPU_EX5, LembergFU::FPU_EX6, LembergFU::FPU_WB},
		{LembergFU::SLOT3, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4,
		 LembergFU::FPU_EX5, LembergFU::FPU_EX6, LembergFU::FPU_WB}
	};

	static LembergFU::FuncUnit Fpu7Itins [LembergSubtarget::MaxClusters][10] = {
		{LembergFU::SLOT0, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4,
		 LembergFU::FPU_EX5, LembergFU::FPU_EX6, LembergFU::FPU_EX7, 
		 LembergFU::FPU_WB},
		{LembergFU::SLOT1, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4,
		 LembergFU::FPU_EX5, LembergFU::FPU_EX6, LembergFU::FPU_EX7, 
		 LembergFU::FPU_WB},
		{LembergFU::SLOT2, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4,
		 LembergFU::FPU_EX5, LembergFU::FPU_EX6, LembergFU::FPU_EX7, 
		 LembergFU::FPU_WB},
		{LembergFU::SLOT3, LembergFU::FPU_DEC, LembergFU::FPU_EX1,
		 LembergFU::FPU_EX2, LembergFU::FPU_EX3, LembergFU::FPU_EX4,
		 LembergFU::FPU_EX5, LembergFU::FPU_EX6, LembergFU::FPU_EX7, 
		 LembergFU::FPU_WB}
	};

	struct Pinner : public MachineFunctionPass {
	private:
		unsigned AluSchedClasses [LembergSubtarget::MaxClusters];
		unsigned MemSchedClasses [LembergSubtarget::MaxClusters];
		unsigned JmpSchedClasses [LembergSubtarget::MaxClusters];
		unsigned Fpu0SchedClasses [LembergSubtarget::MaxClusters];
		unsigned Fpu1SchedClasses [LembergSubtarget::MaxClusters];
		unsigned Fpu2SchedClasses [LembergSubtarget::MaxClusters];
		unsigned Fpu3SchedClasses [LembergSubtarget::MaxClusters];
		unsigned Fpu4SchedClasses [LembergSubtarget::MaxClusters];
		unsigned Fpu6SchedClasses [LembergSubtarget::MaxClusters];
		unsigned Fpu7SchedClasses [LembergSubtarget::MaxClusters];

	public:
		TargetMachine &TM;
		const TargetInstrInfo *TII;

		static char ID;
		Pinner(TargetMachine &tm) 
			: MachineFunctionPass(ID), TM(tm), TII(tm.getInstrInfo()) { 

			for (unsigned i = 0; i < LembergSubtarget::MaxClusters; ++i) {
				AluSchedClasses[i] = getClassForPattern(AluItins[i], 2);
				MemSchedClasses[i] = getClassForPattern(MemItins[i], 2);
				JmpSchedClasses[i] = getClassForPattern(JmpItins[i], 2);
				Fpu0SchedClasses[i] = getClassForPattern(Fpu0Itins[i], 3);
				Fpu1SchedClasses[i] = getClassForPattern(Fpu1Itins[i], 4);
				Fpu2SchedClasses[i] = getClassForPattern(Fpu2Itins[i], 5);
				Fpu3SchedClasses[i] = getClassForPattern(Fpu3Itins[i], 6);
				Fpu4SchedClasses[i] = getClassForPattern(Fpu4Itins[i], 7);
				Fpu6SchedClasses[i] = getClassForPattern(Fpu6Itins[i], 9);
				Fpu7SchedClasses[i] = getClassForPattern(Fpu7Itins[i], 10);
			}
		}

		virtual const char *getPassName() const {
			return "Lemberg Pinner";
		}

		void pinToCluster(MachineInstr &MI, int cluster);

		bool runOnMachineFunction(MachineFunction &F);

	private:
		unsigned getClassForPattern(LembergFU::FuncUnit P [], unsigned L);
		bool compatibleSchedClass(unsigned A, unsigned B);
	};
		
	char Pinner::ID = 0;

	struct PostPinner : Pinner {

		PostPinner(TargetMachine &tm) 
			: Pinner(tm) {
		}

		virtual const char *getPassName() const {
			return "Lemberg PostPinner";
		}

		bool runOnMachineFunction(MachineFunction &F);

	};

} // end of anonymous namespace

// createLembergPinnerPass - Returns a pass that pins
FunctionPass *llvm::createLembergPinnerPass(LembergTargetMachine &TM,
											CodeGenOpt::Level OptLevel) {
	return new Pinner(TM);
}

// createLembergPostPinnerPass - Returns a pass that pins after scheduling
FunctionPass *llvm::createLembergPostPinnerPass(LembergTargetMachine &TM,
												CodeGenOpt::Level OptLevel) {
	return new PostPinner(TM);
}

unsigned Pinner::getClassForPattern(LembergFU::FuncUnit P [], unsigned L) {

	const LembergSubtarget &LST = TM.getSubtarget<LembergSubtarget>();
	const InstrItineraryData &IID = LST.getInstrItins();
	const InstrItinerary *IITab = IID.Itineraries;
	const InstrStage *IIStages = IID.Stages;

	for (unsigned c = 0; !IID.isEndMarker(c); ++c) {
		// Do not accept itineraties with different length
		if (IITab[c].LastStage - IITab[c].FirstStage != L) {
			continue;
		}
		unsigned i, s;
		for (i = 0, s = IITab[c].FirstStage; i < L; ++i, ++s) {
			// Units are not equal
			if (IIStages[s].getUnits() != LST.getFuncUnit(P[i]))
				break;
		}
		// All units are the same
		if (i == L)
			return c;
	}

	llvm_unreachable("Cannot find class for itinerary pattern");
}

bool Pinner::compatibleSchedClass(unsigned A, unsigned B) {
	const LembergSubtarget &LST = TM.getSubtarget<LembergSubtarget>();
	const InstrItineraryData &IID = LST.getInstrItins();
	const InstrItinerary *IITab = IID.Itineraries;
	const InstrStage *IIStages = IID.Stages;

	// Need to have same length
	if (IITab[A].LastStage - IITab[A].FirstStage !=
		IITab[B].LastStage - IITab[B].FirstStage) {
		return false;
	}

	for (unsigned a = IITab[A].FirstStage, b = IITab[B].FirstStage;
		 a != IITab[A].LastStage && b != IITab[B].LastStage;
		 ++a, ++b) {
		// Stages must at least overlap
		if ((IIStages[a].getUnits() & IIStages[b].getUnits()) == 0) {
			return false;
		}
	}

	return true;
}

void Pinner::pinToCluster(MachineInstr &MI, int cluster) {

	// Ignore implicitly created no-ops and inline asm
	if (MI.isKill() || MI.isImplicitDef() || MI.isInlineAsm() || MI.isDebugValue()) {
		return;
	}

	unsigned SchedClass = MI.getDesc().getSchedClass();

	const MCInstrDesc &MID = MI.getDesc();
	MCInstrDesc *NMID = new MCInstrDesc();
	*NMID = MID;
	NMID->Flags |= 1 << MCID::ExtraSrcRegAllocReq;
	NMID->Flags |= 1 << MCID::ExtraDefRegAllocReq;
	
	if (compatibleSchedClass(SchedClass, AluSchedClasses[cluster])) {
		NMID->SchedClass = AluSchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, MemSchedClasses[cluster])) {
		NMID->SchedClass = MemSchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, JmpSchedClasses[cluster])) {
		NMID->SchedClass = JmpSchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, Fpu0SchedClasses[cluster])) {
		NMID->SchedClass = Fpu0SchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, Fpu1SchedClasses[cluster])) {
		NMID->SchedClass = Fpu1SchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, Fpu2SchedClasses[cluster])) {
		NMID->SchedClass = Fpu2SchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, Fpu3SchedClasses[cluster])) {
		NMID->SchedClass = Fpu3SchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, Fpu4SchedClasses[cluster])) {
		NMID->SchedClass = Fpu4SchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, Fpu6SchedClasses[cluster])) {
		NMID->SchedClass = Fpu6SchedClasses[cluster];
	} else if (compatibleSchedClass(SchedClass, Fpu7SchedClasses[cluster])) {
		NMID->SchedClass = Fpu7SchedClasses[cluster];
	} else {
		MI.dump();
		llvm_unreachable("Cannot find compatible schedule class for pinning");
	}
	
	MI.setDesc(*NMID);
}

bool Pinner::runOnMachineFunction(MachineFunction &F) 
{
	bool Changed = false;

	const LembergRegisterInfo *LRI = ((LembergTargetMachine &)TM).getRegisterInfo();

	for (MachineFunction::iterator FI = F.begin(), FE = F.end(); FI != FE; ++FI) {
		for (MachineBasicBlock::iterator BI = FI->begin(), BE = FI->end(); BI != BE; ++BI) {

			MachineInstr &MI = *BI;
			int cluster = LRI->getCluster(MI);

			if (cluster < 0) {
				NumUnpinned++;
			} else {
				pinToCluster(MI, cluster);
				Changed = true;
				NumPinned++;
			}
		}
	}

	return Changed;
}

bool PostPinner::runOnMachineFunction(MachineFunction &F) 
{
	bool Changed = false;

	const LembergRegisterInfo *LRI = ((LembergTargetMachine &)TM).getRegisterInfo();

	unsigned ClusterCount = TM.getSubtarget<LembergSubtarget>().getClusters();
	SmallVector<MachineInstr *, LembergSubtarget::MaxClusters> UnPinned;
	unsigned ScoreBoard = 0;

	for (MachineFunction::iterator FI = F.begin(), FE = F.end(); FI != FE; ++FI) {
		for (MachineBasicBlock::iterator BI = FI->begin(), BE = FI->end(); BI != BE; ++BI) {

			MachineInstr &MI = *BI;

			if (MI.getOpcode() == Lemberg::NOP) {
				// No cluster needed for a NOP
				continue;
			}
			
			if (MI.getOpcode() == Lemberg::SEP) {
				// Handle unpinned insns
				unsigned cluster = 0;
				for (SmallVector<MachineInstr *, LembergSubtarget::MaxClusters>::iterator
						 I = UnPinned.begin(), E = UnPinned.end(); I != E; ++I) {
					MachineInstr *P = *I;
					for ( ; cluster < ClusterCount; cluster++) {
						if ((ScoreBoard & (1 << cluster)) == 0) {
							pinToCluster(*P, cluster);
							ScoreBoard |= 1 << cluster;
							Changed = true;
							break;
						}
					}
				}
				assert(cluster != ClusterCount && "Could not find suitable cluster");
				// Reset state
				UnPinned.clear();
				ScoreBoard = 0;
				continue;
			}
			
			int cluster = LRI->getCluster(MI);		
			if (cluster < 0) {
				UnPinned.push_back(&MI);
			} else {
				ScoreBoard |= 1 << cluster;
				pinToCluster(MI, cluster);
			}
		}
	}

	return Changed;
}

