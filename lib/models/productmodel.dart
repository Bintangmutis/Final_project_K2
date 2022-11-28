import 'package:final_project_kel_2/models/usermodel.dart';

class ProductModel {
  final ProductData productData;

  ProductModel({required this.productData});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productData: ProductData.fromJson(
          json['data'],
        ),
      );
}

class ProductData {
  final DetailProduct productDetail;

  ProductData({required this.productDetail});

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        productDetail: DetailProduct.fromJson(
          json['id'],
        ),
      );
}

class DetailProduct {
  final int id;
  final String name;
  final String img;
  final int price;
  final int category;

  DetailProduct({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.category,
  });

  factory DetailProduct.fromJson(Map<String, dynamic> json) => DetailProduct(
        id: json['id'],
        name: json['name'],
        img: json['image'],
        price: json['harga'],
        category: json['category_id'],
      );
}
