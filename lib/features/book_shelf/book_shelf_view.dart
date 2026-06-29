import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/book_shelf/const/book_shelf_colors.dart';
import 'package:flutter_ui/features/book_shelf/const/book_shelf_data.dart';
import 'package:flutter_ui/features/book_shelf/model/book_shelf.dart';
import 'package:flutter_ui/features/book_shelf/widget/book_shelf_bottom_nav.dart';
import 'package:flutter_ui/features/book_shelf/widget/book_shelf_header.dart';
import 'package:flutter_ui/features/book_shelf/widget/book_shelf_section.dart';
import 'package:flutter_ui/features/book_shelf/widget/category_filter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookShelfView extends StatefulWidget {
  const BookShelfView({super.key});

  @override
  State<BookShelfView> createState() => _BookShelfViewState();
}

class _BookShelfViewState extends State<BookShelfView> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';
  int _selectedNavIndex = 1;
  bool _isSearchVisible = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredShelves = _filterShelves();

    return Scaffold(
      backgroundColor: BookShelfColors.background,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: BookShelfHeader(
                    showSearch: _isSearchVisible,
                    searchController: _searchController,
                    onSearchPressed: () {
                      setState(() => _isSearchVisible = !_isSearchVisible);
                    },
                    onSearchChanged: (_) => setState(() {}),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CategoryFilter(
                    categories: bookShelfCategories,
                    selectedCategory: _selectedCategory,
                    onSelected: (category) {
                      setState(() => _selectedCategory = category);
                    },
                  ),
                ),
                if (filteredShelves.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        'No shelves found',
                        style: TextStyle(color: BookShelfColors.mutedText),
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(18, 14, 18, 118),
                    sliver: SliverGrid.builder(
                      itemCount: filteredShelves.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 18,
                            childAspectRatio: .73,
                          ),
                      itemBuilder: (context, index) {
                        final shelf = filteredShelves[index];
                        return BookShelfSection(
                          shelf: shelf,
                          onTap: () => _openShelfDetails(context, shelf),
                        );
                      },
                    ),
                  ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BookShelfBottomNav(
                selectedIndex: _selectedNavIndex,
                onSelected: (index) {
                  setState(() => _selectedNavIndex = index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BookShelf> _filterShelves() {
    final query = _searchController.text.trim().toLowerCase();

    return bookShelves.where((shelf) {
      final matchesCategory =
          _selectedCategory == 'All' || shelf.category == _selectedCategory;
      final matchesSearch =
          query.isEmpty || shelf.category.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void _openShelfDetails(BuildContext context, BookShelf shelf) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: BookShelfColors.surface,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 4, 22, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${shelf.category} shelf',
                style: GoogleFonts.merriweather(
                  color: BookShelfColors.text,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${shelf.bookCount} books in your collection',
                style: const TextStyle(color: BookShelfColors.mutedText),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 160.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: shelf.coverUrls.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      shelf.coverUrls[index],
                      width: 100.w,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const ColoredBox(
                        color: BookShelfColors.glass,
                        child: SizedBox(
                          width: 116,
                          child: Icon(
                            Icons.menu_book_rounded,
                            color: BookShelfColors.mutedText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
