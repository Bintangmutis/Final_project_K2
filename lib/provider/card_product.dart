import 'package:final_project_kel_2/provider/api/product_api.dart';
import 'package:flutter/material.dart';
import 'package:final_project_kel_2/Screens/product_detail.dart';
import 'package:final_project_kel_2/models/productmodel.dart';
import 'package:provider/provider.dart';
import 'package:final_project_kel_2/provider/login_provider.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductApi>(
      builder: (context, produk, child) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetail.routeName,
              arguments: produk.productModel.productData.productDetail.id);
        },
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(produk.productModel.productData.productDetail.img),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk.productModel.productData.productDetail.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Serif',
                      color: Color.fromARGB(255, 62, 65, 102),
                    ),
                  ),
                  Text(
                    produk.productModel.productData.productDetail.price
                        .toString(),
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
