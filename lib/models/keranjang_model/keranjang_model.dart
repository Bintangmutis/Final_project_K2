class KeranjangModel {
  final int id;
  final int userId;
  final int productId;
  final int quantity;
  final Keranjang cartProduct;

  KeranjangModel(
      {required this.id,
      required this.cartProduct,
      required this.productId,
      required this.quantity,
      required this.userId});

  factory KeranjangModel.fromJson(Map<String, dynamic> json) => KeranjangModel(
      id: json['id'],
      cartProduct: Keranjang.fromJson(json['product']),
      productId: json['product_id'],
      quantity: json['qty'],
      userId: json['user_id']);
}

class Keranjang {
  final int id;
  final String nama;
  final int kategoriId;
  final String image;
  final int harga;
  final String deskripsi;
  final int jumlah;

  Keranjang(
      {required this.id,
      required this.kategoriId,
      required this.deskripsi,
      required this.harga,
      required this.image,
      required this.nama,
      required this.jumlah});

  factory Keranjang.fromJson(Map<String, dynamic> json) => Keranjang(
        id: json['id'] ?? 0,
        nama: json['name'] ?? "null",
        kategoriId: json['category_id'] ?? 0,
        image: json['image'],
        harga: json['harga'] ?? 0,
        deskripsi: json['deskripsi'] ?? "null",
        jumlah: json['stock'] ?? 0,
      );
}
