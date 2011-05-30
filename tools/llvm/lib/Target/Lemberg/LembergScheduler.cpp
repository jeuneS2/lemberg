//===-- LembergScheduler.cpp - Lemberg final scheduler ---------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Pass to schedule and bundle instructions
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "post-RA-sched"
#include "Lemberg.h"
#include "LembergTargetMachine.h"
#include "LembergSubtarget.h"
#include "../../CodeGen/AntiDepBreaker.h"
#include "../../CodeGen/CriticalAntiDepBreaker.h"
#include "../../CodeGen/SchedulePostRATDList.h"
#include "llvm/CodeGen/MachineDominators.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/ScheduleHazardRecognizer.h"
#include "llvm/CodeGen/ScoreboardHazardRecognizer.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

STATISTIC(NumBundles, "Number of bundles created");

namespace {

	struct Scheduler : public MachineFunctionPass {
      AliasAnalysis *AA;
      TargetMachine &TM;

	public:
		static char ID;
		Scheduler(TargetMachine &tm) 
			: MachineFunctionPass(ID), TM(tm) { 
		}

		void getAnalysisUsage(AnalysisUsage &AU) const {
			AU.setPreservesCFG();
			AU.addRequired<AliasAnalysis>();
			AU.addRequired<MachineDominatorTree>();
			AU.addPreserved<MachineDominatorTree>();
			AU.addRequired<MachineLoopInfo>();
			AU.addPreserved<MachineLoopInfo>();
			MachineFunctionPass::getAnalysisUsage(AU);
		}

		virtual const char *getPassName() const {
			return "Lemberg Post RA Scheduler";
		}

		bool runOnMachineFunction(MachineFunction &F);
	};
		
	char Scheduler::ID = 0;

	class ScheduleTDList : public SchedulePostRATDList {
	public:
		ScheduleTDList(MachineFunction &MF,
					   MachineLoopInfo &MLI,
					   MachineDominatorTree &MDT,
					   AliasAnalysis *AA,
					   TargetSubtarget::AntiDepBreakMode AntiDepMode,
					   SmallVectorImpl<TargetRegisterClass*> &CriticalPathRCs)
			: SchedulePostRATDList(MF, MLI, MDT, AA, AntiDepMode, CriticalPathRCs) {}

		~ScheduleTDList() {
		}

		virtual void BuildSchedGraph(AliasAnalysis *AA);
	};

	class HazardRecognizer : public ScoreboardHazardRecognizer {

		MachineFunction &MF;
		const TargetInstrInfo *TII;
		ScheduleDAG *Sched;

		unsigned fpuPipe;

	public:
		HazardRecognizer(const InstrItineraryData *ItinData,
						 const ScheduleDAG *DAG,
						 MachineFunction &mf,
						 const TargetInstrInfo *tii) :
			ScoreboardHazardRecognizer(ItinData, DAG), MF(mf), TII(tii) {
			fpuPipe = 0;
		}

		~HazardRecognizer() {
		}

		void setSched(ScheduleDAG *DAG) {
			Sched = DAG;
		}

		void insertSep();
		void insertNop();

		virtual void EmitInstruction(SUnit *SU);
		virtual void AdvanceCycle();
		virtual void FlushPipe();
		virtual void Reset();
	};

} // end of anonymous namespace

// createLemberSchedulerPass - Returns a pass that schedules
FunctionPass *llvm::createLembergSchedulerPass(LembergTargetMachine &TM,
											   CodeGenOpt::Level OptLevel) {
	return new Scheduler(TM);
}

ScheduleHazardRecognizer *
LembergInstrInfo::CreateTargetPostRAHazardRecognizer(const InstrItineraryData *InstrItins,
													 const ScheduleDAG *DAG) const {
	return new HazardRecognizer(InstrItins, DAG, DAG->MF, this);
}

static bool isStackAccess(const MachineInstr *MI) {
	unsigned Opcode = MI->getDesc().getOpcode();
	return Opcode == Lemberg::LOAD32sp || Opcode == Lemberg::LOAD32spi
		|| Opcode == Lemberg::STORE32sp || Opcode == Lemberg::STORE32sp_imm
		|| Opcode == Lemberg::STORE32spi || Opcode == Lemberg::STORE32spi_imm
		|| Opcode == Lemberg::STORE16sp || Opcode == Lemberg::STORE16sp_imm
		|| Opcode == Lemberg::STORE16spi || Opcode == Lemberg::STORE16spi_imm
		|| Opcode == Lemberg::STORE8sp || Opcode == Lemberg::STORE8sp_imm
		|| Opcode == Lemberg::STORE8spi || Opcode == Lemberg::STORE8spi_imm;
}

