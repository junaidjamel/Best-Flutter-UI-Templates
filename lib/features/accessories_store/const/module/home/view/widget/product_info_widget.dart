import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/const/images.dart';
import 'package:flutter_ui/features/accessories_store/const/module/cart/provider/cart_provider.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/model/product_model.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/view/widget/selected_color_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductInfoWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductInfoWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productModel.productTitle,
              style: GoogleFonts.kanit(fontSize: 20.sp, color: Colors.grey),
            ),
            Text(
              "\$${productModel.productPrice}0",
              style: GoogleFonts.kanit(fontSize: 20.sp, color: Colors.grey),
            ),
          ],
        ),
        2.vSpace,
        Text(
          productModel.productTagLine,
          style: GoogleFonts.kanit(fontSize: 19.sp, color: Colors.white),
        ),
        2.vSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColorContainerWidget(),
            CupertinoButton(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 20),
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
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () => Provider.of<CartProvider>(
                context,
                listen: false,
              ).addToCart(productModel),
            ),
          ],
        ),
        2.vSpace,
        const Divider(color: Colors.grey),
        1.vSpace,
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
