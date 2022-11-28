import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:final_project_kel_2/models/productmodel.dart';

class Products with ChangeNotifier {
  //tambahan
  Map<String, dynamic> _token = {};
  Map<String, dynamic> get token => _token;
  late ProductModel productModell;

  List<ProductModel> listProduct = [];

  // List<Product> listProduct = [
  //   Product(
  //     productId: "1",
  //     productImg: "images/contoh_baju.jpeg",
  //     productName: "Tshirt",
  //     productPrice: "50000",
  //   ),
  //   Product(
  //     productId: "2",
  //     productImg: "images/contoh_baju.jpeg",
  //     productName: "Sweeter",
  //     productPrice: "50000",
  //   ),
  //   Product(
  //     productId: "3",
  //     productImg: "images/contoh_baju.jpeg",
  //     productName: "Jacket",
  //     productPrice: "50000",
  //   ),
  // ];
}
