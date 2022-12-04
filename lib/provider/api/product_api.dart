import 'dart:convert';
import 'package:final_project_kel_2/models/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:final_project_kel_2/provider/login_provider.dart';

/* penambahan variabel token dan mengambil data menggunakan token pada API */
class ProductApi with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;
  final String token = LoginProv().token;
  late ProductModel productModel;

  Future<dynamic> getProduct() async {
    Uri url = Uri.parse("https://api1.sib3.nurulfikri.com/api/barang");

    var responseProduct = await http.get(
      url,
      headers: ({
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
    );
    var getDataProduct = json.decode(responseProduct.body);

    if (responseProduct.statusCode == 200) {
      _data = getDataProduct['data'];
      productModel = ProductModel.fromJson(jsonDecode(responseProduct.body));
      notifyListeners();
      return '';
    }
    // return throw json.decode(responseProduct.body);
  }
}
