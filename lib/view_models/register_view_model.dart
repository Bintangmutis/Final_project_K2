import 'package:final_project_kel_2/models/register_model/api/register_api.dart';
import 'package:final_project_kel_2/models/register_model/register_model.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  final RegisterApi _registerApi = RegisterApi();

  Future<void> postRegister(RegisterModel register) async {
    try {
      await _registerApi.postRegister(register);
    } catch (_) {
      rethrow;
    }
  }
}
