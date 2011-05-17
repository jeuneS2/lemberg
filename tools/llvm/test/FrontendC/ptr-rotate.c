// RUN: %llvmgcc %s -S -m32 -o /dev/null
// RUN: %llvmgcc %s -S -O1 -m32 -o - | llc -march=x86 -mtriple=i386-apple-darwin9.7 | FileCheck %s -check-prefix=DARWIN

unsigned int func(void *A) {
  // DARWIN: roll $27
  return ((((unsigned long long) A) >> 5) | (((unsigned long long) A) << 27));
}
