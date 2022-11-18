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

class User with ChangeNotifier {
  final String userName;
  final String userToken;
  final String userEmail;

  User({
    required this.userName,
    required this.userToken,
    required this.userEmail,
  });
}
