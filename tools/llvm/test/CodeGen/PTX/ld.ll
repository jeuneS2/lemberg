; RUN: llc < %s -march=ptx | FileCheck %s

;CHECK: .extern .global .u16 array_i16[];
@array_i16 = external global [10 x i16]

;CHECK: .extern .const .u16 array_constant_i16[];
@array_constant_i16 = external addrspace(1) constant [10 x i16]

;CHECK: .extern .local .u16 array_local_i16[];
@array_local_i16 = external addrspace(2) global [10 x i16]

;CHECK: .extern .shared .u16 array_shared_i16[];
@array_shared_i16 = external addrspace(4) global [10 x i16]

;CHECK: .extern .global .u32 array_i32[];
@array_i32 = external global [10 x i32]

;CHECK: .extern .const .u32 array_constant_i32[];
@array_constant_i32 = external addrspace(1) constant [10 x i32]

;CHECK: .extern .local .u32 array_local_i32[];
@array_local_i32 = external addrspace(2) global [10 x i32]

;CHECK: .extern .shared .u32 array_shared_i32[];
@array_shared_i32 = external addrspace(4) global [10 x i32]

;CHECK: .extern .global .u64 array_i64[];
@array_i64 = external global [10 x i64]

;CHECK: .extern .const .u64 array_constant_i64[];
@array_constant_i64 = external addrspace(1) constant [10 x i64]

;CHECK: .extern .local .u64 array_local_i64[];
@array_local_i64 = external addrspace(2) global [10 x i64]

;CHECK: .extern .shared .u64 array_shared_i64[];
@array_shared_i64 = external addrspace(4) global [10 x i64]

;CHECK: .extern .global .f32 array_float[];
@array_float = external global [10 x float]

;CHECK: .extern .const .f32 array_constant_float[];
@array_constant_float = external addrspace(1) constant [10 x float]

;CHECK: .extern .local .f32 array_local_float[];
@array_local_float = external addrspace(2) global [10 x float]

;CHECK: .extern .shared .f32 array_shared_float[];
@array_shared_float = external addrspace(4) global [10 x float]

;CHECK: .extern .global .f64 array_double[];
@array_double = external global [10 x double]

;CHECK: .extern .const .f64 array_constant_double[];
@array_constant_double = external addrspace(1) constant [10 x double]

;CHECK: .extern .local .f64 array_local_double[];
@array_local_double = external addrspace(2) global [10 x double]

;CHECK: .extern .shared .f64 array_shared_double[];
@array_shared_double = external addrspace(4) global [10 x double]


define ptx_device i16 @t1_u16(i16* %p) {
entry:
;CHECK: ld.global.u16 rh0, [r1];
;CHECK-NEXT; ret;
  %x = load i16* %p
  ret i16 %x
}

define ptx_device i32 @t1_u32(i32* %p) {
entry:
;CHECK: ld.global.u32 r0, [r1];
;CHECK-NEXT: ret;
  %x = load i32* %p
  ret i32 %x
}

define ptx_device i64 @t1_u64(i64* %p) {
entry:
;CHECK: ld.global.u64 rd0, [r1];
;CHECK-NEXT: ret;
  %x = load i64* %p
  ret i64 %x
}

define ptx_device float @t1_f32(float* %p) {
entry:
;CHECK: ld.global.f32 f0, [r1];
;CHECK-NEXT: ret;
  %x = load float* %p
  ret float %x
}

define ptx_device double @t1_f64(double* %p) {
entry:
;CHECK: ld.global.f64 fd0, [r1];
;CHECK-NEXT: ret;
  %x = load double* %p
  ret double %x
}

define ptx_device i16 @t2_u16(i16* %p) {
entry:
;CHECK: ld.global.u16 rh0, [r1+2];
;CHECK-NEXT: ret;
  %i = getelementptr i16* %p, i32 1
  %x = load i16* %i
  ret i16 %x
}

define ptx_device i32 @t2_u32(i32* %p) {
entry:
;CHECK: ld.global.u32 r0, [r1+4];
;CHECK-NEXT: ret;
  %i = getelementptr i32* %p, i32 1
  %x = load i32* %i
  ret i32 %x
}

