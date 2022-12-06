import 'package:final_project_kel_2/models/keranjang_model/api/keranjang_api.dart';
import 'package:final_project_kel_2/models/keranjang_model/keranjang_model.dart';
import 'package:flutter/cupertino.dart';

class KeranjangViewModel extends ChangeNotifier {
  final KeranjangApi keranjangApi = KeranjangApi();
  List<KeranjangModel> listkeranjang = [];

  Future<void> postKeranjang(Map data) async {
    try {
      await keranjangApi.postKeranjang(data);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> fetchKeranjang() async {
    try {
      listkeranjang = await keranjangApi.getKeranjang();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
