import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeCategoryTabs extends StatelessWidget {
  const CoffeeCategoryTabs({
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });

  static const _categories = ['Cappuccino', 'Espresso', 'Latte', 'Flat White'];

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: ListView.separated(
        padding: leftPadding,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onChanged(index),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 180),
                    style: GoogleFonts.poppins(
                      color: isSelected
                          ? CoffeeShopeColors.lightOrange
                          : CoffeeShopeColors.greyClr,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Text(_categories[index]),
                  ),
                  7.vSpace,
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    height: 8.r,
                    width: 8.r,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? CoffeeShopeColors.lightOrange
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, _) => 28.hSpace,
        itemCount: _categories.length,
      ),
    );
  }
}
