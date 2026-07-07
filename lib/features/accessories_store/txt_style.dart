import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle headingStyle(BuildContext context) {
  // double screenWidth = MediaQuery.of(context).size.width;
  return GoogleFonts.kanit(
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
    color: Colors.black,
  );
}

TextStyle titleStyle(BuildContext context) {
  return GoogleFonts.lora(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}

TextStyle subtitleStyle(BuildContext context) {
  return TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
}
