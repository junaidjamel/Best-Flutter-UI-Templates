import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/features/book_shelf/const/book_shelf_colors.dart';

class BookShelfBottomNav extends StatelessWidget {
  const BookShelfBottomNav({
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  static const _items = [
    (Icons.home_outlined, 'Home'),
    (Icons.library_books_outlined, 'My Books'),
    (Icons.favorite_border_rounded, 'Wishlist'),
    (Icons.edit_note_rounded, 'Notes'),
    (Icons.person_outline_rounded, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(18, 0, 18, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              color: BookShelfColors.surface.withValues(alpha: .9),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: BookShelfColors.glassBorder),
            ),
            child: Row(
              children: List.generate(_items.length, (index) {
                final item = _items[index];
                final isSelected = index == selectedIndex;
                return Expanded(
                  child: InkWell(
                    onTap: () => onSelected(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.$1,
                          color: isSelected
                              ? BookShelfColors.text
                              : BookShelfColors.mutedText,
                          size: 20,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          item.$2,
                          style: TextStyle(
                            color: isSelected
                                ? BookShelfColors.text
                                : BookShelfColors.mutedText,
                            fontSize: 9,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
