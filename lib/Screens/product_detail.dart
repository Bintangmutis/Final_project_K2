import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product"),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  // width: double.infinity,
                  height: 200,
                  child: Image.network("src"),
                ),
                Row(
                  children: [
                    Text("Name product"),
                    Column(
                      children: [
                        Text("Harga"),
                        Text("Rating"),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Text("title Deskripsi Produk"),
                    Text("Deskripsi detail"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
