target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

declare i64 @__divdi3(i64 %a, i64 %b) nounwind
declare i64 @__moddi3(i64 %a, i64 %b) nounwind
declare i32 @__modsi3(i32 %a, i32 %b) nounwind
declare i64 @__udivdi3(i64 %a, i64 %b) nounwind
declare i32 @__udivsi3(i32 %n, i32 %d) nounwind readnone
declare i64 @__umoddi3(i64 %a, i64 %b) nounwind
declare i32 @__umodsi3(i32 %a, i32 %b) nounwind
declare i64 @__ashldi3(i64 %a, i32 %b) nounwind readnone
declare i64 @__ashrdi3(i64 %a, i32 %b) nounwind readnone
declare i64 @__lshrdi3(i64 %a, i32 %b) nounwind readnone
declare i64 @__muldi3(i64 %a, i64 %b) nounwind readnone
	
declare i8* @memcpy(i8* %dst, i8* %src, i32 %len) nounwind
declare i8* @memmove(i8* %dst, i8* %src, i32 %len) nounwind
declare i8* @memset(i8* %m, i32 %c, i32 %n) nounwind

declare void @abort() noreturn nounwind

declare double @__adddf3(double %a, double %b) nounwind readnone
declare double @__subdf3(double %a, double %b) nounwind readnone
declare double @__muldf3(double %a, double %b) nounwind readnone
declare double @__divdf3(double %a, double %b) nounwind readnone

declare float @__addsf3(float %a, float %b) nounwind readnone
declare float @__subsf3(float %a, float %b) nounwind readnone
declare float @__mulsf3(float %a, float %b) nounwind readnone
declare float @__divsf3(float %a, float %b) nounwind readnone

declare double @__floatsidf(i32 %a)   nounwind readnone
declare double @__floatunsidf(i32 %a) nounwind readnone
declare i32 @__fixdfsi(double %a)    nounwind readnone
declare i32 @__fixunsdfsi(double %a) nounwind readnone

declare i32 @__eqdf2(double %a, double %b) nounwind readnone
declare i32 @__gedf2(double %a, double %b) nounwind readnone
declare i32 @__gtdf2(double %a, double %b) nounwind readnone
declare i32 @__ledf2(double %a, double %b) nounwind readnone
declare i32 @__ltdf2(double %a, double %b) nounwind readnone
declare i32 @__nedf2(double %a, double %b) nounwind readnone
declare i32 @__unorddf2(double %a, double %b) nounwind readnone
