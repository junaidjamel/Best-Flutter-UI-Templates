import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/theme/app_typography.dart';
import 'package:flutter_ui/features/three_d_object/const/three_d_object_colors.dart';

class ExploreHeader extends StatelessWidget implements PreferredSizeWidget {
  const ExploreHeader({super.key});

  @override
  Size get preferredSize => Size.fromHeight(64.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 64.h,

      title: Text(
        'Explore',
        style: AppTypography.displayLarge.copyWith(
          color: ThreeDObjectColors.whiteClr,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Container(
            decoration: BoxDecoration(
              color: ThreeDObjectColors.iconsBg,
              borderRadius: BorderRadius.circular(radiusMedium.r),
              border: Border.all(color: ThreeDObjectColors.borderClr),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                color: ThreeDObjectColors.whiteClr,
                size: 25.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
