import 'package:final_project_kel_2/Screens/success_page.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
            children: <Widget>[
              itemCard('Baju', 'baju', '100', 'images/logo.jpg'),
              itemCard('Celana', 'celana', '200', 'images/logo.jpg'),
              itemCard('Sepatu', 'sepatu', '300', 'images/logo.jpg'),
              itemCard('Sweater', 'sweater', '400', 'images/logo.jpg')
            ],
          ),
          const SizedBox(height: 15)
        ]),
      ),
    );
  }

  Widget itemCard(
    itemName,
    category,
    price,
    imgPath,
  ) {
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
                  Container(
                    height: 125.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.contain)),
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            itemName,
                            style: TextStyle(
                                fontFamily: 'serif',
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.blue.shade900),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        'Category: ' + category,
                        style: TextStyle(
                            fontFamily: 'serif',
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0,
                            color: Colors.blue.shade900),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            '\$' + price,
                            style: TextStyle(
                                fontFamily: 'serif',
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                color: Colors.green.shade600),
                          ),
                          const SizedBox(width: 40),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Success()));
                              },
                              child: const Text('CHECKOUT'))
                        ],
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
