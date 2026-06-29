import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/features/book_shelf/const/book_shelf_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BookShelfHeader extends StatelessWidget {
  const BookShelfHeader({
    required this.showSearch,
    required this.searchController,
    required this.onSearchPressed,
    required this.onSearchChanged,
    super.key,
  });

  final bool showSearch;
  final TextEditingController searchController;
  final VoidCallback onSearchPressed;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 15, 10, 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'My books',
                  style: GoogleFonts.merriweather(
                    color: BookShelfColors.text,
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                onPressed: onSearchPressed,
                icon: Icon(
                  showSearch ? Icons.close_rounded : CupertinoIcons.search,
                  color: BookShelfColors.text,
                ),
              ),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Library synced')),
                  );
                },
                icon: const Icon(
                  Icons.more_horiz_rounded,
                  color: BookShelfColors.text,
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            child: showSearch
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 6,
                      bottom: 15,
                    ),
                    child: TextField(
                      controller: searchController,
                      autofocus: true,
                      onChanged: onSearchChanged,
                      style: const TextStyle(color: BookShelfColors.text),
                      decoration: InputDecoration(
                        hintText: 'Search your shelves',
                        hintStyle: const TextStyle(
                          color: BookShelfColors.mutedText,
                        ),
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: BookShelfColors.mutedText,
                        ),
                        filled: true,
                        fillColor: BookShelfColors.searchField,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
