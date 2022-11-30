import 'package:final_project_kel_2/provider/api/product_api.dart';
import 'package:flutter/material.dart';
import 'package:final_project_kel_2/Screens/product_detail.dart';
import 'package:final_project_kel_2/models/productmodel.dart';
import 'package:provider/provider.dart';
import 'package:final_project_kel_2/provider/login_provider.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductApi>(
      builder: (context, produk, child) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetail.routeName,
              arguments: produk.productModel.productData);
        },
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(produk.productModel.productData.toString()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk.productModel.productData.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Serif',
                      color: Color.fromARGB(255, 62, 65, 102),
                    ),
                  ),
                  Text(
                    produk.productModel.productData.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Serif',
                      color: Color.fromARGB(255, 62, 65, 102),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardProductData extends ChangeNotifier {
  final ProductApi productApi = ProductApi();
  final List<ProductData> _productData = [];
  List<ProductData> get productData => _productData;

  void fetchAllProduct() async {
    final List<ProductData> products = await productApi.getProduct();
    try {
      for (var i in products) {
        if (i.category.name == 'ini_nama_category' &&
            !productData.contains(i)) {
          _productData.add(i);
          notifyListeners();
        }
      }
    } catch (e) {}
  }
}
