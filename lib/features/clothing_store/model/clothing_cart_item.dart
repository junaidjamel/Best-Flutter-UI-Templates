import 'package:flutter_ui/features/clothing_store/model/clothing_product.dart';

class ClothingCartItem {
  const ClothingCartItem({required this.product, required this.quantity});

  final ClothingProduct product;
  final int quantity;

  ClothingCartItem copyWith({int? quantity}) {
    return ClothingCartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }

  double get total => product.price * quantity;
}
