import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:flutter_ui/features/coffee_shope/detail/widgets/coffee_buy_section.dart';
import 'package:flutter_ui/features/coffee_shope/detail/widgets/coffee_description_section.dart';
import 'package:flutter_ui/features/coffee_shope/detail/widgets/coffee_detail_hero.dart';
import 'package:flutter_ui/features/coffee_shope/detail/widgets/coffee_size_selector.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_product_card.dart';

class CoffeeDetailView extends StatefulWidget {
  const CoffeeDetailView({required this.product, super.key});

  final CoffeeProduct product;

  @override
  State<CoffeeDetailView> createState() => _CoffeeDetailViewState();
}

class _CoffeeDetailViewState extends State<CoffeeDetailView> {
  int _selectedSizeIndex = 0;

  static const _sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeShopeColors.primaryBlack,
      body: SafeArea(
        bottom: false,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 28.h),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: CoffeeDetailHero(product: widget.product),
            ),
            28.vSpace,
            CoffeeDescriptionSection(product: widget.product),
            26.vSpace,
            CoffeeSizeSelector(
              selectedIndex: _selectedSizeIndex,
              sizes: _sizes,
              onChanged: (index) {
                setState(() {
                  _selectedSizeIndex = index;
                });
              },
            ),
            50.vSpace,
            CoffeeBuySection(product: widget.product),
            50.vSpace,
          ],
        ),
      ),
    );
  }
}
