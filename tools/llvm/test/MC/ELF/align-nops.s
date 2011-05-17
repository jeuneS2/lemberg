// RUN: llvm-mc -filetype=obj -triple x86_64-pc-linux-gnu %s -o - | elf-dump --dump-section-data | FileCheck %s

// Test that we get optimal nops in text
    .text
f0:
    .long 0
    .align  8, 0x00000090
    .long 0
    .align  8

// But not in another section
    .data
    .long 0
    .align  8, 0x00000090
    .long 0
    .align  8

// CHECK: (('sh_name', 0x00000001) # '.text'
// CHECK-NEXT:  ('sh_type', 0x00000001)
// CHECK-NEXT:  ('sh_flags', 0x00000006)
// CHECK-NEXT:  ('sh_addr',
// CHECK-NEXT:  ('sh_offset',
// CHECK-NEXT:  ('sh_size', 0x00000010)
// CHECK-NEXT:  ('sh_link', 0x00000000)
// CHECK-NEXT:  ('sh_info', 0x00000000)
// CHECK-NEXT:  ('sh_addralign', 0x00000008)
// CHECK-NEXT:  ('sh_entsize', 0x00000000)
// CHECK-NEXT:  ('_section_data', '00000000 0f1f4000 00000000 0f1f4000')

// CHECK: (('sh_name', 0x00000007) # '.data'
// CHECK-NEXT:  ('sh_type', 0x00000001)
// CHECK-NEXT:  ('sh_flags', 0x00000003)
// CHECK-NEXT:  ('sh_addr',
// CHECK-NEXT:  ('sh_offset',
// CHECK-NEXT:  ('sh_size', 0x00000010)
// CHECK-NEXT:  ('sh_link', 0x00000000)
// CHECK-NEXT:  ('sh_info', 0x00000000)
// CHECK-NEXT:  ('sh_addralign', 0x00000008)
// CHECK-NEXT:  ('sh_entsize', 0x00000000)
// CHECK-NEXT:  ('_section_data', '00000000 90909090 00000000 00000000')
