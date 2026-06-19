import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/3d_object/const/object_colors.dart';
import 'package:flutter_ui/core/const.dart';
import 'package:flutter_ui/core/theme/app_typography.dart';

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
          color: ObjectColors.whiteClr,
        ),
      ),
      actions: [
        Padding(
          padding: kRightPadding,
          child: Container(
            decoration: BoxDecoration(
              color: ObjectColors.iconsBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ObjectColors.borderClr),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                color: ObjectColors.whiteClr,
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
