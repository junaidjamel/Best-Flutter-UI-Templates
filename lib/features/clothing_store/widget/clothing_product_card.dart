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
      child: Container(
        padding: EdgeInsets.all(7.w),
        decoration: BoxDecoration(
          color: ClothingAppColors.surface,
          borderRadius: BorderRadius.circular(22.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.055),
              blurRadius: 18,
              offset: Offset(0, 9.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _ProductImage(product: product, onTap: onFavoriteTap),
            ),
            10.vSpace,
            _ProductInfo(product: product),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.product, required this.onTap});

  final ClothingProduct product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: ColoredBox(
              color: ClothingAppColors.surfaceSoft,
              child: ClothingNetworkImage(imageUrl: product.imageUrl),
            ),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: 0),
                  Colors.black.withValues(alpha: 0.04),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10.w,
          bottom: 10.h,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.86),
              borderRadius: BorderRadius.circular(999.r),
            ),
            child: Text(
              product.categories.first,
              style: GoogleFonts.poppins(
                color: ClothingAppColors.ink.withValues(alpha: 0.72),
                fontSize: 8.5.sp,
                height: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
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
            size: 33,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}

class _ProductInfo extends StatelessWidget {
  const _ProductInfo({required this.product});

  final ClothingProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: ClothingAppColors.ink,
              fontSize: 14.sp,
              height: 1,
              fontWeight: FontWeight.w800,
            ),
          ),
          Row(
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  color: ClothingAppColors.ink.withValues(alpha: .84),
                  fontSize: 13.sp,
                  height: 1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 13.sp,
                backgroundColor: ClothingAppColors.ink,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
