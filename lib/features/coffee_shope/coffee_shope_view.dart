import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_search.dart';

class CoffeeShopeView extends StatelessWidget {
  const CoffeeShopeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeShopeColors.primaryBlack,
      appBar: _buildHeader(),
      body: Column(children: [CoffeeSearchWidget()]),
    );
  }

  PreferredSizeWidget _buildHeader() {
    return AppBar(
      backgroundColor: CoffeeShopeColors.primaryBlack,
      leading: Icon(Icons.menu, color: CoffeeShopeColors.whiteClr),
      actions: [
        Padding(
          padding: rightPadding,
          child: SizedBox(
            height: 40.h,
            width: 40.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://img.magnific.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_hybrid&w=740&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
