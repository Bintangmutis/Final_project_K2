import 'dart:convert';

import 'package:final_project_kel_2/models/login_model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  Future<String> postLogin(LoginModel login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var url = Uri.parse("https://api1.sib3.nurulfikri.com/api/login");

    var response = await http.post(url, body: login.toJson());
    if (response.statusCode == 200) {
      prefs.setString(
        'token',
        json.decode(response.body)['data']['token'],
      );
      prefs.setInt('userid', json.decode(response.body)['data']['user']['id']);
      prefs.setString(
          'phone', json.decode(response.body)['data']['user']['handphone']);
      prefs.setString(
          'email', json.decode(response.body)['data']['user']['email']);
      prefs.setString(
          'name', json.decode(response.body)['data']['user']['name']);
      return json.decode(response.body)['info'];
    }
    return throw json.decode(response.body)['info'];
  }
}
