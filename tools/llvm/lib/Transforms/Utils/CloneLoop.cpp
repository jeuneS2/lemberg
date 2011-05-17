//===- CloneLoop.cpp - Clone loop nest ------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the CloneLoop interface which makes a copy of a loop.
//
//===----------------------------------------------------------------------===//

#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/BasicBlock.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/Dominators.h"


using namespace llvm;

/// CloneDominatorInfo - Clone a basic block's dominator tree. It is expected
/// that the basic block is already cloned.
static void CloneDominatorInfo(BasicBlock *BB, 
                               ValueToValueMapTy &VMap,
                               DominatorTree *DT) {

  assert (DT && "DominatorTree is not available");
  ValueToValueMapTy::iterator BI = VMap.find(BB);
  assert (BI != VMap.end() && "BasicBlock clone is missing");
  BasicBlock *NewBB = cast<BasicBlock>(BI->second);

  // NewBB already got dominator info.
  if (DT->getNode(NewBB))
    return;

  assert (DT->getNode(BB) && "BasicBlock does not have dominator info");
  // Entry block is not expected here. Infinite loops are not to cloned.
  assert (DT->getNode(BB)->getIDom() && "BasicBlock does not have immediate dominator");
  BasicBlock *BBDom = DT->getNode(BB)->getIDom()->getBlock();

  // NewBB's dominator is either BB's dominator or BB's dominator's clone.
  BasicBlock *NewBBDom = BBDom;
  ValueToValueMapTy::iterator BBDomI = VMap.find(BBDom);
  if (BBDomI != VMap.end()) {
    NewBBDom = cast<BasicBlock>(BBDomI->second);
    if (!DT->getNode(NewBBDom))
      CloneDominatorInfo(BBDom, VMap, DT);
  }
  DT->addNewBlock(NewBB, NewBBDom);
}

/// CloneLoop - Clone Loop. Clone dominator info. Populate VMap
/// using old blocks to new blocks mapping.
Loop *llvm::CloneLoop(Loop *OrigL, LPPassManager  *LPM, LoopInfo *LI,
                      ValueToValueMapTy &VMap, Pass *P) {
  
  DominatorTree *DT = NULL;
  if (P)
    DT = P->getAnalysisIfAvailable<DominatorTree>();

  SmallVector<BasicBlock *, 16> NewBlocks;

  // Populate loop nest.
  SmallVector<Loop *, 8> LoopNest;
  LoopNest.push_back(OrigL);


  Loop *NewParentLoop = NULL;
  do {
    Loop *L = LoopNest.pop_back_val();
    Loop *NewLoop = new Loop();

    if (!NewParentLoop)
      NewParentLoop = NewLoop;

    LPM->insertLoop(NewLoop, L->getParentLoop());

    // Clone Basic Blocks.
    for (Loop::block_iterator I = L->block_begin(), E = L->block_end();
         I != E; ++I) {
      BasicBlock *BB = *I;
      BasicBlock *NewBB = CloneBasicBlock(BB, VMap, ".clone");
      VMap[BB] = NewBB;
      if (P)
        LPM->cloneBasicBlockSimpleAnalysis(BB, NewBB, L);
      NewLoop->addBasicBlockToLoop(NewBB, LI->getBase());
      NewBlocks.push_back(NewBB);
    }

    // Clone dominator info.
    if (DT)
      for (Loop::block_iterator I = L->block_begin(), E = L->block_end();
           I != E; ++I) {
        BasicBlock *BB = *I;
        CloneDominatorInfo(BB, VMap, DT);
      }

    // Process sub loops
    for (Loop::iterator I = L->begin(), E = L->end(); I != E; ++I)
      LoopNest.push_back(*I);
  } while (!LoopNest.empty());

  // Remap instructions to reference operands from VMap.
  for(SmallVector<BasicBlock *, 16>::iterator NBItr = NewBlocks.begin(), 
        NBE = NewBlocks.end();  NBItr != NBE; ++NBItr) {
    BasicBlock *NB = *NBItr;
    for(BasicBlock::iterator BI = NB->begin(), BE = NB->end(); 
        BI != BE; ++BI) {
      Instruction *Insn = BI;
      for (unsigned index = 0, num_ops = Insn->getNumOperands(); 
           index != num_ops; ++index) {
        Value *Op = Insn->getOperand(index);
        ValueToValueMapTy::iterator OpItr = VMap.find(Op);
        if (OpItr != VMap.end())
          Insn->setOperand(index, OpItr->second);
      }
    }
  }

  BasicBlock *Latch = OrigL->getLoopLatch();
  Function *F = Latch->getParent();
  F->getBasicBlockList().insert(OrigL->getHeader(), 
                                NewBlocks.begin(), NewBlocks.end());


  return NewParentLoop;
}
