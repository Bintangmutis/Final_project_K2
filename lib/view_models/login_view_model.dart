import 'package:final_project_kel_2/models/login_model/api/login_api.dart';
import 'package:final_project_kel_2/models/login_model/login_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final LoginApi _loginApi = LoginApi();

  Future<void> postLogin(LoginModel login) async {
    try {
      await _loginApi.postLogin(login);
    } catch (_) {
      rethrow;
    }
  }
}