void ScheduleTDList::BuildSchedGraph(AliasAnalysis *AA) {

	// Create normal scheduling graph
	SchedulePostRATDList::BuildSchedGraph(AA);
	
	// Refine scheduling graph
	for (unsigned i = 0, e = SUnits.size(); i != e; ++i) {
		SUnit &SU = SUnits[i];
		// Make sure that stuff that is chained to memory accesses is
		// scheduled in suitable cycles
		if (SU.getInstr()->getDesc().mayStore()
			|| SU.getInstr()->getDesc().mayLoad()) {

			// Pick a suitable latency
			unsigned MemLatency = 1;
			if (!isStackAccess(SU.getInstr())) {
				MemLatency = SU.getInstr()->getDesc().mayStore() ? 1 : 3;
			} else {
			 	MemLatency = SU.getInstr()->getDesc().mayStore() ? 1 : 2;
			}

			// Insert appropriate latencies
			for (SUnit::succ_iterator I = SU.Succs.begin(), E = SU.Succs.end();
				 I != E; ++I) {
				if (I->getKind() == SDep::Order) {

					SUnit *Succ = I->getSUnit();

					// TODO: why do we see successors without real instruction?
					if (!Succ->getInstr())
						continue;

					// Latencies are just interesting for some combinations
					if ((SU.getInstr()->getDesc().mayStore()
						 && !(Succ->getInstr()->getDesc().mayLoad()
							  || Succ->getInstr()->getDesc().mayStore()))
						|| (SU.getInstr()->getDesc().mayLoad()
							&& !(Succ->getInstr()->getDesc().mayLoad()
								 || Succ->getInstr()->getDesc().mayStore()
								 || Succ->getInstr()->getOpcode() == Lemberg::LDXa
								 || Succ->getInstr()->getOpcode() == Lemberg::LDXi)))
						continue;
					
					// Set forward latency
					I->setLatency(MemLatency);

					// Also set latencies in reverse direction
					for (SUnit::succ_iterator K = Succ->Preds.begin(), F = Succ->Preds.end();
						 K != F; ++K) {
						if (K->getSUnit() == &SU) {
							K->setLatency(MemLatency);
						}
					}
				}
			}
		}

		// Make sure that conditions are computed early to allow for
		// filling of delay slots.
		if (SU.getInstr()->definesRegister(Lemberg::C1)
			|| SU.getInstr()->definesRegister(Lemberg::C2)
			|| SU.getInstr()->definesRegister(Lemberg::C3)) {

			const unsigned BranchLatency = 3;

			// We always assume that the condition is used by an
			// instruction with a branch delay
			SU.setHeightToAtLeast(BranchLatency+1);
		}
	}
}

void HazardRecognizer::insertSep() {

	MachineInstr *MI = BuildMI(MF, DebugLoc(), TII->get(Lemberg::SEP));
	SUnit *Sep = new SUnit();
	Sep->setInstr(MI);
	// Force the separator to pass verification
	Sep->NumPreds = 1;
	Sep->NumSuccs = 1;
	Sep->isScheduled = true;
	Sched->SUnits.push_back(*Sep);
	
	// Add the separator to the current sequence
	Sched->Sequence.push_back(Sep);

	NumBundles++;
}

void HazardRecognizer::insertNop() {

	MachineInstr *MI = BuildMI(MF, DebugLoc(), TII->get(Lemberg::NOP)).addImm(0);
	SUnit *Nop = new SUnit();
	Nop->setInstr(MI);
	// Force the noop to pass verification
	Nop->NumPreds = 1;
	Nop->NumSuccs = 1;
	Nop->isScheduled = true;
	Sched->SUnits.push_back(*Nop);
	
	// Add the noop to the current sequence
	Sched->Sequence.push_back(Nop);

	NumBundles++;
}

void HazardRecognizer::EmitInstruction(SUnit *SU) {
	MachineInstr *MI = SU->getInstr();
	switch (MI->getOpcode()) {
	case Lemberg::FMOV:
	case Lemberg::FMOVtrue:
	case Lemberg::FMOVfalse:
	case Lemberg::FNEG:
	case Lemberg::FABS:
	case Lemberg::FADD:
	case Lemberg::FSUB:
	case Lemberg::FMUL:
	case Lemberg::FMAC:
	case Lemberg::FCMP:
	case Lemberg::FZERO:
	case Lemberg::DMOV:
	case Lemberg::DMOVtrue:
	case Lemberg::DMOVfalse:
	case Lemberg::DNEG:
	case Lemberg::DABS:
	case Lemberg::DADD:
	case Lemberg::DSUB:
	case Lemberg::DMUL:
	case Lemberg::DMAC:
	case Lemberg::DCMP:
	case Lemberg::DZERO:
	case Lemberg::SI2SF:
	case Lemberg::SF2SI:
	case Lemberg::SI2DF:
	case Lemberg::DF2SI:
	case Lemberg::D2F:
	case Lemberg::F2D:
	case Lemberg::MOVEaf:
	case Lemberg::MOVEfa:
		fpuPipe |= 1 << SU->Latency;
		break;
	default:
		break;
	}

	return ScoreboardHazardRecognizer::EmitInstruction(SU);
}

