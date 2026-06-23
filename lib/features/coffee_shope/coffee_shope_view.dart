import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_bottom_nav.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_category_tabs.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_product_list.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_search.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_special_card.dart';

class CoffeeShopeView extends StatefulWidget {
  const CoffeeShopeView({super.key});

  @override
  State<CoffeeShopeView> createState() => _CoffeeShopeViewState();
}

class _CoffeeShopeViewState extends State<CoffeeShopeView> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeShopeColors.primaryBlack,
      appBar: _buildHeader(),
      bottomNavigationBar: const CoffeeBottomNav(),
      body: SafeArea(
        top: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 24.h),
          children: [
            const CoffeeSearchWidget(),
            30.vSpace,
            CoffeeCategoryTabs(
              selectedIndex: _selectedCategoryIndex,
              onChanged: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              },
            ),
            20.vSpace,
            CoffeeProductList(categoryIndex: _selectedCategoryIndex),
            28.vSpace,
            const CoffeeSpecialCard(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildHeader() {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: CoffeeShopeColors.primaryBlack,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Icon(
          Icons.menu_rounded,
          color: CoffeeShopeColors.whiteClr,
          size: 28.sp,
        ),
      ),
      actions: [
        Padding(
          padding: rightPadding,
          child: SizedBox(
            height: 40.h,
            width: 40.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
