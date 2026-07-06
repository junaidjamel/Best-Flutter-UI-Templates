import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppGradientWidget extends StatelessWidget {
  final double? height;
  final double? width;
  double? borderRadius;
  EdgeInsetsGeometry? padding = const EdgeInsets.all(0);
  EdgeInsetsGeometry? margin = const EdgeInsets.all(0);
  final Widget child;
  AppGradientWidget({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.margin,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height ?? 100.h,
      width: width ?? 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: 0.95),
            Colors.black.withValues(alpha: 0.9),
          ],
          stops: const [0.0, 0.8],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
