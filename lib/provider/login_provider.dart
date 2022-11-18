import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProv with ChangeNotifier {
  String? email, password, token;

  LoginProv({this.email, this.password, this.token});

  Map<String, dynamic> _dataUser = {};
  Map<String, dynamic> get dataUser => _dataUser;

  Future<void> login(String email, String password) async {
    try {
      var url = Uri.parse("https://api1.sib3.nurulfikri.com/api/login");
      var response = await http.post(
        url,
        body: ({
          "email": email,
          "password": password,
        }),
      );
      var dataResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        _dataUser = dataResponse['data'];
        token = dataResponse['data']['token'];
        // print(token);
      } else {
        print(dataResponse);
      }
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
