##===- lib/Target/Lemberg/Makefile -------------------------*- Makefile -*-===##
#
#                     The LLVM Compiler Infrastructure
#
# This file is distributed under the University of Illinois Open Source
# License. See LICENSE.TXT for details.
#
##===----------------------------------------------------------------------===##

LEVEL = ../../..
LIBRARYNAME = LLVMLembergCodeGen
TARGET = Lemberg

# Make sure that tblgen is run, first thing.
BUILT_SOURCES = LembergGenRegisterInfo.h.inc LembergGenRegisterNames.inc \
                LembergGenRegisterInfo.inc LembergGenInstrNames.inc \
                LembergGenInstrInfo.inc LembergGenAsmWriter.inc \
                LembergGenDAGISel.inc LembergGenSubtarget.inc \
                LembergGenCodeEmitter.inc LembergGenCallingConv.inc \
				LembergGenEDInfo.inc \
                LembergGenFastISel.inc LembergGenMCCodeEmitter.inc

DIRS = TargetInfo

include $(LEVEL)/Makefile.common

