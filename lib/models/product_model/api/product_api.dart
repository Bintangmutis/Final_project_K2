import 'dart:convert';
import 'package:final_project_kel_2/models/product_model/productmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/* penambahan variabel token dan mengambil data menggunakan token pada API */
class ProductApi {
  Future<List<ProductModel>> getProduct() async {
    Uri url = Uri.parse("https://api1.sib3.nurulfikri.com/api/barang");

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token')!;

    final response = await http.get(
      url,
      headers: ({
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
    );

    final responseBody = json.decode(response.body)['data'];

    final listOfProducts =
        (responseBody as List).map((e) => ProductModel.fromJson(e)).toList();
    return listOfProducts;
  }

  Future<List<ProductModel>> getProductByCategoryName(String value) async {
    Uri url = Uri.parse("https://api1.sib3.nurulfikri.com/api/barang");

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token')!;

    final response = await http.get(
      url,
      headers: ({
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
    );

    final responseBody = json.decode(response.body)['data'];

    final listOfProducts =
        (responseBody as List).map((e) => ProductModel.fromJson(e)).toList();
    return listOfProducts
        .where((element) => element.category.name.toLowerCase().contains(value))
        .toList();
  }

  Future<List<ProductModel>> searchProduct(String query) async {
    Uri url = Uri.parse("https://api1.sib3.nurulfikri.com/api/barang");

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token')!;

    final response = await http.get(
      url,
      headers: ({
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
    );

    final responseBody = json.decode(response.body)['data'];

    if (response.statusCode == 200) {
      final List listOfProduct = (responseBody as List);
      return listOfProduct
          .map((json) => ProductModel.fromJson(json))
          .where((product) {
        final nameProduct = product.name.toLowerCase();
        final categoryProduct = product.category.name.toLowerCase();
        final searchText = query.toLowerCase();

        return nameProduct.contains(searchText) &&
            categoryProduct.contains("k2_$searchText");
      }).toList();
    } else {
      throw Exception();
    }
  }
}
