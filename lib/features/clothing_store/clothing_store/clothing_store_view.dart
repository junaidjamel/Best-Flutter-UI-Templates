import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/clothing_store/clothing_cart/clothing_cart_view.dart';
import 'package:flutter_ui/features/clothing_store/clothing_detail/clothing_detail_view.dart';
import 'package:flutter_ui/features/clothing_store/const/clothing_app_colors.dart';
import 'package:flutter_ui/features/clothing_store/data/clothing_products.dart';
import 'package:flutter_ui/features/clothing_store/model/clothing_cart_item.dart';
import 'package:flutter_ui/features/clothing_store/model/clothing_product.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_bottom_nav.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_category_chip.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_icon_button.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_product_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ClothingStoreView extends StatefulWidget {
  const ClothingStoreView({super.key});

  @override
  State<ClothingStoreView> createState() => _ClothingStoreViewState();
}

class _ClothingStoreViewState extends State<ClothingStoreView> {
  final List<String> _categories = const [
    'Trending Now',
    'Fresh Drops',
    'Street Edit',
  ];
  late List<ClothingProduct> _products;
  final List<ClothingCartItem> _cartItems = [];
  int _selectedCategory = 0;

  @override
  void initState() {
    super.initState();
    _products = List.of(clothingProducts);
    _cartItems.addAll([
      ClothingCartItem(product: _products[1], quantity: 1),
      ClothingCartItem(product: _products[2], quantity: 1),
    ]);
  }

  int get _cartCount {
    return _cartItems.fold(0, (total, item) => total + item.quantity);
  }

  List<ClothingProduct> get _filteredProducts {
    final selectedCategory = _categories[_selectedCategory];
    return _products
        .where((product) => product.categories.contains(selectedCategory))
        .toList();
  }

  void _toggleFavorite(ClothingProduct product) {
    setState(() {
      final index = _products.indexWhere((item) => item.id == product.id);
      final currentProduct = _products[index];
      _products[index] = currentProduct.copyWith(
        isFavorite: !currentProduct.isFavorite,
      );
    });
  }

  void _addToCart(ClothingProduct product, {bool showMessage = true}) {
    setState(() {
      final index = _cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );
      if (index == -1) {
        _cartItems.add(ClothingCartItem(product: product, quantity: 1));
      } else {
        final item = _cartItems[index];
        _cartItems[index] = item.copyWith(quantity: item.quantity + 1);
      }
    });

    if (!showMessage) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ClothingAppColors.ink,
      ),
    );
  }

  void _increaseQuantity(ClothingProduct product) {
    _addToCart(product, showMessage: false);
  }

  void _decreaseQuantity(ClothingProduct product) {
    setState(() {
      final index = _cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );
      if (index == -1) return;
      final item = _cartItems[index];
      if (item.quantity == 1) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index] = item.copyWith(quantity: item.quantity - 1);
      }
    });
  }

  void _removeFromCart(ClothingProduct product) {
    setState(() {
      _cartItems.removeWhere((item) => item.product.id == product.id);
    });
  }

  Future<void> _openDetail(ClothingProduct product) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ClothingDetailView(
          product: product,
          onAddToCart: () => _addToCart(product),
          onFavoriteTap: () => _toggleFavorite(product),
        ),
      ),
    );
  }

  Future<void> _openCart() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ClothingCartView(
          cartItems: _cartItems,
          onIncrease: _increaseQuantity,
          onDecrease: _decreaseQuantity,
          onRemove: _removeFromCart,
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final visibleProducts = _filteredProducts;

    return Scaffold(
      backgroundColor: ClothingAppColors.ink,
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34.r),
                bottomRight: Radius.circular(34.r),
              ),
              child: ColoredBox(
                color: ClothingAppColors.background,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(22.w, 18.h, 22.w, 0),
                      sliver: SliverToBoxAdapter(child: _HomeHeader()),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(22.w, 16.h, 0, 0),
                      sliver: SliverToBoxAdapter(
                        child: SizedBox(
                          height: 45.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _categories.length,
                            separatorBuilder: (_, _) => 10.hSpace,
                            itemBuilder: (context, index) {
                              return ClothingCategoryChip(
                                label: _categories[index],
                                isSelected: _selectedCategory == index,
                                onTap: () {
                                  setState(() => _selectedCategory = index);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(22.w, 30.h, 22.w, 30.h),
                      sliver: SliverGrid.builder(
                        key: ValueKey(_categories[_selectedCategory]),
                        itemCount: visibleProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 17.h,
                          crossAxisSpacing: 15.w,
                          childAspectRatio: 0.68,
                        ),
                        itemBuilder: (context, index) {
                          final product = visibleProducts[index];
                          return ClothingProductCard(
                            product: product,
                            onTap: () => _openDetail(product),
                            onFavoriteTap: () => _toggleFavorite(product),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ClothingBottomNav(cartCount: _cartCount, onCartTap: _openCart),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.vSpace,
              Row(
                children: [
                  Icon(
                    Icons.apps_rounded,
                    size: 19.sp,
                    color: ClothingAppColors.ink,
                  ),
                  const Spacer(),
                  ClothingIconButton(
                    icon: CupertinoIcons.search,
                    size: 32,
                    backgroundColor: Colors.transparent,
                  ),
                  6.hSpace,
                  ClothingIconButton(
                    icon: Icons.autorenew_rounded,
                    size: 32,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              13.vSpace,
              Text(
                'Find your',
                style: GoogleFonts.poppins(
                  color: ClothingAppColors.ink,
                  fontSize: 26.sp,
                  height: 1.02,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    color: ClothingAppColors.ink,
                    fontSize: 26.sp,
                    height: 1.08,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    const TextSpan(text: 'match '),
                    TextSpan(
                      text: 'style!',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: ClothingAppColors.orange,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
