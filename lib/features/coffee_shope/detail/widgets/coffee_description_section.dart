import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_product_card.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDescriptionSection extends StatelessWidget {
  const CoffeeDescriptionSection({required this.product, super.key});

  final CoffeeProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: GoogleFonts.poppins(
              color: CoffeeShopeColors.whiteClr,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          18.vSpace,
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                color: CoffeeShopeColors.whiteClr.withValues(alpha: 0.78),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                height: 1.8,
              ),
              children: [
                TextSpan(
                  text:
                      'A ${product.name.toLowerCase()} is a coffee-based drink made primarily from espresso and milk.... ',
                ),
                TextSpan(
                  text: 'Read More',
                  style: GoogleFonts.poppins(
                    color: CoffeeShopeColors.lightOrange,
                    fontWeight: FontWeight.w700,
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
