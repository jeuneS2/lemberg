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
BUILT_SOURCES = LembergGenRegisterInfo.inc \
                LembergGenInstrInfo.inc \
				LembergGenAsmWriter.inc \
                LembergGenDAGISel.inc \
				LembergGenSubtargetInfo.inc \
                LembergGenCallingConv.inc

DIRS = TargetInfo MCTargetDesc

include $(LEVEL)/Makefile.common

