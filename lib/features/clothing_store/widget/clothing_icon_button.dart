import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/clothing_store/const/clothing_app_colors.dart';

class ClothingIconButton extends StatelessWidget {
  const ClothingIconButton({
    required this.icon,
    this.onTap,
    this.backgroundColor = ClothingAppColors.surface,
    this.iconColor = ClothingAppColors.ink,
    this.size = 38,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox.square(
          dimension: size.w,
          child: Icon(icon, color: iconColor, size: 18.sp),
        ),
      ),
    );
  }
}
