import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ProductApi {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  Future<void> getProduct(String token) async {
    Uri url = Uri.parse("https://api1.sib3.nurulfikri.com/api/barang");

    try {
      var responseProduct = await http.get(
        url,
        headers: ({
          "Accept": "application/json",
          "Authorization": "Bearer TOKEN"
        }),
      );
      var getDataProduct = jsonDecode(responseProduct.body);

      if (responseProduct.statusCode == 200) {
        _data = getDataProduct['data'];
      }
    } catch (e) {}
  }
}
