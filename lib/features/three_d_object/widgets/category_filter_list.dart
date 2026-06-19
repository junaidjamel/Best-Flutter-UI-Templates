import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/theme/app_typography.dart';
import 'package:flutter_ui/features/three_d_object/const/three_d_object_colors.dart';

class CategoryFilterList extends StatefulWidget {
  const CategoryFilterList({super.key});

  @override
  State<CategoryFilterList> createState() => _CategoryFilterListState();
}

class _CategoryFilterListState extends State<CategoryFilterList> {
  final List<String> _categories = const [
    'Trending',
    'Top Creators',
    "Editor's Pick",
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedIndex;

          return Padding(
            padding: EdgeInsets.only(
              right: index == _categories.length - 1 ? 0 : 14.w,
            ),
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOut,
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: isSelected
                        ? ThreeDObjectColors.whiteClr.withValues(alpha: .68)
                        : ThreeDObjectColors.borderClr,
                    width: isSelected ? 1.5.w : 1.w,
                  ),
                ),
                child: Text(
                  _categories[index],
                  style: AppTypography.buttonPrimary.copyWith(
                    color: isSelected
                        ? ThreeDObjectColors.whiteClr
                        : ThreeDObjectColors.whiteClr.withValues(alpha: .42),
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
