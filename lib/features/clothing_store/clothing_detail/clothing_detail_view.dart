import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/clothing_store/const/clothing_app_colors.dart';
import 'package:flutter_ui/features/clothing_store/model/clothing_product.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_icon_button.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class ClothingDetailView extends StatefulWidget {
  const ClothingDetailView({
    required this.product,
    required this.onAddToCart,
    required this.onFavoriteTap,
    super.key,
  });

  final ClothingProduct product;
  final VoidCallback onAddToCart;
  final VoidCallback onFavoriteTap;

  @override
  State<ClothingDetailView> createState() => _ClothingDetailViewState();
}

class _ClothingDetailViewState extends State<ClothingDetailView> {
  late String _selectedImage;
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.product.imageUrl;
    _isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ClothingAppColors.ink,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 14.h),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(34.r),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ColoredBox(
                        color: ClothingAppColors.surfaceSoft,
                        child: ClothingNetworkImage(imageUrl: _selectedImage),
                      ),
                      const _DetailShade(),
                      Positioned(
                        left: 16.w,
                        top: 16.h,
                        child: ClothingIconButton(
                          icon: Icons.arrow_back_ios_new_rounded,
                          size: 34,
                          backgroundColor: Colors.white.withValues(alpha: 0.72),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Positioned(
                        right: 16.w,
                        top: 16.h,
                        child: ClothingIconButton(
                          icon: _isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          iconColor: _isFavorite
                              ? ClothingAppColors.danger
                              : ClothingAppColors.muted,
                          size: 40,
                          onTap: () {
                            setState(() => _isFavorite = !_isFavorite);
                            widget.onFavoriteTap();
                          },
                        ),
                      ),
                      Positioned(
                        right: 14.w,
                        top: 180.h,
                        child: _ImageRail(
                          images: widget.product.gallery,
                          selectedImage: _selectedImage,
                          onSelect: (image) =>
                              setState(() => _selectedImage = image),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              16.vSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sub total',
                          style: GoogleFonts.poppins(
                            color: Colors.white54,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        2.vSpace,
                        Text(
                          '\$${widget.product.price.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                    width: 132.w,
                    child: ElevatedButton(
                      onPressed: widget.onAddToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ClothingAppColors.orange,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.r),
                        ),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageRail extends StatelessWidget {
  const _ImageRail({
    required this.images,
    required this.selectedImage,
    required this.onSelect,
  });

  final List<String> images;
  final String selectedImage;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52.w,
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Column(
        children: [
          for (final image in images.take(4)) ...[
            GestureDetector(
              onTap: () => onSelect(image),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 43.h,
                width: 38.w,
                padding: EdgeInsets.all(selectedImage == image ? 2.w : 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.r),
                  border: Border.all(
                    color: selectedImage == image
                        ? ClothingAppColors.orange
                        : Colors.transparent,
                    width: 1.4,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11.r),
                  child: ClothingNetworkImage(imageUrl: image),
                ),
              ),
            ),
            8.vSpace,
          ],
          Icon(
            Icons.keyboard_arrow_up_rounded,
            size: 18.sp,
            color: ClothingAppColors.ink,
          ),
        ],
      ),
    );
  }
}

class _DetailShade extends StatelessWidget {
  const _DetailShade();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withValues(alpha: 0.04),
            Colors.transparent,
            Colors.black.withValues(alpha: 0.24),
          ],
        ),
      ),
    );
  }
}
