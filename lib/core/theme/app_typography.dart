import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static final TextStyle displayLarge = GoogleFonts.roboto(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static final TextStyle displayMedium = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.25,
  );

  static final TextStyle username = GoogleFonts.roboto(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  static final TextStyle displayName = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    height: 1.3,
  );

  static final TextStyle timestamp = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.3,
  );

  static final TextStyle label = GoogleFonts.roboto(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.3,
  );

  static final TextStyle buttonPrimary = GoogleFonts.roboto(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.2,
  );

  static final TextStyle buttonSecondary = GoogleFonts.roboto(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.2,
  );

  static final TextStyle inputText = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.5,
  );

  static final TextStyle inputHint = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.5,
  );

  static TextTheme textTheme([TextTheme? base]) {
    return GoogleFonts.robotoTextTheme(base);
  }
}
