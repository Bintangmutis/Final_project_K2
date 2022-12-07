import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TransactionApi {
  Future<void> postTransaction(Map data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      await http.post(
        Uri.parse('https://api1.sib3.nurulfikri.com/api/transaksi'),
        body: data,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
    } on SocketException {
      throw 'No Internet Connection';
    }
  }
}
