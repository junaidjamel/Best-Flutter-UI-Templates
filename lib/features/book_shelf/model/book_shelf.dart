class BookShelf {
  const BookShelf({
    required this.category,
    required this.bookCount,
    required this.coverUrls,
  });

  final String category;
  final int bookCount;
  final List<String> coverUrls;
}
