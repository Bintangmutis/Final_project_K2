import 'package:final_project_kel_2/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
  static const routeName = '/detail-page';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final productData = Provider.of<Products>(context)
        .listProduct
        .firstWhere((product_id) => product_id.productId == productId);
    String _textLorem = lorem(words: 30);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Product"),
        ),
        body: ListView(
          children: [
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 0),
                          spreadRadius: 0.75,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      productData.productImg,
                      width: double.infinity,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productData.productName,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Serif",
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  productData.productPrice,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Serif",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.blue),
                          ),
                          height: 1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Deskripsi Produk",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Serif",
                              ),
                            ),
                            Text(
                              _textLorem,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Serif",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                splashColor: Colors.blue[100],
                splashRadius: 20,
                color: Colors.blue,
                onPressed: () {},
                icon: Icon(
                  Icons.add_shopping_cart,
                ),
              ),
              OutlinedButton(onPressed: () {}, child: Text("Checkout")),
            ],
          ),
        ),
        // BottomNavigationBar(
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: OutlinedButton(onPressed: () {}, child: Text("Checkout")),
        //       label: "Checkout",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.add_shopping_cart),
        //       label: "Checkout",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.add_shopping_cart),
        //       label: "Checkout",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.add_shopping_cart),
        //       label: "Checkout",
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
