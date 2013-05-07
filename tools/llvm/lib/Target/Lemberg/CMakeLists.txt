set(LLVM_TARGET_DEFINITIONS Lemberg.td)

tablegen(LLVM LembergGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM LembergGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM LembergGenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM LembergGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM LembergGenSubtargetInfo.inc -gen-subtarget)
tablegen(LLVM LembergGenCallingConv.inc -gen-callingconv)
add_public_tablegen_target(LembergCommonTableGen)

add_llvm_target(LembergCodeGen
  LembergAsmPrinter.cpp
  LembergCallingConvLower.cpp
  LembergFrameLowering.cpp
  LembergMCInstLower.cpp
  LembergInstrInfo.cpp
  LembergISelDAGToDAG.cpp
  LembergISelLowering.cpp
  LembergRegisterInfo.cpp
  LembergSelectionDAGInfo.cpp
  LembergSubtarget.cpp
  LembergTargetMachine.cpp
  LembergTargetObjectFile.cpp
)

add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)
