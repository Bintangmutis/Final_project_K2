import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_2/models/product_model/productmodel.dart';
import 'package:final_project_kel_2/view_models/keranjang_view_model.dart';
import 'package:final_project_kel_2/view_models/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text(
            "Product Detail",
            style: TextStyle(
                fontFamily: "Serif",
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                    offset: Offset(1.0, 3.0),
                  ),
                  Shadow(
                    color: Color.fromARGB(255, 71, 147, 248),
                    blurRadius: 10.0,
                    offset: Offset(-5.0, 5.0),
                  ),
                ]),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [
                0.4,
                0.9,
              ],
              colors: [
                const Color.fromARGB(255, 133, 180, 255),
                Colors.grey.shade300
              ],
            ),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade900,
                          offset: const Offset(4, 2),
                          spreadRadius: 0.25,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: product.img,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'serif',
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Rp ${product.price}",
                              style: const TextStyle(
                                  fontSize: 16, fontFamily: 'serif'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            decoration: const BoxDecoration(color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'serif',
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer<WishlistViewModel>(
          builder: (context, wishlist, _) => Consumer<KeranjangViewModel>(
            builder: (context, keranjang, _) => SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              backgroundColor: Colors.blue.shade400,
              overlayColor: const Color.fromARGB(255, 133, 180, 255),
              overlayOpacity: 0.4,
              spacing: 10,
              children: [
                SpeedDialChild(
                    child: const Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                      size: 30,
                    ),
                    backgroundColor: Colors.yellow.shade50,
                    label: 'add to wishlist',
                    onTap: () async {
                      try {
                        await wishlist
                            .postWishlist({"product_id": "${product.id}"}).then(
                                (value) => Fluttertoast.showToast(
                                    msg: 'added to Wishlist'));
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    }),
                SpeedDialChild(
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                      size: 25,
                    ),
                    backgroundColor: Colors.green.shade50,
                    label: 'add to Keranjang',
                    onTap: () async {
                      try {
                        await keranjang.postKeranjang({
                          "product_id": "${product.id}",
                          "qty": 1.toString()
                        }).then((value) =>
                            Fluttertoast.showToast(msg: 'added to keranjang'));
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future showToast(String message) async {
    await Fluttertoast.cancel();

    Fluttertoast.showToast(msg: message, fontSize: 16);
  }
}