void HazardRecognizer::AdvanceCycle() {

	fpuPipe >>= 1;

	// Insert separator if necessary
	if (Sched->Sequence.size() > 0 && Sched->Sequence.back() != 0) {
		MachineInstr *LastMI = Sched->Sequence.back()->getInstr();
		if (LastMI->getOpcode() != Lemberg::SEP) {
			insertSep();
		} else if (fpuPipe != 0) {
			insertNop();
			insertSep();
		}
	}

	// Update hazard information
	ScoreboardHazardRecognizer::AdvanceCycle();
}

void HazardRecognizer::FlushPipe() {
	while (fpuPipe != 0) {
		AdvanceCycle();
	}
}

void HazardRecognizer::Reset() {
	fpuPipe = 0;
	ScoreboardHazardRecognizer::Reset();
}

/// isSchedulingBoundary - Test if the given instruction should be
/// considered a scheduling boundary. This primarily includes labels
/// and terminators.
static bool isSchedulingBoundary(const MachineInstr *MI,
                                 const MachineFunction &MF) {
	// Terminators, labels and calls can't be scheduled around.
	if (MI->getDesc().isTerminator() || MI->isLabel() || MI->getDesc().isCall())
		return true;
	
	return false;
}

bool Scheduler::runOnMachineFunction(MachineFunction &Fn) {
  AA = &getAnalysis<AliasAnalysis>();

  DEBUG(dbgs() << "Lemberg Post RA Scheduler: " << Fn.getFunction()->getName() << "\n");

  MachineLoopInfo &MLI = getAnalysis<MachineLoopInfo>();
  MachineDominatorTree &MDT = getAnalysis<MachineDominatorTree>();
  AliasAnalysis *AA = &getAnalysis<AliasAnalysis>();
  TargetSubtarget::AntiDepBreakMode AntiDepMode = TargetSubtarget::ANTIDEP_NONE;
  SmallVector<TargetRegisterClass*, 4> CriticalPathRCs;

  ScheduleTDList Scheduler(Fn, MLI, MDT, AA, AntiDepMode, CriticalPathRCs);
  HazardRecognizer *HR = (HazardRecognizer *)Scheduler.HazardRec;
  HR->setSched(&Scheduler);

  const TargetInstrInfo *TII = Fn.getTarget().getInstrInfo();

  // Loop over all of the basic blocks
  for (MachineFunction::iterator MBB = Fn.begin(), MBBe = Fn.end();
       MBB != MBBe; ++MBB) {

	DEBUG(dbgs() << "Scheduling BB:\n");
	DEBUG(MBB->dump());

	// Reserve thrice the size of the MBB to fit separators and potential nops
	Scheduler.SUnits.reserve(5*MBB->size());

    // Initialize register live-range state for scheduling in this block.
    Scheduler.StartBlock(MBB);

    // Schedule each sequence of instructions not interrupted by a label
    // or anything else that effectively needs to shut down scheduling.
    MachineBasicBlock::iterator Current = MBB->end();
    unsigned Count = MBB->size(), CurrentCount = Count;
    for (MachineBasicBlock::iterator I = Current; I != MBB->begin(); ) {
      MachineInstr *MI = prior(I);
	  // No need to schedule kills or implicit defs
	  if (MI->getOpcode() == TargetOpcode::KILL
		  || MI->getOpcode() == TargetOpcode::IMPLICIT_DEF) {
		  MI->eraseFromParent();
		  --Count;
		  continue;
	  }
      if (isSchedulingBoundary(MI, Fn)) {
		// Schedule portion of BB
        Scheduler.Run(MBB, I, Current, CurrentCount);
		HR->AdvanceCycle();
		HR->FlushPipe();
        Scheduler.EmitSchedule();

		// Insert separator for boundary
		while (MI != (MachineInstr *)prior(I)) --I;
		MBB->insert(I, BuildMI(Fn, DebugLoc(), TII->get(Lemberg::SEP)));
		NumBundles++;

        Current = MI;
        CurrentCount = Count - 1;
        Scheduler.Observe(MI, CurrentCount);
      }
      I = MI;
      --Count;
    }
    assert(Count == 0 && "Instruction count mismatch!");
    assert((MBB->begin() == Current || CurrentCount != 0) &&
           "Instruction count mismatch!");
	Scheduler.Run(MBB, MBB->begin(), Current, CurrentCount);
	if (Current != MBB->begin())
		HR->AdvanceCycle();
	HR->FlushPipe();
    Scheduler.EmitSchedule();

    // Clean up register live-range state.
    Scheduler.FinishBlock();

    // Update register kills
    Scheduler.FixupKills(MBB);
  }

  return true;
}
