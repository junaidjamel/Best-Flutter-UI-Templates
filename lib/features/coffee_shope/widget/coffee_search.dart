import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeSearchWidget extends StatelessWidget {
  const CoffeeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.vSpace,
          Text(
            "Find the best\ncoffee for you",
            style: GoogleFonts.poppins(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
              color: CoffeeShopeColors.whiteClr,
            ),
          ),
          20.vSpace,

          // Search Field
          TextField(
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.sp),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: "Find Your Coffee ...",
              hintStyle: GoogleFonts.poppins(
                color: CoffeeShopeColors.whiteClr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: CoffeeShopeColors.whiteClr,
                size: 22.sp,
              ),
              filled: true,
              fillColor: const Color(0xff141921),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 16.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(
                  color: const Color(0xff2A2F38),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
