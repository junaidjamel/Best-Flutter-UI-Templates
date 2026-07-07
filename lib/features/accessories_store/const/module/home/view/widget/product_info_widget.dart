import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/const/images.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/model/product_model.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/view/widget/selected_color_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInfoWidget extends StatelessWidget {
  final ProductModel productModel;
  final ValueChanged<ProductModel> onAddToCart;

  const ProductInfoWidget({
    super.key,
    required this.productModel,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                productModel.productTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.kanit(fontSize: 24.sp, color: Colors.grey),
              ),
            ),
            12.hSpace,
            Text(
              "\$${productModel.productPrice.toStringAsFixed(2)}",
              style: GoogleFonts.kanit(fontSize: 24.sp, color: Colors.grey),
            ),
          ],
        ),
        14.vSpace,
        Text(
          productModel.productTagLine,
          style: GoogleFonts.kanit(
            fontSize: 19.sp,
            color: Colors.white,
            height: 1.25,
          ),
        ),
        24.vSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ColorContainerWidget(),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(cartIcon),
                    4.hSpace,
                    Text(
                      'Add to Cart',
                      style: GoogleFonts.kanit(
                        color: Colors.black,
                        fontSize: 19.sp,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () => onAddToCart(productModel),
            ),
          ],
        ),
        22.vSpace,
        const Divider(color: Colors.grey),
        14.vSpace,
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Specifications',
              style: GoogleFonts.kanit(color: Colors.white, fontSize: 20.sp),
            ),
          ),
        ),
      ],
    );
  }
}
