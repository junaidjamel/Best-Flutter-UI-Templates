import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/features/accessories_store/const/images.dart';
import 'package:flutter_ui/features/accessories_store/const/module/cart/view/cart/cart_screen.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/provider/bottomBar_provider.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomBarProvider>(
        builder: (context, provider, child) {
          switch (provider.currentIndex) {
            case 0:
              return const AccessoriesHomeScreen();
            case 1:
              return const CartScreen();
            case 2:
              return const Center(child: Text('To be Continue...'));
            case 3:
              return const Center(child: Text('To be Continue...'));
            default:
              return const AccessoriesHomeScreen();
          }
        },
      ),
      bottomNavigationBar: Consumer<BottomBarProvider>(
        builder: (context, provider, child) {
          return Container(
            margin: EdgeInsets.only(bottom: 3.h, left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.85),
                  Colors.black,
                  Colors.black.withValues(alpha: 0.7),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                stops: const [0.5, 1.0, 0.5],
                tileMode: TileMode.clamp,
              ),
            ),
            height: 6.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNavItem(homeIcon, 0, provider),
                buildNavItem(cartIcon, 1, provider),
                buildNavItem(lockIcon, 2, provider),
                buildNavItem(linesIcon, 3, provider),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget buildNavItem(String icon, int index, BottomBarProvider provider) {
  bool isSelected = provider.currentIndex == index;

  return IconButton(
    onPressed: () {
      provider.changeTab(index);
    },
    icon: SvgPicture.asset(
      icon,
      color: isSelected ? Colors.white : Colors.grey[700],
      height: 3.3.h,
    ),
  );
}
