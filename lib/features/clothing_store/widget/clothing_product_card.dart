import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/clothing_store/const/clothing_app_colors.dart';
import 'package:flutter_ui/features/clothing_store/model/clothing_product.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_icon_button.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class ClothingProductCard extends StatelessWidget {
  const ClothingProductCard({
    required this.product,
    required this.onTap,
    required this.onFavoriteTap,
    super.key,
  });

  final ClothingProduct product;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: ColoredBox(
                    color: ClothingAppColors.surfaceSoft,
                    child: ClothingNetworkImage(imageUrl: product.imageUrl),
                  ),
                ),
                Positioned(
                  right: 8.w,
                  top: 8.h,
                  child: ClothingIconButton(
                    icon: product.isFavorite
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    iconColor: product.isFavorite
                        ? ClothingAppColors.danger
                        : ClothingAppColors.muted,
                    size: 29,
                    onTap: onFavoriteTap,
                  ),
                ),
              ],
            ),
          ),
          9.vSpace,
          Text(
            product.series,

            style: GoogleFonts.ubuntu(
              color: ClothingAppColors.ink,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
            ),
          ),
          2.vSpace,
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: GoogleFonts.oswald(
              color: ClothingAppColors.ink.withValues(alpha: .8),
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
