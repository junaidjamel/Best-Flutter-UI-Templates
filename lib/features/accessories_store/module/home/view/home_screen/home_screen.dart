import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/accessories_store/module/home/model/product_model.dart';
import 'package:flutter_ui/features/accessories_store/module/home/view/detail_screen/product_detail_screen.dart';
import 'package:flutter_ui/features/accessories_store/module/home/view/widget/pageView_widget.dart';
import 'package:flutter_ui/features/accessories_store/module/home/view/widget/product_card_widget.dart';
import 'package:flutter_ui/features/accessories_store/txt_style.dart';

class AccessoriesHomeScreen extends StatelessWidget {
  final ValueChanged<ProductModel> onAddToCart;

  const AccessoriesHomeScreen({super.key, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi, Raheel 👋',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            5.vSpace,
            Text(
              'New Accessories !',
              style: headingStyle(
                context,
              ).copyWith(color: Colors.black, fontSize: 17.sp),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 25.sp,
            backgroundColor: Colors.black87,
            backgroundImage: NetworkImage(
              'https://media.istockphoto.com/id/2120762556/photo/portrait-of-a-man-taking-selfie.jpg?s=612x612&w=0&k=20&c=h83Yfkk7LL9_mvjDs1gWSCW61yL_tIr-Ymy5Hy_uXBA=',
            ),
          ),
          20.hSpace,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.vSpace,
          const PageViewWithDots(),
          20.vSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Products', style: headingStyle(context)),
                IconButton(
                  onPressed: () {},
                  icon: Text(
                    'See all',
                    style: headingStyle(context).copyWith(
                      color: Colors.grey[500],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          2.vSpace,

          // Products Builder
          SizedBox(
            height: 220.h,
            child: ListView.builder(
              itemCount: ProductModel.productList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                var product = ProductModel.productList[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(
                        productModel: product,
                        index: index,
                        onAddToCart: onAddToCart,
                      ),
                    ),
                  ),
                  child: ProductCardWidget(index: index, product: product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
