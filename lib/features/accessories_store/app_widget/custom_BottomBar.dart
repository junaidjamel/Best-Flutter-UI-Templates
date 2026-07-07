import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/features/accessories_store/images.dart';
import 'package:flutter_ui/features/accessories_store/module/cart/view/cart/cart_screen.dart';
import 'package:flutter_ui/features/accessories_store/module/home/model/product_model.dart';
import 'package:flutter_ui/features/accessories_store/module/home/view/home_screen/home_screen.dart';

class AccessoriesBottomNavBar extends StatefulWidget {
  const AccessoriesBottomNavBar({super.key});

  @override
  State<AccessoriesBottomNavBar> createState() =>
      _AccessoriesBottomNavBarState();
}

class _AccessoriesBottomNavBarState extends State<AccessoriesBottomNavBar> {
  final List<ProductModel> _cartList = [];
  final double _shippingFee = 30.0;
  int _currentIndex = 0;

  double get _cartTotal {
    return _cartList
        .map((product) => product.productPrice * product.count.toDouble())
        .fold(0.0, (total, price) => total + price);
  }

  void _changeTab(int index) {
    setState(() => _currentIndex = index);
  }

  void _addToCart(ProductModel product) {
    setState(() {
      final alreadyInCart = _cartList.any((item) => item.id == product.id);
      if (!alreadyInCart) {
        product.count = 1;
        _cartList.add(product);
      }
    });
  }

  void _incrementQuantity(ProductModel product) {
    setState(() => product.count++);
  }

  void _decrementQuantity(ProductModel product) {
    setState(() {
      if (product.count > 1) {
        product.count--;
        return;
      }

      _cartList.removeWhere((item) => item.id == product.id);
      product.count = 1;
    });
  }

  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return AccessoriesHomeScreen(onAddToCart: _addToCart);
      case 1:
        return CartScreen(
          cartList: _cartList,
          shippingFee: _shippingFee,
          totalPrice: _cartTotal,
          onIncrement: _incrementQuantity,
          onDecrement: _decrementQuantity,
        );
      case 2:
        return const Center(child: Text('To be Continue...'));
      case 3:
        return const Center(child: Text('To be Continue...'));
      default:
        return AccessoriesHomeScreen(onAddToCart: _addToCart);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentScreen(),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.all(6.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0.85),
                Colors.black,
                Colors.black.withValues(alpha: 0.7),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              stops: const [0.0, 0.6, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(homeIcon, 0),
              _buildNavItem(cartIcon, 1),
              _buildNavItem(lockIcon, 2),
              _buildNavItem(searchIcon, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, int index) {
    final isSelected = _currentIndex == index;

    return IconButton(
      onPressed: () => _changeTab(index),
      icon: SvgPicture.asset(
        icon,
        color: isSelected ? Colors.white : Colors.grey[700],
        height: 30.h,
      ),
    );
  }
}
