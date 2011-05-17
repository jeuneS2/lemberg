// RUN: llvm-mc -filetype=obj -triple x86_64-pc-linux-gnu %s -o - | elf-dump  | FileCheck %s

// When doing a rename, all the checks for where the relocation should go
// should be performed with the original symbol. Only if we decide to relocate
// with the symbol we should then use the renamed one.

// This is a regression test for a bug where we used bar5@@@zed when deciding
// if we should relocate with the symbol or with the section and we would then
// not produce a relocation with .text.

defined1:
defined3:
        .symver defined3, bar5@@@zed
        .long defined3

        .global defined1

// Section 1 is .text
// CHECK:      # Section 0x00000001
// CHECK-NEXT: (('sh_name', 0x00000001) # '.text'
// CHECK-NEXT:  ('sh_type', 0x00000001)
// CHECK-NEXT:  ('sh_flags', 0x00000006)
// CHECK-NEXT:  ('sh_addr', 0x00000000)
// CHECK-NEXT:  ('sh_offset', 0x00000040)
// CHECK-NEXT:  ('sh_size', 0x00000004)
// CHECK-NEXT:  ('sh_link', 0x00000000)
// CHECK-NEXT:  ('sh_info', 0x00000000)
// CHECK-NEXT:  ('sh_addralign', 0x00000004)
// CHECK-NEXT:  ('sh_entsize', 0x00000000)

// Symbol 2 is section 1
// CHECK:      # Symbol 0x00000002
// CHECK-NEXT: (('st_name', 0x00000000) # ''
// CHECK-NEXT:  ('st_bind', 0x00000000)
// CHECK-NEXT:  ('st_type', 0x00000003)
// CHECK-NEXT:  ('st_other', 0x00000000)
// CHECK-NEXT:  ('st_shndx', 0x00000001)
// CHECK-NEXT:  ('st_value', 0x0000000000000000)
// CHECK-NEXT:  ('st_size', 0x0000000000000000)

// The relocation uses symbol 2
// CHECK:      # Relocation 0x00000000
// CHECK-NEXT: (('r_offset', 0x00000000)
// CHECK-NEXT:  ('r_sym', 0x00000002)
// CHECK-NEXT:  ('r_type', 0x0000000a)
// CHECK-NEXT:  ('r_addend', 0x00000000)
