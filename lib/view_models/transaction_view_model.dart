import 'package:final_project_kel_2/models/transaction_model/api/transaction_api.dart';
import 'package:flutter/cupertino.dart';

class TransactionViewModel extends ChangeNotifier {
  final TransactionApi transApi = TransactionApi();

  Future<void> postTransaction(Map data) async {
    try {
      await transApi.postTransaction(data);
    } catch (_) {
      rethrow;
    }
  }
}
