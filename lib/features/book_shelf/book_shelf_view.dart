import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/features/book_shelf/const/book_shelf_colors.dart';
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
  bool _showSearch = false;

  static const _categories = [
    'All',

    'Fantasy',
    'Horror',
    'Classic',
    'History',
    'Sci-Fi',
    'Productivity',
  ];

  static const _shelves = [
    BookShelfData(
      category: 'Fantasy',
      bookCount: 8,
      coverUrls: [
        'https://i.pinimg.com/736x/43/06/53/430653e8eaa4f31269a5d28589c032a3.jpg',
        'https://covers.openlibrary.org/b/isbn/9781635575569-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780547928227-L.jpg',
      ],
    ),

    BookShelfData(
      category: 'Classic',
      bookCount: 34,
      coverUrls: [
        'https://covers.openlibrary.org/b/isbn/9780451524935-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780743273565-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780061120084-L.jpg',
      ],
    ),
    BookShelfData(
      category: 'Horror',
      bookCount: 12,
      coverUrls: [
        'https://covers.openlibrary.org/b/isbn/9780679735779-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780307743657-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9781501142970-L.jpg',
      ],
    ),
    BookShelfData(
      category: 'Sci-Fi',
      bookCount: 10,
      coverUrls: [
        'https://covers.openlibrary.org/b/isbn/9780441172719-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780553293357-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780441013593-L.jpg',
      ],
    ),
    BookShelfData(
      category: 'Productivity',
      bookCount: 7,
      coverUrls: [
        'https://covers.openlibrary.org/b/isbn/9780735211292-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9781455586691-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780525536512-L.jpg',
      ],
    ),
    BookShelfData(
      category: 'History',
      bookCount: 9,
      coverUrls: [
        'https://covers.openlibrary.org/b/isbn/9780062316097-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780374533557-L.jpg',
        'https://covers.openlibrary.org/b/isbn/9780143127741-L.jpg',
      ],
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final visibleShelves = _shelves.where((shelf) {
      final matchesCategory =
          _selectedCategory == 'All' || shelf.category == _selectedCategory;
      final matchesSearch =
          query.isEmpty || shelf.category.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).toList();

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
                    showSearch: _showSearch,
                    searchController: _searchController,
                    onSearchPressed: () {
                      setState(() => _showSearch = !_showSearch);
                    },
                    onSearchChanged: (_) => setState(() {}),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CategoryFilter(
                    categories: _categories,
                    selectedCategory: _selectedCategory,
                    onSelected: (category) {
                      setState(() => _selectedCategory = category);
                    },
                  ),
                ),
                if (visibleShelves.isEmpty)
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
                      itemCount: visibleShelves.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 18,
                            childAspectRatio: .73,
                          ),
                      itemBuilder: (context, index) {
                        final shelf = visibleShelves[index];
                        return BookShelfSection(
                          shelf: shelf,
                          onTap: () => _showShelf(context, shelf),
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

  void _showShelf(BuildContext context, BookShelfData shelf) {
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
