import 'package:final_project_kel_2/models/wishlist_model/api/wishlist_api.dart';
import 'package:final_project_kel_2/models/wishlist_model/wishlist_model.dart';
import 'package:flutter/cupertino.dart';

class WishlistViewModel extends ChangeNotifier {
  final WishlistApi wishlistApi = WishlistApi();
  List<WishListModel> listwishlist = [];

  Future<void> postWishlist(Map data) async {
    try {
      await wishlistApi.postWishlist(data);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> fetchWishlist() async {
    try {
      listwishlist = await wishlistApi.getWishlist();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
