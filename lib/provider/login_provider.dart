import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginProv with ChangeNotifier {
  String? email, password;

  LoginProv({this.email, this.password});

  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  void Login(String email, String password) async {
    var url = Uri.parse("https://api1.sib3.nurulfikri.com/api/login");
    try {
      var response = await http.post(
        url,
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
      );

      print(json.decode(response.body));
    } catch (e) {}
  }

  void SignUp(String email, String password) async {
    var url = Uri.parse("http://10.0.2.2:8000/api/register");

    try {
      var response = await http.post(
        url,
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
      );

      if (response.body == 200) {
        print(json.decode(response.body));
        notifyListeners();
      } else {
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
