import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:final_project_kel_2/Screens/product_detail.dart';
import 'package:final_project_kel_2/models/model.dart';
import 'package:provider/provider.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetail.routeName,
            arguments: productData.productId);
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(productData.productImg),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productData.productName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Serif',
                    color: Color.fromARGB(255, 62, 65, 102),
                  ),
                ),
                Text(
                  productData.productPrice,
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
