//===-- LembergClusterizer.cpp -Lemberg clusterizer -----------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Pass to allocate registers (and operations) to clusters
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "clusterize"
#include "Lemberg.h"
#include "LembergTargetMachine.h"
#include "LembergSubtarget.h"
#include "llvm/CodeGen/LiveIntervalAnalysis.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegisterCoalescer.h"
#include "llvm/ADT/SetVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include <queue>
#include <vector>

using namespace llvm;

STATISTIC(NumLocal , "Number of localized virtual registers");
STATISTIC(NumGlobal, "Number of global virtual registers");

namespace {

	static const unsigned ClusterCount = 4;

	static const TargetRegisterClass *Clusters [ClusterCount] =
		{ Lemberg::LG0RegisterClass, Lemberg::LG1RegisterClass,
		  Lemberg::LG2RegisterClass, Lemberg::LG3RegisterClass };
	static const TargetRegisterClass *ImmClusters [ClusterCount] =
		{ Lemberg::LG0ImmRegisterClass, Lemberg::LG1ImmRegisterClass,
		  Lemberg::LG2ImmRegisterClass, Lemberg::LG3ImmRegisterClass };
	static const TargetRegisterClass *MulClusters [ClusterCount] =
		{ Lemberg::M0RegisterClass, Lemberg::M1RegisterClass,
		  Lemberg::M2RegisterClass, Lemberg::M3RegisterClass };

	struct Clusterizer : public MachineFunctionPass {

		TargetMachine &TM;
		const TargetInstrInfo *TII;

		static char ID;
		Clusterizer(TargetMachine &tm) 
			: MachineFunctionPass(ID), TM(tm), TII(tm.getInstrInfo()),
			  NeighborhoodQueue(neighborhood(RegClasses, Neighbors)) {
			
			initializeRegisterCoalescerAnalysisGroup(*PassRegistry::getPassRegistry());
		}

		virtual const char *getPassName() const {
			return "Lemberg Clusterizer";
		}

		virtual void getAnalysisUsage(AnalysisUsage &AU) const;

		bool runOnMachineFunction(MachineFunction &F);

	private:
		std::map<unsigned, const TargetRegisterClass*> RegClasses;
		std::map<unsigned, SetVector<unsigned>*> Neighbors;

		class neighborhood {
			std::map<unsigned, const TargetRegisterClass*> &classes;
			std::map<unsigned, SetVector<unsigned>*> &hood;			
		public:
			neighborhood(std::map<unsigned, const TargetRegisterClass*> &c,
						 std::map<unsigned, SetVector<unsigned>*> &h) :
				classes(c), hood(h) { }
			bool operator() (const unsigned &lhs, const unsigned &rhs) const {
				// multiplication results must be treated first
				if (classes[lhs] == Lemberg::MulRegisterClass
					&& classes[rhs] != Lemberg::MulRegisterClass) {
					return false;
				}
				if (classes[lhs] != Lemberg::MulRegisterClass
					&& classes[rhs] == Lemberg::MulRegisterClass) {
					return true;
				}
				// prefer registers with fewer neighbors
				if (hood[lhs]->size() != hood[rhs]->size()) {
					return hood[lhs]->size() > hood[rhs]->size();
				}
				// use register number as tie-breaker
				return lhs > rhs;
			}
		};
		std::priority_queue<unsigned, std::vector<unsigned>, neighborhood> NeighborhoodQueue;

		void buildNeighborhood(MachineFunction &F, MachineRegisterInfo *MRI);

		bool isConflicting(const TargetRegisterClass *Target, SetVector<unsigned> *Others);

		bool isVirtualReg(MachineOperand &MO);
	};
		
	char Clusterizer::ID = 0;

} // end of anonymous namespace

// createLemberClusterizerPass - Returns a pass that clusterizes
FunctionPass *llvm::createLembergClusterizerPass(LembergTargetMachine &TM,
												 CodeGenOpt::Level OptLevel) {
	return new Clusterizer(TM);
}

void Clusterizer::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.setPreservesCFG();
	AU.addPreserved<LiveIntervals>();
	AU.addPreserved<SlotIndexes>();
    AU.addRequired<RegisterCoalescer>();
    AU.addPreserved<RegisterCoalescer>();
	MachineFunctionPass::getAnalysisUsage(AU);
}

bool Clusterizer::isVirtualReg(MachineOperand &MO) {
	return MO.isReg() && MO.getReg() && TargetRegisterInfo::isVirtualRegister(MO.getReg());
}

