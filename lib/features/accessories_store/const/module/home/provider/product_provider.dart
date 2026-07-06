import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  int selectedIndex = -1;

  void changeColor(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
