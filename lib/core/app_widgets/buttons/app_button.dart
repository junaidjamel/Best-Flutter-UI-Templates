import 'package:flutter/material.dart';
import 'package:flutter_ui/core/theme/app_typography.dart';

import '../animation/bouncing_animation.dart';

class AppButton extends StatelessWidget {
  final Color? btnColor;
  final String text;
  final VoidCallback? onTap;
  final Widget? child;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? fontSize;
  final bool isLoading;

  const AppButton({
    super.key,
    this.btnColor,
    required this.text,
    required this.onTap,
    this.child,
    this.height,
    this.width,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.fontSize,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onTap == null;

    return Opacity(
      opacity: isDisabled ? 0.7 : 1,
      child: Bounce(
        onTap: (isLoading || isDisabled) ? null : onTap,
        child: Container(
          height: height ?? 47,
          width: width ?? MediaQuery.sizeOf(context).width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: btnColor ?? Colors.black,
            borderRadius: BorderRadius.circular(borderRadius ?? 13),
            border: Border.all(color: borderColor ?? Colors.transparent),
          ),
          child:
              child ??
              Text(
                text,
                style: AppTypography.displayMedium.copyWith(
                  fontSize: fontSize ?? 16,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
        ),
      ),
    );
  }
}
