//==- LembergFrameLowering.h - Define frame lowering for Lemberg --*- C++ -*--=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//
//===----------------------------------------------------------------------===//

#ifndef LEMBERG_FRAMEINFO_H
#define LEMBERG_FRAMEINFO_H

#include "Lemberg.h"
#include "LembergSubtarget.h"
#include "llvm/Target/TargetFrameLowering.h"

namespace llvm {
	class LembergSubtarget;

	class LembergFrameLowering : public TargetFrameLowering {
		const LembergTargetMachine &TM;
		const LembergSubtarget &ST;
	public:
		explicit LembergFrameLowering(const LembergTargetMachine &tm, const LembergSubtarget &st)
			: TargetFrameLowering(TargetFrameLowering::StackGrowsDown, 8, 0),
			  TM(tm), ST(st) {
		}

		/// emitProlog/emitEpilog - These methods insert prolog and epilog code into
		/// the function.
		void emitPrologue(MachineFunction &MF) const;
		void emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const;

		bool hasFP(const MachineFunction &MF) const;

		void processFunctionBeforeCalleeSavedScan(MachineFunction &MF,
												  RegScavenger *RS) const;

		void BuildStackAdd(MachineFunction &MF,
						   MachineBasicBlock &MBB,
						   MachineBasicBlock::iterator &MBBI,
						   long Offset) const;

	private:		
		void BuildStackLoad(MachineFunction &MF,
							MachineBasicBlock &MBB,
							MachineBasicBlock::iterator &MBBI,
							unsigned DestReg, long Offset) const;
		void BuildStackStore(MachineFunction &MF,
							 MachineBasicBlock &MBB,
							 MachineBasicBlock::iterator &MBBI,
							 unsigned DestReg, long Offset) const;
		void BuildStackWriteBack(MachineFunction &MF,
								 MachineBasicBlock &MBB,
								 MachineBasicBlock::iterator &MBBI,
								 long Offset) const;
	};

} // End llvm namespace

#endif
