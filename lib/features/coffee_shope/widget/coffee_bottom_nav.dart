import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';

class CoffeeBottomNav extends StatelessWidget {
  const CoffeeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      decoration: BoxDecoration(
        color: CoffeeShopeColors.cardBlack.withValues(alpha: 0.96),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.34),
            blurRadius: 20.r,
            offset: Offset(0, -8.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _CoffeeNavIcon(icon: Icons.home_rounded, isSelected: true),
            _CoffeeNavIcon(icon: CupertinoIcons.bag_fill),
            _CoffeeNavIcon(icon: CupertinoIcons.heart_fill),
            _CoffeeNavIcon(icon: CupertinoIcons.bell_fill, showBadge: true),
          ],
        ),
      ),
    );
  }
}

class _CoffeeNavIcon extends StatelessWidget {
  const _CoffeeNavIcon({
    required this.icon,
    this.isSelected = false,
    this.showBadge = false,
  });

  final IconData icon;
  final bool isSelected;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          icon,
          color: isSelected
              ? CoffeeShopeColors.lightOrange
              : CoffeeShopeColors.greyClr,
          size: 28.sp,
        ),
        if (showBadge)
          Positioned(
            right: -2.w,
            top: -2.h,
            child: Container(
              height: 8.r,
              width: 8.r,
              decoration: const BoxDecoration(
                color: Color(0xffFF4D4D),
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
