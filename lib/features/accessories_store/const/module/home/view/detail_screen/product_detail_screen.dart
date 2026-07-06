import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/const/app_widget/app_gradient_widget.dart';
import 'package:flutter_ui/features/accessories_store/const/images.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/model/product_model.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/view/widget/product_info_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel productModel;
  final int index;
  final ValueChanged<ProductModel> onAddToCart;

  const ProductDetailScreen({
    super.key,
    required this.productModel,
    required this.index,
    required this.onAddToCart,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  bool up = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(
          vsync: this,
          duration: const Duration(seconds: 3),
          reverseDuration: const Duration(milliseconds: 2300),
        )..addStatusListener((AnimationStatus status) {
          if (status == AnimationStatus.completed) controller.reverse();
          if (status == AnimationStatus.dismissed) controller.forward();
        });

    controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the AnimationController
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: CircleAvatar(
                        radius: 20.sp,
                        backgroundColor: Colors.white.withValues(alpha: 0.6),
                        child: Icon(Icons.keyboard_arrow_left, size: 22.sp),
                      ),
                    ),
                    SvgPicture.asset(
                      threeDotIcon,
                      color: Colors.white.withValues(alpha: 0.6),
                      width: 7.w,
                    ),
                  ],
                ),
                4.vSpace,
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: Hero(
                    tag: widget.productModel.productImg,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -0.1),
                        end: const Offset(0, 0.1),
                      ).animate(controller),
                      child: Image.asset(widget.productModel.productDetailImg),
                    ),
                  ),
                ),
                3.vSpace,
                ProductInfoWidget(
                  productModel: widget.productModel,
                  onAddToCart: widget.onAddToCart,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
