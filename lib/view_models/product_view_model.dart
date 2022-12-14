import 'package:final_project_kel_2/models/product_model/api/product_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:final_project_kel_2/models/product_model/productmodel.dart';

class ProductViewModel with ChangeNotifier {
  final ProductApi productApi = ProductApi();

  List<ProductModel> _listProduct = [];
  List<ProductModel> _listProductByCategory = [];
  List<ProductModel> _listProductSearch = [];

  List<ProductModel> get listProduct => _listProduct;
  List<ProductModel> get listProductByCategory => _listProductByCategory;
  List<ProductModel> get listProductSearch => _listProductSearch;

  Future<void> fetchProducts() async {
    try {
      _listProduct = await productApi.getProduct();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> fetchProductByCategoryName(String value) async {
    try {
      _listProductByCategory = await productApi.getProductByCategoryName(value);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> searchProductByName(String search) async {
    try {
      _listProductSearch = await productApi.searchProduct(search);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
