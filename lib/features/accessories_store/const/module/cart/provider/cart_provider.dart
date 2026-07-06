import 'package:flutter/material.dart';
import 'package:flutter_ui/features/accessories_store/const/module/home/model/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _cartList = [];

  List<ProductModel> get cartList => _cartList;

  void addToCart(ProductModel product) {
    bool alreadyInCart = cartList.any((element) => element.id == product.id);

    if (!alreadyInCart) _cartList.add(product);

    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    if (product.count < 1) {
      _cartList.remove(product);
      product.count = 1;
    }
    notifyListeners();
  }

  void incrementQuantity(int productId) {
    _cartList.firstWhere((product) => product.id == productId).count++;
    notifyListeners();
  }

  void decrementQuantity(int productId) {
    _cartList.firstWhere((element) => element.id == productId).count--;
    notifyListeners();
  }

  int getQuantity(int productId) {
    for (var product in _cartList) {
      if (product.id == productId) {
        return product.count;
      }
    }
    return 0;
  }

  double calculateTotal() {
    return _cartList
        .map((product) => product.productPrice * product.count.toDouble())
        .fold(0.0, (total, price) => total + price);
  }

  double shippingFee = 30.0;
}
