import 'dart:convert';
import 'package:final_project_kel_2/models/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProv with ChangeNotifier {
  String token = '';
  late UserModel user;
  Map<String, dynamic> _dataUser = {};
  Map<String, dynamic> get dataUser => _dataUser;

  Future<dynamic> login(String email, String password) async {
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
      return UserModel.fromJson(jsonDecode(response.body));
    }
    return throw json.decode(response.body)['info'];
  }
}
