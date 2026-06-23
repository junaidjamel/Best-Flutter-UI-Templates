import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_product_card.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeSpecialCard extends StatelessWidget {
  const CoffeeSpecialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special for you',
            style: GoogleFonts.poppins(
              color: CoffeeShopeColors.whiteClr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          18.vSpace,
          Container(
            height: 130.h,
            decoration: BoxDecoration(
              color: CoffeeShopeColors.cardBlack,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.22),
                  blurRadius: 18.r,
                  offset: Offset(0, 10.h),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(24.r),
                  ),
                  child: SizedBox(
                    width: 165.w,
                    height: double.infinity,
                    child: CustomPaint(
                      painter: const CoffeeThumbnailPainter(
                        accent: Color(0xff6B3E28),
                        isDarkCup: true,
                        compact: true,
                      ),
                    ),
                  ),
                ),
                18.hSpace,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 18.w),
                    child: Text(
                      '5 Coffee Beans You\nMust Try!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: CoffeeShopeColors.whiteClr,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
