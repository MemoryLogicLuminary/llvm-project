; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

define float @ldexp_zext_float(float %x, i1 %bool) {
; CHECK-LABEL: @ldexp_zext_float(
; CHECK-NEXT:    [[TMP1:%.*]] = select i1 [[BOOL:%.*]], float 2.000000e+00, float 1.000000e+00
; CHECK-NEXT:    [[LDEXP:%.*]] = fmul float [[X:%.*]], [[TMP1]]
; CHECK-NEXT:    ret float [[LDEXP]]
;
  %zext = zext i1 %bool to i32
  %ldexp = call float @llvm.ldexp.f32.i32(float %x, i32 %zext)
  ret float %ldexp
}

define float @ldexp_zext_float_negative(float %x, i8 %y) {
; CHECK-LABEL: @ldexp_zext_float_negative(
; CHECK-NEXT:    [[ZEXT:%.*]] = zext i8 [[Y:%.*]] to i32
; CHECK-NEXT:    [[LDEXP:%.*]] = call float @llvm.ldexp.f32.i32(float [[X:%.*]], i32 [[ZEXT]])
; CHECK-NEXT:    ret float [[LDEXP]]
;
  %zext = zext i8 %y to i32
  %ldexp = call float @llvm.ldexp.f32.i32(float %x, i32 %zext)
  ret float %ldexp
}

define double @ldexp_zext_double(double %x, i1 %bool) {
; CHECK-LABEL: @ldexp_zext_double(
; CHECK-NEXT:    [[TMP1:%.*]] = select i1 [[BOOL:%.*]], double 2.000000e+00, double 1.000000e+00
; CHECK-NEXT:    [[LDEXP:%.*]] = fmul double [[X:%.*]], [[TMP1]]
; CHECK-NEXT:    ret double [[LDEXP]]
;
  %zext = zext i1 %bool to i32
  %ldexp = call double @llvm.ldexp.f64.i32(double %x, i32 %zext)
  ret double %ldexp
}

define double @ldexp_zext_double_fast_math(double %x, i1 %bool) {
; CHECK-LABEL: @ldexp_zext_double_fast_math(
; CHECK-NEXT:    [[TMP1:%.*]] = select i1 [[BOOL:%.*]], double 2.000000e+00, double 1.000000e+00
; CHECK-NEXT:    [[LDEXP:%.*]] = fmul reassoc double [[X:%.*]], [[TMP1]]
; CHECK-NEXT:    ret double [[LDEXP]]
;
  %zext = zext i1 %bool to i32
  %ldexp = call reassoc double @llvm.ldexp.f64.i32(double %x, i32 %zext)
  ret double %ldexp
}

define <2 x float> @ldexp_zext_float_vector(<2 x float> %x, <2 x i1> %bool) {
; CHECK-LABEL: @ldexp_zext_float_vector(
; CHECK-NEXT:    [[TMP1:%.*]] = select <2 x i1> [[BOOL:%.*]], <2 x float> splat (float 2.000000e+00), <2 x float> splat (float 1.000000e+00)
; CHECK-NEXT:    [[LDEXP:%.*]] = fmul <2 x float> [[X:%.*]], [[TMP1]]
; CHECK-NEXT:    ret <2 x float> [[LDEXP]]
;
  %zext = zext <2 x i1> %bool to <2 x i32>
  %ldexp = call <2 x float> @llvm.ldexp.v2f32.v2i32(<2 x float> %x, <2 x i32> %zext)
  ret <2 x float> %ldexp
}

define float @ldexp_sext_float(float %x, i1 %bool) {
; CHECK-LABEL: @ldexp_sext_float(
; CHECK-NEXT:    [[TMP1:%.*]] = select i1 [[BOOL:%.*]], float 5.000000e-01, float 1.000000e+00
; CHECK-NEXT:    [[LDEXP:%.*]] = fmul float [[X:%.*]], [[TMP1]]
; CHECK-NEXT:    ret float [[LDEXP]]
;
  %sext = sext i1 %bool to i32
  %ldexp = call float @llvm.ldexp.f32.i32(float %x, i32 %sext)
  ret float %ldexp
}

define float @ldexp_sext_float_negative(float %x, i8 %y) {
; CHECK-LABEL: @ldexp_sext_float_negative(
; CHECK-NEXT:    [[SEXT:%.*]] = sext i8 [[Y:%.*]] to i32
; CHECK-NEXT:    [[LDEXP:%.*]] = call float @llvm.ldexp.f32.i32(float [[X:%.*]], i32 [[SEXT]])
; CHECK-NEXT:    ret float [[LDEXP]]
;
  %sext = sext i8 %y to i32
  %ldexp = call float @llvm.ldexp.f32.i32(float %x, i32 %sext)
  ret float %ldexp
}

define double @ldexp_sext_double(double %x, i1 %bool) {
; CHECK-LABEL: @ldexp_sext_double(
; CHECK-NEXT:    [[TMP1:%.*]] = select i1 [[BOOL:%.*]], double 5.000000e-01, double 1.000000e+00
; CHECK-NEXT:    [[LDEXP:%.*]] = fmul double [[X:%.*]], [[TMP1]]
; CHECK-NEXT:    ret double [[LDEXP]]
;
  %sext = sext i1 %bool to i32
  %ldexp = call double @llvm.ldexp.f64.i32(double %x, i32 %sext)
  ret double %ldexp
}

define double @ldexp_sext_double_fast_math(double %x, i1 %bool) {
; CHECK-LABEL: @ldexp_sext_double_fast_math(
; CHECK-NEXT:    [[TMP1:%.*]] = select i1 [[BOOL:%.*]], double 5.000000e-01, double 1.000000e+00
; CHECK-NEXT:    [[LDEXP:%.*]] = fmul reassoc double [[X:%.*]], [[TMP1]]
; CHECK-NEXT:    ret double [[LDEXP]]
;
  %sext = sext i1 %bool to i32
  %ldexp = call reassoc double @llvm.ldexp.f64.i32(double %x, i32 %sext)
  ret double %ldexp
}

define <2 x float> @ldexp_sext_float_vector(<2 x float> %x, <2 x i1> %bool) {
; CHECK-LABEL: @ldexp_sext_float_vector(
; CHECK-NEXT:    [[TMP1:%.*]] = select <2 x i1> [[BOOL:%.*]], <2 x float> splat (float 5.000000e-01), <2 x float> splat (float 1.000000e+00)
; CHECK-NEXT:    [[LDEXP:%.*]] = fmul <2 x float> [[X:%.*]], [[TMP1]]
; CHECK-NEXT:    ret <2 x float> [[LDEXP]]
;
  %sext = sext <2 x i1> %bool to <2 x i32>
  %ldexp = call <2 x float> @llvm.ldexp.v2f32.v2i32(<2 x float> %x, <2 x i32> %sext)
  ret <2 x float> %ldexp
}
