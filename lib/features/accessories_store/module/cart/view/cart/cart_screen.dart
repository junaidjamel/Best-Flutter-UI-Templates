import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/images.dart';
import 'package:flutter_ui/features/accessories_store/module/cart/view/widget/cart_card_widget.dart';
import 'package:flutter_ui/features/accessories_store/module/cart/view/widget/checkout_widget.dart';
import 'package:flutter_ui/features/accessories_store/module/cart/view/widget/empety_cart_widget.dart';
import 'package:flutter_ui/features/accessories_store/module/home/model/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  final List<ProductModel> cartList;
  final double shippingFee;
  final double totalPrice;
  final ValueChanged<ProductModel> onIncrement;
  final ValueChanged<ProductModel> onDecrement;

  const CartScreen({
    super.key,
    required this.cartList,
    required this.shippingFee,
    required this.totalPrice,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(cartIcon, height: 22.sp),
            3.hSpace,
            Text('Cart', style: GoogleFonts.kanit(fontSize: 22.sp)),
          ],
        ),
      ),
      body: Column(
        children: [
          cartList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 42.h,
                        child: ListView.builder(
                          itemCount: cartList.length,
                          itemBuilder: (_, index) {
                            final product = cartList[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: CartCardWidget(
                                index: index,
                                product: product,
                                onIncrement: onIncrement,
                                onDecrement: onDecrement,
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(color: Colors.grey),
                      2.vSpace,
                      CheckOutWidget(
                        selectedItemsTotal: totalPrice,
                        shippingFee: shippingFee,
                      ),
                    ],
                  ),
                )
              : const EmpetyCartWidget(),
        ],
      ),
    );
  }
}
