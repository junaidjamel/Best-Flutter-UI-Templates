import 'package:flutter/material.dart';
import 'package:flutter_ui/features/book_shelf/const/book_shelf_colors.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
    super.key,
  });

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 4),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return ChoiceChip(
            showCheckmark: false,
            selected: isSelected,
            onSelected: (_) => onSelected(category),
            label: Text(category),
            labelStyle: TextStyle(
              color: isSelected
                  ? BookShelfColors.selectedChipText
                  : BookShelfColors.mutedText,
              fontSize: 11,
            ),
            selectedColor: BookShelfColors.selectedChip,
            backgroundColor: Colors.transparent,
            side: BorderSide.none,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            visualDensity: VisualDensity.compact,
          );
        },
      ),
    );
  }
}
