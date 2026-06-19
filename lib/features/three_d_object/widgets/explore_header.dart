import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/theme/app_typography.dart';
import 'package:flutter_ui/features/three_d_object/const/three_d_object_colors.dart';

class ExploreHeader extends StatelessWidget implements PreferredSizeWidget {
  const ExploreHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,

      title: Text(
        'Explore',
        style: AppTypography.displayLarge.copyWith(
          color: ThreeDObjectColors.whiteClr,
        ),
      ),
      actions: [
        Padding(
          padding: AppSpacing.rightPadding,
          child: Container(
            decoration: BoxDecoration(
              color: ThreeDObjectColors.iconsBg,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
              border: Border.all(color: ThreeDObjectColors.borderClr),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                color: ThreeDObjectColors.whiteClr,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
