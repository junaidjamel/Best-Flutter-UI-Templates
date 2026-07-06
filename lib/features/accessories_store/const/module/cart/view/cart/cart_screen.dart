import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/const/images.dart';
import 'package:flutter_ui/features/accessories_store/const/module/cart/provider/cart_provider.dart';
import 'package:flutter_ui/features/accessories_store/const/module/cart/view/widget/cart_card_widget.dart';
import 'package:flutter_ui/features/accessories_store/const/module/cart/view/widget/checkout_widget.dart';
import 'package:flutter_ui/features/accessories_store/const/module/cart/view/widget/empety_cart_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
          Consumer<CartProvider>(
            builder: (context, provider, child) => provider.cartList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 42.h,
                          child: ListView.builder(
                            itemCount: provider.cartList.length,
                            itemBuilder: (_, index) {
                              var product = provider.cartList[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: CartCardWidget(
                                  index: index,
                                  product: product,
                                ),
                              );
                            },
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        2.vSpace,
                        const CheckOutWidget(),
                      ],
                    ),
                  )
                : const EmpetyCartWidget(),
          ),
        ],
      ),
    );
  }
}
