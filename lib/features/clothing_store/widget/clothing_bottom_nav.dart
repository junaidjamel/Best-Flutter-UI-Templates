import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/clothing_store/const/clothing_app_colors.dart';

class ClothingBottomNav extends StatelessWidget {
  const ClothingBottomNav({
    required this.cartCount,
    required this.onCartTap,
    super.key,
  });

  final int cartCount;
  final VoidCallback onCartTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
      padding: EdgeInsets.fromLTRB(35.w, 18.h, 35.w, 30.h),
      decoration: const BoxDecoration(
        color: ClothingAppColors.ink,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(icon: Icons.home_outlined, isActive: true, onTap: () {}),
          _NavItem(icon: Icons.grid_view_rounded, onTap: () {}),
          _NavItem(
            icon: Icons.shopping_bag_outlined,
            badge: cartCount,
            onTap: onCartTap,
          ),
          _NavItem(icon: Icons.settings_outlined, onTap: () {}),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.onTap,
    this.isActive = false,
    this.badge = 0,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;
  final int badge;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox.square(
        dimension: 52.w,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              height: isActive ? 46.w : 42.w,
              width: isActive ? 46.w : 42.w,
              decoration: BoxDecoration(
                color: isActive
                    ? ClothingAppColors.orange
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: isActive
                    ? Border.all(
                        color: Colors.white.withValues(alpha: 0.32),
                        width: 2.2,
                      )
                    : null,
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: ClothingAppColors.orange.withValues(
                            alpha: 0.34,
                          ),
                          blurRadius: 16,
                          offset: Offset(0, 8.h),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                icon,
                color: isActive
                    ? Colors.white
                    : Colors.white.withValues(alpha: 0.58),
                size: isActive ? 23.sp : 22.sp,
              ),
            ),
            if (badge > 0)
              Positioned(
                right: 6.w,
                top: 3.h,
                child: Container(
                  height: 17.w,
                  width: 17.w,
                  decoration: BoxDecoration(
                    color: ClothingAppColors.danger,
                    shape: BoxShape.circle,
                    border: Border.all(color: ClothingAppColors.ink, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      badge > 9 ? '9+' : '$badge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.sp,
                        height: 1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
