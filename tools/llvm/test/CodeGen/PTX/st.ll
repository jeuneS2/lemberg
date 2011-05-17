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


define ptx_device void @t1_u16(i16* %p, i16 %x) {
entry:
;CHECK: st.global.u16 [r1], rh1;
;CHECK-NEXT: ret;
  store i16 %x, i16* %p
  ret void
}

define ptx_device void @t1_u32(i32* %p, i32 %x) {
entry:
;CHECK: st.global.u32 [r1], r2;
;CHECK-NEXT: ret;
  store i32 %x, i32* %p
  ret void
}

define ptx_device void @t1_u64(i64* %p, i64 %x) {
entry:
;CHECK: st.global.u64 [r1], rd1;
;CHECK-NEXT: ret;
  store i64 %x, i64* %p
  ret void
}

define ptx_device void @t1_f32(float* %p, float %x) {
entry:
;CHECK: st.global.f32 [r1], f1;
;CHECK-NEXT: ret;
  store float %x, float* %p
  ret void
}

define ptx_device void @t1_f64(double* %p, double %x) {
entry:
;CHECK: st.global.f64 [r1], fd1;
;CHECK-NEXT: ret;
  store double %x, double* %p
  ret void
}

define ptx_device void @t2_u16(i16* %p, i16 %x) {
entry:
;CHECK: st.global.u16 [r1+2], rh1;
;CHECK-NEXT: ret;
  %i = getelementptr i16* %p, i32 1
  store i16 %x, i16* %i
  ret void
}

define ptx_device void @t2_u32(i32* %p, i32 %x) {
entry:
;CHECK: st.global.u32 [r1+4], r2;
;CHECK-NEXT: ret;
  %i = getelementptr i32* %p, i32 1
  store i32 %x, i32* %i
  ret void
}

define ptx_device void @t2_u64(i64* %p, i64 %x) {
entry:
;CHECK: st.global.u64 [r1+8], rd1;
;CHECK-NEXT: ret;
  %i = getelementptr i64* %p, i32 1
  store i64 %x, i64* %i
  ret void
}

define ptx_device void @t2_f32(float* %p, float %x) {
entry:
;CHECK: st.global.f32 [r1+4], f1;
;CHECK-NEXT: ret;
  %i = getelementptr float* %p, i32 1
  store float %x, float* %i
  ret void
}

define ptx_device void @t2_f64(double* %p, double %x) {
entry:
;CHECK: st.global.f64 [r1+8], fd1;
;CHECK-NEXT: ret;
  %i = getelementptr double* %p, i32 1
  store double %x, double* %i
  ret void
}

define ptx_device void @t3_u16(i16* %p, i32 %q, i16 %x) {
entry:
;CHECK: shl.b32 r0, r2, 1;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: st.global.u16 [r0], rh1;
;CHECK-NEXT: ret;
  %i = getelementptr i16* %p, i32 %q
  store i16 %x, i16* %i
  ret void
}

define ptx_device void @t3_u32(i32* %p, i32 %q, i32 %x) {
entry:
;CHECK: shl.b32 r0, r2, 2;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: st.global.u32 [r0], r3;
;CHECK-NEXT: ret;
  %i = getelementptr i32* %p, i32 %q
  store i32 %x, i32* %i
  ret void
}

define ptx_device void @t3_u64(i64* %p, i32 %q, i64 %x) {
entry:
;CHECK: shl.b32 r0, r2, 3;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: st.global.u64 [r0], rd1;
;CHECK-NEXT: ret;
  %i = getelementptr i64* %p, i32 %q
  store i64 %x, i64* %i
  ret void
}

define ptx_device void @t3_f32(float* %p, i32 %q, float %x) {
entry:
;CHECK: shl.b32 r0, r2, 2;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: st.global.f32 [r0], f1;
;CHECK-NEXT: ret;
  %i = getelementptr float* %p, i32 %q
  store float %x, float* %i
  ret void
}

define ptx_device void @t3_f64(double* %p, i32 %q, double %x) {
entry:
;CHECK: shl.b32 r0, r2, 3;
;CHECK-NEXT: add.u32 r0, r1, r0;
;CHECK-NEXT: st.global.f64 [r0], fd1;
;CHECK-NEXT: ret;
  %i = getelementptr double* %p, i32 %q
  store double %x, double* %i
  ret void
}

define ptx_device void @t4_global_u16(i16 %x) {
entry:
;CHECK: st.global.u16 [array_i16], rh1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16]* @array_i16, i16 0, i16 0
  store i16 %x, i16* %i
  ret void
}

define ptx_device void @t4_global_u32(i32 %x) {
entry:
;CHECK: st.global.u32 [array_i32], r1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32]* @array_i32, i32 0, i32 0
  store i32 %x, i32* %i
  ret void
}

