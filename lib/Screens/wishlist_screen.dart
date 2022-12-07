import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_2/models/wishlist_model/wishlist_model.dart';
import 'package:final_project_kel_2/view_models/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<WishlistViewModel>(context, listen: false)
          .fetchWishlist(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 71, 147, 248),
        shadowColor: const Color.fromARGB(255, 0, 11, 106),
        centerTitle: true,
        title: const Text(
          'Wishlist',
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
        child: ListView(children: [
          Column(
            children: <Widget>[_listOfWishlist()],
          ),
          const SizedBox(height: 15)
        ]),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.blue.shade400,
        overlayColor: const Color.fromARGB(255, 133, 180, 255),
        overlayOpacity: 0.4,
        spacing: 10,
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
              backgroundColor: Colors.yellow.shade50,
              label: 'Delete Wishlist',
              onTap: () {
                Fluttertoast.showToast(msg: 'Deleting Wishlist');
              }),
          SpeedDialChild(
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.green,
                size: 25,
              ),
              backgroundColor: Colors.green.shade50,
              label: 'Add all to Keranjang',
              onTap: () {
                Fluttertoast.showToast(msg: 'Wishlist dimasukan ke keranjang');
              }),
        ],
      ),
    );
  }

  Widget _listOfWishlist() {
    return Consumer<WishlistViewModel>(
      builder: (context, productlist, _) => Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productlist.listwishlist.length,
            itemBuilder: (context, index) {
              final data = productlist.listwishlist[index];
              return itemCard(data, context);
            },
          ),
        ],
      ),
    );
  }

  Widget itemCard(WishListModel wishlist, BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 1),
        child: Container(
          padding: const EdgeInsets.only(left: 15.0, right: 10.0),
          width: MediaQuery.of(context).size.width - 20.0,
          height: 150.0,
          decoration: BoxDecoration(
              color: Colors.white54, borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 5.0),
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: wishlist.product.image,
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
              const SizedBox(width: 15.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    wishlist.product.nama,
                    style: TextStyle(
                        fontFamily: 'serif',
                        fontWeight: FontWeight.bold,
                        fontSize: 11.0,
                        color: Colors.blue.shade900),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    'Stock ' + wishlist.product.jumlah.toString(),
                    style: TextStyle(
                        fontFamily: 'serif',
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: Colors.blue.shade900),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    '\$' + wishlist.product.harga.toString(),
                    style: TextStyle(
                        fontFamily: 'serif',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.green.shade600),
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
