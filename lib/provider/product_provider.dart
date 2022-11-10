import 'package:flutter/cupertino.dart';
import 'package:final_project_kel_2/models/model.dart';

class Products with ChangeNotifier {
  List<Product> listProduct = [
    Product(
      productId: "1",
      productImg: "images/contoh_baju.jpeg",
      productName: "Tshirt",
      productPrice: "50000",
    ),
    Product(
      productId: "2",
      productImg: "images/contoh_baju.jpeg",
      productName: "Sweeter",
      productPrice: "50000",
    ),
    Product(
      productId: "3",
      productImg: "images/contoh_baju.jpeg",
      productName: "Jacket",
      productPrice: "50000",
    ),
  ];
}
