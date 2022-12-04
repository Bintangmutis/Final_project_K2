import 'package:final_project_kel_2/models/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  late UserModel _user;
  UserModel get user => _user;

  saveUserDetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int id = prefs.getInt('userid') ?? 0;
    String name = prefs.getString('name') ?? 'null';
    String handphone = prefs.getString('phone') ?? 'null';
    String email = prefs.getString('email') ?? 'null';

    _user = UserModel(id: id, name: name, email: email, handphone: handphone);
    notifyListeners();
  }
}
