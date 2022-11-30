import 'package:final_project_kel_2/models/usermodel.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  List<ProductData> productData;

  ProductModel({required this.productData});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productData: json['data'] != null
            ? (json['data'] as List)
                .map((e) => ProductData.fromJson(e))
                .toList()
            : [],
      );
}

class ProductData extends ChangeNotifier {
  final int id;
  final String name;
  final String img;
  final int price;
  final ProductCategory category;

  ProductData({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.category,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json['id'],
        name: json['name'],
        img: json['image'],
        price: json['harga'],
        category: json['category'] != null
            ? ProductCategory.fromJson(
                json['category'],
              )
            : ProductCategory(id: 0, name: 'null'),
      );
}

class ProductCategory {
  final int id;
  final String name;

  ProductCategory({required this.id, required this.name});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json['id'],
        name: json['name'],
      );
  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
