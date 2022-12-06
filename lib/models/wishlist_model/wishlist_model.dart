class WishListModel {
  final int id;
  final int productId;
  final int userId;
  final WishList product;

  WishListModel(
      {required this.id,
      required this.product,
      required this.userId,
      required this.productId});

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
      id: json['id'],
      product: WishList.fromJson(json['product']),
      userId: json['user_id'],
      productId: json['product_id']);
}

class WishList {
  final int id;
  final String nama;
  final int kategoriId;
  final String image;
  final int harga;
  final String deskripsi;
  final int jumlah;
  final String createDate;

  WishList(
      {required this.id,
      required this.nama,
      required this.kategoriId,
      required this.image,
      required this.harga,
      required this.deskripsi,
      required this.jumlah,
      required this.createDate});

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
        id: json['id'] ?? 0,
        nama: json['name'] ?? "null",
        kategoriId: json['category_id'] ?? 0,
        image: json['image'] ?? "null",
        harga: json['harga'] ?? 0,
        deskripsi: json['deskripsi'] ?? "null",
        jumlah: json['stock'] ?? 0,
        createDate: json['updated_at'] ?? "null",
      );
}
