import 'package:flutter_ui/features/book_shelf/model/book_shelf.dart';

const bookShelfCategories = [
  'All',
  'Fantasy',
  'Horror',
  'Classic',
  'History',
  'Sci-Fi',
  'Productivity',
];

const bookShelves = [
  BookShelf(
    category: 'Fantasy',
    bookCount: 8,
    coverUrls: [
      'https://i.pinimg.com/736x/43/06/53/430653e8eaa4f31269a5d28589c032a3.jpg',
      'https://covers.openlibrary.org/b/isbn/9781635575569-L.jpg',
      'https://covers.openlibrary.org/b/isbn/9780547928227-L.jpg',
    ],
  ),
  BookShelf(
    category: 'Sci-Fi',
    bookCount: 10,
    coverUrls: [
      'https://i.pinimg.com/736x/03/49/6b/03496bfafaa50bc73c0357d33ffb86e2.jpg',
      'https://covers.openlibrary.org/b/isbn/9780553293357-L.jpg',
      'https://i.pinimg.com/736x/71/33/8d/71338d05e236bba98695cedf01c37697.jpg',
    ],
  ),
  BookShelf(
    category: 'Classic',
    bookCount: 34,
    coverUrls: [
      'https://covers.openlibrary.org/b/isbn/9780451524935-L.jpg',
      'https://covers.openlibrary.org/b/isbn/9780743273565-L.jpg',
      'https://i.pinimg.com/736x/a1/22/97/a122978f19bc22baf3dc345c1d8cd7c4.jpg',
    ],
  ),
  BookShelf(
    category: 'Horror',
    bookCount: 12,
    coverUrls: [
      'https://covers.openlibrary.org/b/isbn/9780679735779-L.jpg',
      'https://covers.openlibrary.org/b/isbn/9780307743657-L.jpg',
      'https://covers.openlibrary.org/b/isbn/9781501142970-L.jpg',
    ],
  ),

  BookShelf(
    category: 'Productivity',
    bookCount: 7,
    coverUrls: [
      'https://covers.openlibrary.org/b/isbn/9780735211292-L.jpg',
      'https://covers.openlibrary.org/b/isbn/9781455586691-L.jpg',
      'https://covers.openlibrary.org/b/isbn/9780525536512-L.jpg',
    ],
  ),
  BookShelf(
    category: 'History',
    bookCount: 9,
    coverUrls: [
      'https://covers.openlibrary.org/b/isbn/9780062316097-L.jpg',
      'https://covers.openlibrary.org/b/isbn/9780374533557-L.jpg',
      'https://covers.openlibrary.org/b/isbn/9780143127741-L.jpg',
    ],
  ),
];
