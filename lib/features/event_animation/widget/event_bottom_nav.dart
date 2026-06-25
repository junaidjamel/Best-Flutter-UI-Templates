import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_animation/const/event_animation_colors.dart';

class EventBottomNav extends StatelessWidget {
  const EventBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .24),
            blurRadius: 24,
            offset: Offset(0, 12.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _NavIcon(icon: Icons.home_rounded, isActive: true),
          _NavIcon(icon: Icons.bar_chart_rounded),
          _NavIcon(icon: Icons.message_rounded),
          _NavIcon(icon: Icons.more_vert_rounded),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, this.isActive = false});

  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 31.r,
      height: 31.r,
      decoration: BoxDecoration(
        color: isActive ? EventAnimationColors.darkChip : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: isActive ? Colors.white : EventAnimationColors.mutedText,
        size: 15.r,
      ),
    );
  }
}
