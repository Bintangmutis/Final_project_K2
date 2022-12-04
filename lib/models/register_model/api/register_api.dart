import 'dart:convert';

import 'package:final_project_kel_2/models/register_model/register_model.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  Future<String> postRegister(RegisterModel register) async {
    var url = Uri.parse("https://api1.sib3.nurulfikri.com/api/register");

    var response = await http.post(url, body: register.toJson());
    if (response.statusCode == 200) {
      return json.decode(response.body)['info'];
    }
    return throw json.decode(response.body)['info'];
  }
}