static bool compatibleClass(const TargetRegisterClass *A, const TargetRegisterClass *B) {
	// obviously compatible
	if (A == B)
		return true;
	
	// top classes are compatible with everything
	if (A == Lemberg::ARegisterClass
		|| A == Lemberg::AImmRegisterClass
		|| A == Lemberg::MulRegisterClass
		|| B == Lemberg::ARegisterClass
		|| B == Lemberg::AImmRegisterClass
		|| B == Lemberg::MulRegisterClass)
		return true;
	
	// global class is compatible with everything
	if (A == Lemberg::GRegisterClass || B == Lemberg::GRegisterClass
		|| A == Lemberg::GImmRegisterClass || B == Lemberg::GImmRegisterClass)
		return true;

	// general purpose clusters are compatible with mul clusters
	int ClusterA = -1, ClusterB = -1;
	for (unsigned i = 0; i < ClusterCount; i++) {
		if (A == Clusters[i] || A == ImmClusters[i] || A == MulClusters[i]) {
			ClusterA = i;
		}
		if (B == Clusters[i] || B == ImmClusters[i] || B == MulClusters[i]) {
			ClusterB = i;
		}
	}

	if (ClusterA == ClusterB)
		return true;

	return false;
}

bool Clusterizer::isConflicting(const TargetRegisterClass *Target, SetVector<unsigned> *Others) {

	for (SetVector<unsigned>::iterator
			 I = Others->begin(), E = Others->end(); I != E; ++I) {
		const TargetRegisterClass *TRC = RegClasses[*I];
		if (!compatibleClass(TRC, Target)) {
			return true;
		}
	}
	return false;
}

// build up tables for regclasses and neighbors
void Clusterizer::buildNeighborhood(MachineFunction &F, MachineRegisterInfo *MRI)
{
	for (MachineFunction::iterator FI = F.begin(), FE = F.end(); FI != FE; ++FI) {
		for (MachineBasicBlock::iterator BI = FI->begin(), BE = FI->end(); BI != BE; ++BI) {

			for (unsigned i = 0, e = BI->getNumOperands(); i < e; ++i) {

				MachineOperand &MO = BI->getOperand(i);				
				if (!isVirtualReg(MO))
					continue;

				unsigned regNo = MO.getReg();

				// record current register class
				RegClasses[regNo] = MRI->getRegClass(regNo);

				// record neighboring registers
				if (!Neighbors.count(regNo)) {
					Neighbors[regNo] = new SetVector<unsigned>();
				}
				for (unsigned k = i+1; k < e; ++k) {
					MachineOperand &O = BI->getOperand(k);
					if (isVirtualReg(O)) {
						unsigned r = O.getReg();
						if (!Neighbors.count(r)) {
							Neighbors[r] = new SetVector<unsigned>();
						}
						Neighbors[regNo]->insert(r);
						Neighbors[r]->insert(regNo);
					}
				}
			}				
		} 
	}

	// push regs onto work list
	for (std::map<unsigned, const TargetRegisterClass *>::iterator
			 RI = RegClasses.begin(), RE = RegClasses.end(); RI != RE; ++RI) {
		NeighborhoodQueue.push(RI->first);
	}
}

bool Clusterizer::runOnMachineFunction(MachineFunction &F) 
{
	bool Changed = false;

	MachineRegisterInfo *MRI = &F.getRegInfo();
	
	buildNeighborhood(F, MRI);

	unsigned tryCluster = 0;

	// traverse regs sorted by neighborhood size
	while (!NeighborhoodQueue.empty()) {

		unsigned regNo = NeighborhoodQueue.top();
		NeighborhoodQueue.pop();

		// do not handle global special registers
		if (MRI->getRegClass(regNo) == Lemberg::CRegisterClass ||
			MRI->getRegClass(regNo) == Lemberg::FRegisterClass ||
			MRI->getRegClass(regNo) == Lemberg::DRegisterClass ||
			MRI->getRegClass(regNo) == Lemberg::MemRegisterClass ||
			MRI->getRegClass(regNo) == Lemberg::CallRetRegisterClass) {
			continue;
		}

		bool isMul = MRI->getRegClass(regNo) == Lemberg::MulRegisterClass;
		bool isImm = MRI->getRegClass(regNo) == Lemberg::AImmRegisterClass;

		// look for a cluster without conflicts
		unsigned i;
		for (i = 0; i < ClusterCount; ++i) {
			const TargetRegisterClass *C;

			if (isMul)
				C = MulClusters[(i+tryCluster) % ClusterCount];
			else if (isImm)
				C = ImmClusters[(i+tryCluster) % ClusterCount];
			else
				C = Clusters[(i+tryCluster) % ClusterCount];

			if (!isConflicting(C, Neighbors[regNo])) {
				// restrict register class
				RegClasses[regNo] = C;
				MRI->setRegClass(regNo, C);
			 	Changed = true;
				NumLocal++;
			 	break;
			}
		}
		// nothing found, make global
		if (i == ClusterCount) {
			assert(MRI->getRegClass(regNo) != Lemberg::MulRegisterClass
				   && "Multiplication results must be localized");

			const TargetRegisterClass *C;
			if (isImm)
				C = Lemberg::GImmRegisterClass;
			else
				C = Lemberg::GRegisterClass;

			RegClasses[regNo] = C;
			MRI->setRegClass(regNo, C);
			Changed = true;
			NumGlobal++;
		} else {
			// try to use next cluster
			tryCluster += i+1;
		}
	}

	// clean up
	RegClasses.clear();
	Neighbors.clear();

	return Changed;
}
