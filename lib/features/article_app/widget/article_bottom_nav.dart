import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/article_app/const/article_color.dart';

class ArticleBottomNav extends StatelessWidget {
  const ArticleBottomNav({
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ColoredBox(
        color: ArticleColors.background,
        child: Padding(
          padding: EdgeInsets.fromLTRB(72.w, 10.h, 72.w, 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavItem(
                icon: Icons.home_outlined,
                selected: selectedIndex == 0,
                onTap: () => onSelected(0),
              ),
              _NavItem(
                icon: Icons.explore_outlined,
                selected: selectedIndex == 1,
                onTap: () => onSelected(1),
              ),
              _NavItem(
                icon: Icons.article_outlined,
                selected: false,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No saved articles yet.')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? ArticleColors.selectedNav : Colors.transparent,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Icon(icon, color: ArticleColors.primary, size: 27.sp),
        ),
      ),
    );
  }
}
