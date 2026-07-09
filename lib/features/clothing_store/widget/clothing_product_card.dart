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
          Expanded(child: _ProductImage(product: product, onTap: onFavoriteTap)),
          9.vSpace,
          _ProductInfo(product: product),
        ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            color: ClothingAppColors.ink,
            fontSize: 13.sp,
            height: 1,
            fontWeight: FontWeight.w700,
          ),
        ),
        2.vSpace,
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: GoogleFonts.poppins(
            color: ClothingAppColors.ink.withValues(alpha: .8),
            fontSize: 12.sp,
            height: 1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
