import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/event_animation/const/event_animation_colors.dart';

class EventArtTile extends StatelessWidget {
  const EventArtTile({
    super.key,
    required this.month,
    required this.day,
    required this.title,
    required this.status,
    required this.imageUrl,
    this.isComplete = false,
    this.isLocked = false,
    this.onTap,
  });

  final String month;
  final String day;
  final String title;
  final String status;
  final String imageUrl;
  final bool isComplete;
  final bool isLocked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color statusColor = const Color(0xff8E8E93);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 76.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: EventAnimationColors.card,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: EventAnimationColors.divider),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 42.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    month,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: EventAnimationColors.mutedText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    day,
                    style: TextStyle(
                      fontSize: 21.sp,
                      color: EventAnimationColors.ink,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 14.w),

            ClipRRect(
              borderRadius: BorderRadius.circular(13.r),
              child: Image.network(
                imageUrl,
                height: 55.r,
                width: 52.r,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 14.w),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: EventAnimationColors.ink,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 10.w),

            _TrailingIcon(isComplete: isComplete, isLocked: isLocked),
          ],
        ),
      ),
    );
  }
}

class _TrailingIcon extends StatelessWidget {
  const _TrailingIcon({required this.isComplete, required this.isLocked});

  final bool isComplete;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    if (isLocked) {
      return Container(
        height: 28.r,
        width: 28.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xffD8D8D8)),
        ),
        child: Icon(
          Icons.lock_outline_rounded,
          size: 15.r,
          color: const Color(0xff9A9A9A),
        ),
      );
    }

    return Icon(
      Icons.chevron_right_rounded,
      size: 28.r,
      color: EventAnimationColors.ink,
    );
  }
}
