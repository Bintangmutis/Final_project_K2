import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupProv with ChangeNotifier {
  final Map<String, dynamic> _dataUser = {};
  Map<String, dynamic> get dataUser => _dataUser;

  Future<dynamic> signup(String name, String email, String handphone,
      String password, String passwordConfirm) async {
    var url = Uri.parse("https://api1.sib3.nurulfikri.com/api/register");
    var response = await http.post(
      url,
      body: ({
        "name": name,
        "email": email,
        "handphone": handphone,
        "password": password,
        "password_confirmation": passwordConfirm
      }),
    );
    if (response.statusCode == 200) {}
    return throw json.decode(response.body)['info'];
  }
}
