import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/extensions/sizedbox_extension.dart';
import 'package:flutter_ui/features/clothing_store/const/clothing_app_colors.dart';
import 'package:flutter_ui/features/clothing_store/model/clothing_cart_item.dart';
import 'package:flutter_ui/features/clothing_store/model/clothing_product.dart';
import 'package:flutter_ui/features/clothing_store/widget/clothing_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class ClothingCartView extends StatefulWidget {
  const ClothingCartView({
    required this.cartItems,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
    super.key,
  });

  final List<ClothingCartItem> cartItems;
  final ValueChanged<ClothingProduct> onIncrease;
  final ValueChanged<ClothingProduct> onDecrease;
  final ValueChanged<ClothingProduct> onRemove;

  @override
  State<ClothingCartView> createState() => _ClothingCartViewState();
}

class _ClothingCartViewState extends State<ClothingCartView> {
  double get _subTotal {
    return widget.cartItems.fold(0, (total, item) => total + item.total);
  }

  double get _shipping => widget.cartItems.isEmpty ? 0 : 5;

  void _increase(ClothingProduct product) {
    setState(() => widget.onIncrease(product));
  }

  void _decrease(ClothingProduct product) {
    setState(() => widget.onDecrease(product));
  }

  void _remove(ClothingProduct product) {
    setState(() => widget.onRemove(product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ClothingAppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(22.w, 14.h, 22.w, 20.h),
          child: Column(
            children: [
              _CartHeader(itemCount: widget.cartItems.length),
              24.vSpace,
              Expanded(
                child: _CartItemsList(
                  cartItems: widget.cartItems,
                  onIncrease: _increase,
                  onDecrease: _decrease,
                  onRemove: _remove,
                ),
              ),
              _CartSummary(
                subTotal: _subTotal,
                shipping: _shipping,
                bagTotal: _subTotal + _shipping,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CartHeader extends StatelessWidget {
  const _CartHeader({required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 17.sp,
            color: ClothingAppColors.ink,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'My Cart',
                style: GoogleFonts.poppins(
                  color: ClothingAppColors.ink,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '$itemCount Items',
                style: GoogleFonts.poppins(
                  color: ClothingAppColors.muted,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 17.w),
      ],
    );
  }
}

class _CartItemsList extends StatelessWidget {
  const _CartItemsList({
    required this.cartItems,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  final List<ClothingCartItem> cartItems;
  final ValueChanged<ClothingProduct> onIncrease;
  final ValueChanged<ClothingProduct> onDecrease;
  final ValueChanged<ClothingProduct> onRemove;

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) return const _EmptyCart();

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: cartItems.length,
      separatorBuilder: (_, _) => 15.vSpace,
      itemBuilder: (context, index) {
        return _CartProductTile(
          cartItem: cartItems[index],
          onIncrease: onIncrease,
          onDecrease: onDecrease,
          onRemove: onRemove,
        );
      },
    );
  }
}

class _CartProductTile extends StatelessWidget {
  const _CartProductTile({
    required this.cartItem,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  final ClothingCartItem cartItem;
  final ValueChanged<ClothingProduct> onIncrease;
  final ValueChanged<ClothingProduct> onDecrease;
  final ValueChanged<ClothingProduct> onRemove;

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;

    return SizedBox(
      height: 82.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              height: 72.h,
              width: 62.w,
              child: ClothingNetworkImage(imageUrl: product.imageUrl),
            ),
          ),
          13.hSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: ClothingAppColors.ink,
                          fontSize: 16.sp,
                          height: 1.16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      product.size,
                      style: GoogleFonts.poppins(
                        color: ClothingAppColors.ink,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                4.vSpace,
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    color: ClothingAppColors.ink,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    _QuantityButton(
                      icon: Icons.add_rounded,
                      onTap: () => onIncrease(product),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        '${cartItem.quantity}',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    _QuantityButton(
                      icon: Icons.remove_rounded,
                      onTap: () => onDecrease(product),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => onRemove(product),
                      child: Icon(
                        CupertinoIcons.delete,
                        color: ClothingAppColors.danger,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20.w,
        width: 20.w,
        decoration: BoxDecoration(
          color: ClothingAppColors.surface,
          shape: BoxShape.circle,
          border: Border.all(color: ClothingAppColors.line),
        ),
        child: Icon(icon, size: 13.sp, color: ClothingAppColors.ink),
      ),
    );
  }
}

class _CartSummary extends StatelessWidget {
  const _CartSummary({
    required this.subTotal,
    required this.shipping,
    required this.bagTotal,
  });

  final double subTotal;
  final double shipping;
  final double bagTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        18.vSpace,
        _SummaryRow(label: 'Sub total :', value: subTotal),
        12.vSpace,
        _SummaryRow(label: 'Shipping :', value: shipping),
        18.vSpace,
        Divider(color: ClothingAppColors.line, height: 1.h),
        18.vSpace,
        _SummaryRow(
          label: 'Bag Total :',
          value: bagTotal,
          valueColor: ClothingAppColors.orange,
          isLarge: true,
        ),
        24.vSpace,
        SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Checkout flow ready'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: ClothingAppColors.ink,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ClothingAppColors.orange,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: Text(
              'Checkout',
              style: GoogleFonts.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.valueColor = ClothingAppColors.ink,
    this.isLarge = false,
  });

  final String label;
  final double value;
  final Color valueColor;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            color: ClothingAppColors.muted,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: GoogleFonts.poppins(
            color: valueColor,
            fontSize: isLarge ? 18.sp : 17.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Your cart is empty',
        style: GoogleFonts.poppins(
          color: ClothingAppColors.muted,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
