import 'package:flutter/material.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/provider/product_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ColorContainerWidget extends StatelessWidget {
  double containerSize = 25.0;

  ColorContainerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildContainer(0, Colors.black),
        buildContainer(1, Colors.grey),
        buildContainer(2, Colors.white),
      ],
    );
  }

  Widget buildContainer(int index, Color color) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) => IconButton(
        onPressed: () {
          provider.changeColor(index);
        },
        icon: AnimatedContainer(
          duration: const Duration(milliseconds: 500), // Animation duration
          curve: Curves.easeInOut, // Animation curve
          width: provider.selectedIndex == index
              ? containerSize * 1.5
              : containerSize,
          height: provider.selectedIndex == index
              ? containerSize * 1.5
              : containerSize,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}
