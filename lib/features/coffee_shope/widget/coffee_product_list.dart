import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/core/const/app_spacing.dart';
import 'package:flutter_ui/features/coffee_shope/detail/coffee_detail_view.dart';
import 'package:flutter_ui/features/coffee_shope/const/coffee_shope_colors.dart';
import 'package:flutter_ui/features/coffee_shope/widget/coffee_product_card.dart';

class CoffeeProductList extends StatelessWidget {
  const CoffeeProductList({required this.categoryIndex, super.key});

  final int categoryIndex;

  static const _productsByCategory = [
    [
      CoffeeProduct(
        name: 'Cappuccino',
        subtitle: 'With Oat Milk',
        price: '4.20',
        rating: '4.5',
        accent: Color(0xffA85E34),
        isDarkCup: false,
      ),
      CoffeeProduct(
        name: 'Cappuccino',
        subtitle: 'With Chocolate',
        price: '3.14',
        rating: '4.2',
        accent: CoffeeShopeColors.mutedOrange,
        isDarkCup: true,
      ),
      CoffeeProduct(
        name: 'Cappuccino',
        subtitle: 'With Cinnamon',
        price: '4.05',
        rating: '4.7',
        accent: Color(0xff8B5638),
        isDarkCup: false,
      ),
    ],
    [
      CoffeeProduct(
        name: 'Espresso',
        subtitle: 'Double Shot',
        price: '2.85',
        rating: '4.6',
        accent: Color(0xff6F3F24),
        isDarkCup: true,
      ),
      CoffeeProduct(
        name: 'Espresso',
        subtitle: 'With Caramel',
        price: '3.25',
        rating: '4.4',
        accent: Color(0xff9A5B32),
        isDarkCup: false,
      ),
      CoffeeProduct(
        name: 'Espresso',
        subtitle: 'Macchiato',
        price: '3.40',
        rating: '4.3',
        accent: Color(0xff7A492F),
        isDarkCup: true,
      ),
    ],
    [
      CoffeeProduct(
        name: 'Latte',
        subtitle: 'With Vanilla',
        price: '4.05',
        rating: '4.7',
        accent: Color(0xff8B5638),
        isDarkCup: false,
      ),
      CoffeeProduct(
        name: 'Latte',
        subtitle: 'With Almond Milk',
        price: '4.35',
        rating: '4.5',
        accent: Color(0xffB56B3C),
        isDarkCup: false,
      ),
      CoffeeProduct(
        name: 'Latte',
        subtitle: 'Iced Creamy',
        price: '4.10',
        rating: '4.4',
        accent: Color(0xff75462C),
        isDarkCup: true,
      ),
    ],
    [
      CoffeeProduct(
        name: 'Flat White',
        subtitle: 'Classic Foam',
        price: '3.80',
        rating: '4.6',
        accent: Color(0xffA6673E),
        isDarkCup: false,
      ),
      CoffeeProduct(
        name: 'Flat White',
        subtitle: 'With Oat Milk',
        price: '4.15',
        rating: '4.5',
        accent: Color(0xff875432),
        isDarkCup: true,
      ),
      CoffeeProduct(
        name: 'Flat White',
        subtitle: 'With Hazelnut',
        price: '4.30',
        rating: '4.8',
        accent: Color(0xff9B5A35),
        isDarkCup: false,
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final products = _productsByCategory[categoryIndex];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = ((constraints.maxWidth - (page * 2) - 22.w) / 2)
            .clamp(150.w, 176.w)
            .toDouble();

        return SizedBox(
          height: 270.h,
          child: ListView.separated(
            padding: pagePadding,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = products[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => CoffeeDetailView(product: product),
                    ),
                  );
                },
                child: CoffeeProductCard(product: product, width: cardWidth),
              );
            },
            separatorBuilder: (_, _) => SizedBox(width: 22.w),
            itemCount: products.length,
          ),
        );
      },
    );
  }
}
