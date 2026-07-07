import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/app_widget/app_gradient_widget.dart';
import 'package:flutter_ui/features/accessories_store/txt_style.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutWidget extends StatelessWidget {
  final double selectedItemsTotal;
  final double shippingFee;

  const CheckOutWidget({
    super.key,
    required this.selectedItemsTotal,
    required this.shippingFee,
  });

  @override
  Widget build(BuildContext context) {
    return AppGradientWidget(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1.h),
      height: 29.h,
      width: double.infinity,
      borderRadius: 16,
      child: Column(
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
                "\$${selectedItemsTotal.toStringAsFixed(2)}",
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
                "\$${shippingFee.toStringAsFixed(2)}",
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
                "\$${(selectedItemsTotal + shippingFee).toStringAsFixed(2)}",
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
    );
  }
}
