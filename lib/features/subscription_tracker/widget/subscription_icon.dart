import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/subscription_tracker/const/subscription_tracker_colors.dart';

class SubscriptionIcon extends StatelessWidget {
  const SubscriptionIcon({
    required this.imageUrl,
    required this.fallback,
    super.key,
    this.size = 44,
  });

  final String imageUrl;
  final String fallback;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: SubscriptionTrackerColors.background.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => Center(
          child: Text(
            fallback.characters.first,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
