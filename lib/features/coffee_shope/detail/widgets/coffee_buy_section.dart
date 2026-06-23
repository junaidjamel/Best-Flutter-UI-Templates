import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_product_card.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeBuySection extends StatelessWidget {
  const CoffeeBuySection({required this.product, super.key});

  final CoffeeProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Row(
        children: [
          SizedBox(
            width: 112.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.poppins(
                    color: CoffeeShopeColors.softGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                4.vSpace,
                Row(
                  children: [
                    Text(
                      r'$',
                      style: GoogleFonts.poppins(
                        color: CoffeeShopeColors.lightOrange,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    6.hSpace,
                    Text(
                      product.price,
                      style: GoogleFonts.poppins(
                        color: CoffeeShopeColors.whiteClr,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.hSpace,
          Expanded(
            child: SizedBox(
              height: 62.h,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: CoffeeShopeColors.lightOrange,
                  borderRadius: BorderRadius.circular(22.r),
                  boxShadow: [
                    BoxShadow(
                      color: CoffeeShopeColors.lightOrange.withValues(
                        alpha: 0.22,
                      ),
                      blurRadius: 22.r,
                      offset: Offset(0, 10.h),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.poppins(
                      color: CoffeeShopeColors.whiteClr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
