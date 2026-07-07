import 'package:flutter_ui/features/accessories_store/const/images.dart';

class ProductModel {
  final int id;
  final String productImg;
  final String productDetailImg;
  final String productCompany;
  final String productTitle;
  final String productTagLine;
  final double productPrice;
  int count;

  ProductModel({
    required this.id,
    required this.productImg,
    required this.productCompany,
    required this.productTitle,
    required this.productPrice,
    required this.productDetailImg,
    required this.productTagLine,
    required this.count,
  });
  static List<ProductModel> productList = [
    ProductModel(
      id: 1,
      productImg: p1,
      productDetailImg: pD1,
      productCompany: 'Logitech',
      productTitle: 'Logitech K380s',
      productTagLine:
          'Machinical Keyboard - Fast typing, productivity increaser',
      productPrice: 50.00,
      count: 1,
    ),
    ProductModel(
      id: 2,
      productImg: p2,
      productDetailImg: pD2,
      productCompany: 'Dell',
      productTitle: 'UltraSharp 27',
      productTagLine:
          'Dell - UltraWide 27 inches monitor with thousands of colors',
      productPrice: 199.00,
      count: 1,
    ),
    ProductModel(
      id: 3,
      productImg: p3,
      productDetailImg: pD3,
      productCompany: 'Sony',
      productTitle: 'Headphone V35',
      productTagLine: 'Alara - planar magnetic headphones',
      productPrice: 97.00,
      count: 1,
    ),
    ProductModel(
      id: 4,
      productImg: p4,
      productDetailImg: p4,
      productCompany: 'Burberry',
      productTitle: 'Leather Bag',
      productTagLine: 'Burberry - Brown leather bag for laptop and office use',
      productPrice: 50.00,
      count: 1,
    ),
  ];
}
