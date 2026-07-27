import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/scroll_social/const/scroll_social_colors.dart';

/// A polished empty state used while secondary social tabs have no content.
class SocialTabPlaceholder extends StatelessWidget {
  const SocialTabPlaceholder({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    required this.actionLabel,
  });

  final String title;
  final String message;
  final IconData icon;
  final String actionLabel;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 82.w,
            height: 82.w,
            decoration: const BoxDecoration(
              color: ScrollSocialColors.accentSoft,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 34.sp,
              color: ScrollSocialColors.textPrimary,
            ),
          ),
          SizedBox(height: 22.h),
          Text(
            title,
            style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ScrollSocialColors.textTertiary,
              fontSize: 13.sp,
              height: 1.55,
            ),
          ),
          SizedBox(height: 22.h),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: ScrollSocialColors.textPrimary,
              foregroundColor: ScrollSocialColors.background,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Text(actionLabel, style: TextStyle(fontSize: 12.sp)),
          ),
        ],
      ),
    ),
  );
}

class SocialCreateSheet extends StatelessWidget {
  const SocialCreateSheet({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 42.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ScrollSocialColors.outline,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(height: 22.h),
          Text(
            'Create something',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              _CreateOption(icon: CupertinoIcons.video_camera, label: 'Reel'),
              SizedBox(width: 12.w),
              _CreateOption(
                icon: CupertinoIcons.photo_on_rectangle,
                label: 'Post',
              ),
              SizedBox(width: 12.w),
              _CreateOption(icon: CupertinoIcons.pencil, label: 'Thought'),
            ],
          ),
        ],
      ),
    ),
  );
}

class _CreateOption extends StatelessWidget {
  const _CreateOption({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Expanded(
    child: InkWell(
      borderRadius: BorderRadius.circular(18.r),
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 17.h),
        decoration: BoxDecoration(
          color: ScrollSocialColors.surfaceSubtle,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: ScrollSocialColors.outline),
        ),
        child: Column(
          children: [
            Icon(icon, size: 23.sp),
            SizedBox(height: 8.h),
            Text(
              label,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ),
  );
}