define ptx_device i64 @t2_u64(i64* %p) {
entry:
;CHECK: ld.global.u64 rd0, [r1+8];
;CHECK-NEXT: ret;
  %i = getelementptr i64* %p, i32 1
  %x = load i64* %i
  ret i64 %x
}

define ptx_device float @t2_f32(float* %p) {
entry:
;CHECK: ld.global.f32 f0, [r1+4];
;CHECK-NEXT: ret;
  %i = getelementptr float* %p, i32 1
  %x = load float* %i
  ret float %x
}

define ptx_device double @t2_f64(double* %p) {
entry:
;CHECK: ld.global.f64 fd0, [r1+8];
;CHECK-NEXT: ret;
  %i = getelementptr double* %p, i32 1
  %x = load double* %i
  ret double %x
}

define ptx_device i16 @t3_u16(i16* %p, i32 %q) {
entry:
;CHECK: shl.b32 r0, r2, 1;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: ld.global.u16 rh0, [r0];
  %i = getelementptr i16* %p, i32 %q
  %x = load i16* %i
  ret i16 %x
}

define ptx_device i32 @t3_u32(i32* %p, i32 %q) {
entry:
;CHECK: shl.b32 r0, r2, 2;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: ld.global.u32 r0, [r0];
  %i = getelementptr i32* %p, i32 %q
  %x = load i32* %i
  ret i32 %x
}

define ptx_device i64 @t3_u64(i64* %p, i32 %q) {
entry:
;CHECK: shl.b32 r0, r2, 3;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: ld.global.u64 rd0, [r0];
  %i = getelementptr i64* %p, i32 %q
  %x = load i64* %i
  ret i64 %x
}

define ptx_device float @t3_f32(float* %p, i32 %q) {
entry:
;CHECK: shl.b32 r0, r2, 2;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: ld.global.f32 f0, [r0];
  %i = getelementptr float* %p, i32 %q
  %x = load float* %i
  ret float %x
}

define ptx_device double @t3_f64(double* %p, i32 %q) {
entry:
;CHECK: shl.b32 r0, r2, 3;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: ld.global.f64 fd0, [r0];
  %i = getelementptr double* %p, i32 %q
  %x = load double* %i
  ret double %x
}

define ptx_device i16 @t4_global_u16() {
entry:
;CHECK: ld.global.u16 rh0, [array_i16];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16]* @array_i16, i32 0, i32 0
  %x = load i16* %i
  ret i16 %x
}

define ptx_device i32 @t4_global_u32() {
entry:
;CHECK: ld.global.u32 r0, [array_i32];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32]* @array_i32, i32 0, i32 0
  %x = load i32* %i
  ret i32 %x
}

define ptx_device i64 @t4_global_u64() {
entry:
;CHECK: ld.global.u64 rd0, [array_i64];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64]* @array_i64, i32 0, i32 0
  %x = load i64* %i
  ret i64 %x
}

define ptx_device float @t4_global_f32() {
entry:
;CHECK: ld.global.f32 f0, [array_float];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float]* @array_float, i32 0, i32 0
  %x = load float* %i
  ret float %x
}

define ptx_device double @t4_global_f64() {
entry:
;CHECK: ld.global.f64 fd0, [array_double];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double]* @array_double, i32 0, i32 0
  %x = load double* %i
  ret double %x
}

define ptx_device i16 @t4_const_u16() {
entry:
;CHECK: ld.const.u16 rh0, [array_constant_i16];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16] addrspace(1)* @array_constant_i16, i32 0, i32 0
  %x = load i16 addrspace(1)* %i
  ret i16 %x
}

define ptx_device i32 @t4_const_u32() {
entry:
;CHECK: ld.const.u32 r0, [array_constant_i32];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32] addrspace(1)* @array_constant_i32, i32 0, i32 0
  %x = load i32 addrspace(1)* %i
  ret i32 %x
}

define ptx_device i64 @t4_const_u64() {
entry:
;CHECK: ld.const.u64 rd0, [array_constant_i64];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64] addrspace(1)* @array_constant_i64, i32 0, i32 0
  %x = load i64 addrspace(1)* %i
  ret i64 %x
}

