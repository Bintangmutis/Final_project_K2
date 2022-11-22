import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:final_project_kel_2/provider/login_provider.dart';
import 'package:final_project_kel_2/provider/login_provider.dart';

/* penambahan variabel token dan mengambil data menggunakan token pada API */
class ProductApi {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;
  final String token = LoginProv().token;

  Future<void> getProduct() async {
    Uri url = Uri.parse("https://api1.sib3.nurulfikri.com/api/barang");

    try {
      var responseProduct = await http.get(
        url,
        headers: ({
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }),
      );
      var getDataProduct = jsonDecode(responseProduct.body);

      if (responseProduct.statusCode == 200) {
        _data = getDataProduct['data'];
      }
    } catch (e) {}
  }
}
