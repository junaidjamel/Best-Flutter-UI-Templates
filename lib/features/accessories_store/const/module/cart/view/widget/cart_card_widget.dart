import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/accessories_store/const/app_widget/app_gradient_widget.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/model/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCardWidget extends StatelessWidget {
  final int index;
  final ProductModel product;
  final ValueChanged<ProductModel> onIncrement;
  final ValueChanged<ProductModel> onDecrement;

  const CartCardWidget({
    super.key,
    required this.index,
    required this.product,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppGradientWidget(
          borderRadius: 20,
          padding: const EdgeInsets.only(left: 16),
          height: 12.h,
          width: 24.w,
          child: Image.asset(product.productImg),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(product.productTitle, style: GoogleFonts.kanit(fontSize: 17.sp)),
            const SizedBox(height: 5),
            Text(
              '\$${(product.productPrice * product.count).toStringAsFixed(2)}',
              style: GoogleFonts.kanit(fontSize: 18.sp, color: Colors.black),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () => onDecrement(product),
                icon: const Icon(Icons.remove),
              ),
              Text(
                product.count.toString(),
                style: GoogleFonts.kanit(fontSize: 18.sp),
              ),
              IconButton(
                onPressed: () => onIncrement(product),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
