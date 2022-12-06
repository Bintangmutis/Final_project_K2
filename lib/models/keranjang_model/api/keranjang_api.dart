import 'dart:convert';
import 'dart:io';

import 'package:final_project_kel_2/models/keranjang_model/keranjang_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KeranjangApi {
  Future<void> postKeranjang(Map data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      await http.post(
        Uri.parse('https://api1.sib3.nurulfikri.com/api/keranjang'),
        body: data,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  Future<List<KeranjangModel>> getKeranjang() async {
    Uri url = Uri.parse("https://api1.sib3.nurulfikri.com/api/keranjang");

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
        (responseBody as List).map((e) => KeranjangModel.fromJson(e)).toList();
    return listOfProducts;
  }
}
