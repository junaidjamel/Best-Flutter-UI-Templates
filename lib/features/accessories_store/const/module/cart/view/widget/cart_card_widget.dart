import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/accessories_store/const/app_widget/app_gradient_widget.dart';
import 'package:flutter_ui/features/accessories_store/const/module/cart/provider/cart_provider.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/model/product_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartCardWidget extends StatelessWidget {
  final int index;
  final ProductModel product;

  const CartCardWidget({super.key, required this.index, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) => Row(
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
              Text(
                product.productTitle,
                style: GoogleFonts.kanit(fontSize: 17.sp),
              ),
              const SizedBox(height: 5),
              Text(
                '\$${(product.productPrice * provider.getQuantity(product.id)).toStringAsFixed(2)}',
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
                  onPressed: () {
                    provider.decrementQuantity(product.id);
                    provider.removeFromCart(product);
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(
                  provider.getQuantity(product.id).toString(),
                  style: GoogleFonts.kanit(fontSize: 18.sp),
                ),
                IconButton(
                  onPressed: () {
                    provider.incrementQuantity(product.id);
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
