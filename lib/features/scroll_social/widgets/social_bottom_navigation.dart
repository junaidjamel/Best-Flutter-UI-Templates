import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/scroll_social/const/scroll_social_colors.dart';

class SocialBottomNavigation extends StatelessWidget {
  const SocialBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
    required this.onCreatePressed,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final VoidCallback onCreatePressed;

  @override
  Widget build(BuildContext context) {
    final icons = [
      CupertinoIcons.house,
      CupertinoIcons.compass,
      CupertinoIcons.add,
      CupertinoIcons.chat_bubble,
      CupertinoIcons.person,
    ];
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 18.h),
      height: 73.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: const [
          BoxShadow(
            color: ScrollSocialColors.shadow,
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: ScrollSocialColors.white85,
              border: Border.all(color: ScrollSocialColors.outline),
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(icons.length, (index) {
                final isAdd = index == 2;
                final isSelected = selectedIndex == index;
                return Semantics(
                  button: true,
                  selected: !isAdd && isSelected,
                  child: InkResponse(
                    onTap: isAdd ? onCreatePressed : () => onChanged(index),
                    radius: 29.r,
                    child: Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: isAdd
                          ? const BoxDecoration(
                              color: ScrollSocialColors.accent,
                              shape: BoxShape.circle,
                            )
                          : null,
                      child: Icon(
                        icons[index],
                        size: isAdd ? 27.sp : 25.sp,
                        color: isAdd || isSelected
                            ? ScrollSocialColors.textPrimary
                            : ScrollSocialColors.navigationInactive,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
