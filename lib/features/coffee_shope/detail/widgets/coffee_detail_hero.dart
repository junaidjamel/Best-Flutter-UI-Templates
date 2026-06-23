import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_product_card.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetailHero extends StatelessWidget {
  const CoffeeDetailHero({required this.product, super.key});

  final CoffeeProduct product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.r),
      child: SizedBox(
        height: 400.h,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: CoffeeThumbnailPainter(
                  accent: product.accent,
                  isDarkCup: product.isDarkCup,
                ),
              ),
            ),
            Positioned(
              left: 22.w,
              top: 22.h,
              child: DetailIconButton(
                icon: Icons.chevron_left_rounded,
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              right: 22.w,
              top: 22.h,
              child: const DetailIconButton(icon: Icons.favorite_rounded),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: HeroInfoPanel(product: product),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroInfoPanel extends StatelessWidget {
  const HeroInfoPanel({required this.product, super.key});

  final CoffeeProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(28.w, 10.h, 28.w, 10.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xff4A281F).withValues(alpha: 0.92),
            const Color(0xff281A18).withValues(alpha: 0.96),
          ],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: CoffeeShopeColors.whiteClr,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),
                6.vSpace,
                Text(
                  product.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: CoffeeShopeColors.softGrey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: CoffeeShopeColors.lightOrange,
                    size: 28.sp,
                  ),
                  10.hSpace,
                  Text(
                    product.rating,
                    style: GoogleFonts.poppins(
                      color: CoffeeShopeColors.whiteClr,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  6.hSpace,
                  Text(
                    '(6,986)',
                    style: GoogleFonts.poppins(
                      color: CoffeeShopeColors.softGrey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureChip extends StatelessWidget {
  const FeatureChip({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.r,
      height: 56.r,
      decoration: BoxDecoration(
        color: CoffeeShopeColors.primaryBlack.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: CoffeeShopeColors.lightOrange, size: 22.sp),
          3.vSpace,
          Text(
            label,
            style: GoogleFonts.poppins(
              color: CoffeeShopeColors.softGrey,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailIconButton extends StatelessWidget {
  const DetailIconButton({required this.icon, this.onTap, super.key});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 46.r,
        height: 46.r,
        decoration: BoxDecoration(
          color: CoffeeShopeColors.primaryBlack.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Icon(icon, color: CoffeeShopeColors.whiteClr, size: 28.sp),
      ),
    );
  }
}