define ptx_device void @t4_global_u64(i64 %x) {
entry:
;CHECK: st.global.u64 [array_i64], rd1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64]* @array_i64, i32 0, i32 0
  store i64 %x, i64* %i
  ret void
}

define ptx_device void @t4_global_f32(float %x) {
entry:
;CHECK: st.global.f32 [array_float], f1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float]* @array_float, i32 0, i32 0
  store float %x, float* %i
  ret void
}

define ptx_device void @t4_global_f64(double %x) {
entry:
;CHECK: st.global.f64 [array_double], fd1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double]* @array_double, i32 0, i32 0
  store double %x, double* %i
  ret void
}

define ptx_device void @t4_local_u16(i16 %x) {
entry:
;CHECK: st.local.u16 [array_local_i16], rh1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16] addrspace(2)* @array_local_i16, i32 0, i32 0
  store i16 %x, i16 addrspace(2)* %i
  ret void
}

define ptx_device void @t4_local_u32(i32 %x) {
entry:
;CHECK: st.local.u32 [array_local_i32], r1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32] addrspace(2)* @array_local_i32, i32 0, i32 0
  store i32 %x, i32 addrspace(2)* %i
  ret void
}

define ptx_device void @t4_local_u64(i64 %x) {
entry:
;CHECK: st.local.u64 [array_local_i64], rd1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64] addrspace(2)* @array_local_i64, i32 0, i32 0
  store i64 %x, i64 addrspace(2)* %i
  ret void
}

define ptx_device void @t4_local_f32(float %x) {
entry:
;CHECK: st.local.f32 [array_local_float], f1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float] addrspace(2)* @array_local_float, i32 0, i32 0
  store float %x, float addrspace(2)* %i
  ret void
}

define ptx_device void @t4_local_f64(double %x) {
entry:
;CHECK: st.local.f64 [array_local_double], fd1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double] addrspace(2)* @array_local_double, i32 0, i32 0
  store double %x, double addrspace(2)* %i
  ret void
}

define ptx_device void @t4_shared_u16(i16 %x) {
entry:
;CHECK: st.shared.u16 [array_shared_i16], rh1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16] addrspace(4)* @array_shared_i16, i32 0, i32 0
  store i16 %x, i16 addrspace(4)* %i
  ret void
}

define ptx_device void @t4_shared_u32(i32 %x) {
entry:
;CHECK: st.shared.u32 [array_shared_i32], r1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32] addrspace(4)* @array_shared_i32, i32 0, i32 0
  store i32 %x, i32 addrspace(4)* %i
  ret void
}

define ptx_device void @t4_shared_u64(i64 %x) {
entry:
;CHECK: st.shared.u64 [array_shared_i64], rd1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64] addrspace(4)* @array_shared_i64, i32 0, i32 0
  store i64 %x, i64 addrspace(4)* %i
  ret void
}

define ptx_device void @t4_shared_f32(float %x) {
entry:
;CHECK: st.shared.f32 [array_shared_float], f1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float] addrspace(4)* @array_shared_float, i32 0, i32 0
  store float %x, float addrspace(4)* %i
  ret void
}

define ptx_device void @t4_shared_f64(double %x) {
entry:
;CHECK: st.shared.f64 [array_shared_double], fd1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double] addrspace(4)* @array_shared_double, i32 0, i32 0
  store double %x, double addrspace(4)* %i
  ret void
}

define ptx_device void @t5_u16(i16 %x) {
entry:
;CHECK: st.global.u16 [array_i16+2], rh1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i16]* @array_i16, i32 0, i32 1
  store i16 %x, i16* %i
  ret void
}

define ptx_device void @t5_u32(i32 %x) {
entry:
;CHECK: st.global.u32 [array_i32+4], r1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i32]* @array_i32, i32 0, i32 1
  store i32 %x, i32* %i
  ret void
}

define ptx_device void @t5_u64(i64 %x) {
entry:
;CHECK: st.global.u64 [array_i64+8], rd1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x i64]* @array_i64, i32 0, i32 1
  store i64 %x, i64* %i
  ret void
}

define ptx_device void @t5_f32(float %x) {
entry:
;CHECK: st.global.f32 [array_float+4], f1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x float]* @array_float, i32 0, i32 1
  store float %x, float* %i
  ret void
}

define ptx_device void @t5_f64(double %x) {
entry:
;CHECK: st.global.f64 [array_double+8], fd1;
;CHECK-NEXT: ret;
  %i = getelementptr [10 x double]* @array_double, i32 0, i32 1
  store double %x, double* %i
  ret void
}
