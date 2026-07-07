import 'package:flutter/material.dart';

class ColorContainerWidget extends StatefulWidget {
  const ColorContainerWidget({super.key});

  @override
  State<ColorContainerWidget> createState() => _ColorContainerWidgetState();
}

class _ColorContainerWidgetState extends State<ColorContainerWidget> {
  static const double _containerSize = 25.0;
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildContainer(0, Colors.black),
        _buildContainer(1, Colors.grey),
        _buildContainer(2, Colors.white),
      ],
    );
  }

  Widget _buildContainer(int index, Color color) {
    final isSelected = _selectedIndex == index;

    return IconButton(
      onPressed: () => setState(() => _selectedIndex = index),
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: isSelected ? _containerSize * 1.5 : _containerSize,
        height: isSelected ? _containerSize * 1.5 : _containerSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: color == Colors.white
              ? Border.all(color: Colors.grey, width: 1.5)
              : null,
        ),
      ),
    );
  }
}
