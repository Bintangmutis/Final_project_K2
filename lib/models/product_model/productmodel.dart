class ProductModel {
  final int id;
  final String name;
  final String img;
  final int price;
  final String description;
  final ProductCategory category;

  ProductModel(
      {required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.category,
      required this.description});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        img: json['image'],
        price: json['harga'],
        description: json['deskripsi'],
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
