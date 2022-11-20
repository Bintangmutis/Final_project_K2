import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:final_project_kel_2/Screens/product_detail.dart';
import 'package:final_project_kel_2/models/model.dart';
import 'package:provider/provider.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetail.routeName, arguments: product.productId);
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.productImg),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Serif',
                    color: Color.fromARGB(255, 62, 65, 102),
                  ),
                ),
                Text(
                  product.productPrice,
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
    );
  }
}
