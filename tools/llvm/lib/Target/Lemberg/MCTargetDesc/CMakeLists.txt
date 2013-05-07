add_llvm_library(LLVMLembergDesc
  LembergMCTargetDesc.cpp
  LembergMCAsmInfo.cpp
  )

add_dependencies(LLVMLembergDesc LembergCommonTableGen)
