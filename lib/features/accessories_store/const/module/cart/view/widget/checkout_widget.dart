import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/const/app_widget/app_gradient_widget.dart';
import 'package:flutter_ui/features/accessories_store/const/module/cart/provider/cart_provider.dart';
import 'package:flutter_ui/features/accessories_store/const/txt_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGradientWidget(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1.h),
      height: 29.h,
      borderRadius: 16,
      child: Consumer<CartProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selected Items : ",
                  style: GoogleFonts.kanit(
                    fontSize: 19.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "\$${provider.calculateTotal().toStringAsFixed(2)}",
                  style: GoogleFonts.kanit(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Fee",
                  style: GoogleFonts.kanit(
                    fontSize: 19.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "\$${provider.shippingFee.toStringAsFixed(2)}",
                  style: GoogleFonts.kanit(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            1.vSpace,
            const Divider(color: Colors.grey),
            1.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: GoogleFonts.kanit(
                    fontSize: 19.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "\$${provider.calculateTotal() + provider.shippingFee}0",
                  style: GoogleFonts.kanit(
                    fontSize: 20.sp,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            // 1.vSpace,
            CupertinoButton(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.05.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.amber,
                ),
                child: Center(
                  child: Text(
                    'Checkout',
                    style: headingStyle(
                      context,
                    ).copyWith(fontSize: 19.sp, letterSpacing: 1),
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
