class ClothingProduct {
  const ClothingProduct({
    required this.id,
    required this.name,
    required this.series,
    required this.price,
    required this.size,
    required this.imageUrl,
    required this.gallery,
    required this.categories,
    this.isFavorite = false,
  });

  final int id;
  final String name;
  final String series;
  final double price;
  final String size;
  final String imageUrl;
  final List<String> gallery;
  final List<String> categories;
  final bool isFavorite;

  ClothingProduct copyWith({bool? isFavorite}) {
    return ClothingProduct(
      id: id,
      name: name,
      series: series,
      price: price,
      size: size,
      imageUrl: imageUrl,
      gallery: gallery,
      categories: categories,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
