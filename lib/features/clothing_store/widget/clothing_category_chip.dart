import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/clothing_store/const/clothing_app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ClothingCategoryChip extends StatelessWidget {
  const ClothingCategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? ClothingAppColors.ink : ClothingAppColors.surface,
          borderRadius: BorderRadius.circular(13.r),
          border: Border.all(
            color: isSelected
                ? ClothingAppColors.ink
                : ClothingAppColors.line.withValues(alpha: 0.82),
            width: 1.1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: ClothingAppColors.ink.withValues(alpha: 0.18),
                blurRadius: 18,
                offset: Offset(0, 9.h),
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.045),
                blurRadius: 12,
                offset: Offset(0, 5.h),
              ),
          ],
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            letterSpacing: 0,
            color: isSelected
                ? Colors.white
                : ClothingAppColors.muted.withValues(alpha: 0.86),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
