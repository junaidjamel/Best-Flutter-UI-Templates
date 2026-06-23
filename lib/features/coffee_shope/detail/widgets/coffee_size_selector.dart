import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeSizeSelector extends StatelessWidget {
  const CoffeeSizeSelector({
    required this.selectedIndex,
    required this.sizes,
    required this.onChanged,
    super.key,
  });

  final int selectedIndex;
  final List<String> sizes;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Size',
            style: GoogleFonts.poppins(
              color: CoffeeShopeColors.whiteClr,
              fontSize: 17.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          18.vSpace,
          Row(
            children: List.generate(sizes.length, (index) {
              final isSelected = selectedIndex == index;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == sizes.length - 1 ? 0 : 20.w,
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onChanged(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      height: 48.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CoffeeShopeColors.fieldBlack,
                        borderRadius: BorderRadius.circular(14.r),
                        border: Border.all(
                          color: isSelected
                              ? CoffeeShopeColors.lightOrange
                              : Colors.transparent,
                          width: 1.2,
                        ),
                      ),
                      child: Text(
                        sizes[index],
                        style: GoogleFonts.poppins(
                          color: isSelected
                              ? CoffeeShopeColors.lightOrange
                              : CoffeeShopeColors.whiteClr.withValues(
                                  alpha: 0.82,
                                ),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
