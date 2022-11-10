import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String productId;
  final String productImg;
  final String productName;
  final String productPrice;

  // final String titleBook;
  // final String imgBook;
  // final String descBook;
  // final String writer;

  Product({
    required this.productId,
    required this.productImg,
    required this.productName,
    required this.productPrice,
  });
}
