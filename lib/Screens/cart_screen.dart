import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_2/Screens/success_screen.dart';
import 'package:final_project_kel_2/models/keranjang_model/keranjang_model.dart';
import 'package:final_project_kel_2/view_models/keranjang_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<KeranjangViewModel>(context, listen: false)
          .fetchKeranjang(),
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
          'Keranjang',
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
            children: [_listOfKeranjang(), const SizedBox(height: 20)],
          ),
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
              label: 'Delete Keranjang',
              onTap: () {
                Fluttertoast.showToast(msg: 'Deleting Keranjang');
              }),
          SpeedDialChild(
              child: const Icon(
                Icons.attach_money_rounded,
                color: Colors.green,
                size: 25,
              ),
              backgroundColor: Colors.green.shade50,
              label: 'Checkout All Keranjang',
              onTap: () {
                Fluttertoast.showToast(msg: 'Pembayaran Berhasil');
              }),
        ],
      ),
    );
  }

  Widget _listOfKeranjang() {
    return Consumer<KeranjangViewModel>(
      builder: (context, product, _) => Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: product.listkeranjang.length,
            itemBuilder: (context, index) {
              final data = product.listkeranjang[index];
              return itemCard(data, context);
            },
          ),
        ],
      ),
    );
  }

  Widget itemCard(KeranjangModel keranjang, BuildContext context) {
    return InkWell(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 1),
          child: Container(
              padding: const EdgeInsets.only(left: 15.0, right: 10.0),
              width: MediaQuery.of(context).size.width - 20.0,
              height: 150.0,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 5.0),
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        imageUrl: keranjang.cartProduct.image,
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
                        keranjang.cartProduct.nama,
                        style: TextStyle(
                            fontFamily: 'serif',
                            fontWeight: FontWeight.bold,
                            fontSize: 11.0,
                            color: Colors.blue.shade900),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        'Jumlah: ' + keranjang.quantity.toString(),
                        style: TextStyle(
                            fontFamily: 'serif',
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.blue.shade900),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        '\$' + keranjang.cartProduct.harga.toString(),
                        style: TextStyle(
                            fontFamily: 'serif',
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.green.shade600),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
