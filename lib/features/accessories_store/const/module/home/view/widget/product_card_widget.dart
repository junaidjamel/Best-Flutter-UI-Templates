import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/const/app_widget/app_gradient_widget.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/model/product_model.dart';
import 'package:flutter_ui/features/accessories_store/const/txt_style.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardWidget extends StatelessWidget {
  final int index;
  final ProductModel product;
  const ProductCardWidget({
    super.key,
    required this.index,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGradientWidget(
          padding: const EdgeInsets.only(left: 20),
          margin: const EdgeInsets.only(left: 20),
          borderRadius: 16,
          height: 24.h,
          width: 33.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              3.vSpace,
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 12.h,
                  width: 100.w,
                  child: Hero(
                    tag: product.productImg,
                    child: Image.asset(
                      product.productImg,
                      fit: index == 3 ? BoxFit.fitWidth : BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Text(
                product.productCompany,
                style: subtitleStyle(context).copyWith(color: Colors.grey[400]),
              ),
              Text(
                product.productTitle,
                style: GoogleFonts.kanit(color: Colors.white, fontSize: 15.sp),
              ),
              SizedBox(height: 0.5.h),
              Text(
                "\$${product.productPrice}0",
                style: subtitleStyle(context).copyWith(color: Colors.grey[400]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