define ptx_device float @t4_const_f32() {
entry:
;CHECK: ld.const.f32 f0, [array_constant_float];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float] addrspace(1)* @array_constant_float, i32 0, i32 0
  %x = load float addrspace(1)* %i
  ret float %x
}

define ptx_device double @t4_const_f64() {
entry:
;CHECK: ld.const.f64 fd0, [array_constant_double];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double] addrspace(1)* @array_constant_double, i32 0, i32 0
  %x = load double addrspace(1)* %i
  ret double %x
}

define ptx_device i16 @t4_local_u16() {
entry:
;CHECK: ld.local.u16 rh0, [array_local_i16];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16] addrspace(2)* @array_local_i16, i32 0, i32 0
  %x = load i16 addrspace(2)* %i
  ret i16 %x
}

define ptx_device i32 @t4_local_u32() {
entry:
;CHECK: ld.local.u32 r0, [array_local_i32];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32] addrspace(2)* @array_local_i32, i32 0, i32 0
  %x = load i32 addrspace(2)* %i
  ret i32 %x
}

define ptx_device i64 @t4_local_u64() {
entry:
;CHECK: ld.local.u64 rd0, [array_local_i64];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64] addrspace(2)* @array_local_i64, i32 0, i32 0
  %x = load i64 addrspace(2)* %i
  ret i64 %x
}

define ptx_device float @t4_local_f32() {
entry:
;CHECK: ld.local.f32 f0, [array_local_float];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float] addrspace(2)* @array_local_float, i32 0, i32 0
  %x = load float addrspace(2)* %i
  ret float %x
}

define ptx_device double @t4_local_f64() {
entry:
;CHECK: ld.local.f64 fd0, [array_local_double];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double] addrspace(2)* @array_local_double, i32 0, i32 0
  %x = load double addrspace(2)* %i
  ret double %x
}

define ptx_device i16 @t4_shared_u16() {
entry:
;CHECK: ld.shared.u16 rh0, [array_shared_i16];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16] addrspace(4)* @array_shared_i16, i32 0, i32 0
  %x = load i16 addrspace(4)* %i
  ret i16 %x
}

define ptx_device i32 @t4_shared_u32() {
entry:
;CHECK: ld.shared.u32 r0, [array_shared_i32];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32] addrspace(4)* @array_shared_i32, i32 0, i32 0
  %x = load i32 addrspace(4)* %i
  ret i32 %x
}

define ptx_device i64 @t4_shared_u64() {
entry:
;CHECK: ld.shared.u64 rd0, [array_shared_i64];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64] addrspace(4)* @array_shared_i64, i32 0, i32 0
  %x = load i64 addrspace(4)* %i
  ret i64 %x
}

define ptx_device float @t4_shared_f32() {
entry:
;CHECK: ld.shared.f32 f0, [array_shared_float];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float] addrspace(4)* @array_shared_float, i32 0, i32 0
  %x = load float addrspace(4)* %i
  ret float %x
}

define ptx_device double @t4_shared_f64() {
entry:
;CHECK: ld.shared.f64 fd0, [array_shared_double];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double] addrspace(4)* @array_shared_double, i32 0, i32 0
  %x = load double addrspace(4)* %i
  ret double %x
}

define ptx_device i16 @t5_u16() {
entry:
;CHECK: ld.global.u16 rh0, [array_i16+2];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16]* @array_i16, i32 0, i32 1
  %x = load i16* %i
  ret i16 %x
}

define ptx_device i32 @t5_u32() {
entry:
;CHECK: ld.global.u32 r0, [array_i32+4];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32]* @array_i32, i32 0, i32 1
  %x = load i32* %i
  ret i32 %x
}

define ptx_device i64 @t5_u64() {
entry:
;CHECK: ld.global.u64 rd0, [array_i64+8];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64]* @array_i64, i32 0, i32 1
  %x = load i64* %i
  ret i64 %x
}

define ptx_device float @t5_f32() {
entry:
;CHECK: ld.global.f32 f0, [array_float+4];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float]* @array_float, i32 0, i32 1
  %x = load float* %i
  ret float %x
}

define ptx_device double @t5_f64() {
entry:
;CHECK: ld.global.f64 fd0, [array_double+8];
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double]* @array_double, i32 0, i32 1
  %x = load double* %i
  ret double %x
}
