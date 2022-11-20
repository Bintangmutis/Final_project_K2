import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Info extends StatelessWidget {
  const Info({super.key});
  @override
  Widget build(BuildContext context) {
    Widget content1 = const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      radius: 100,
      child: CircleAvatar(
        radius: 95,
        backgroundImage: AssetImage('images/logo.jpg'),
      ),
    );

    Widget content2 = Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(2, 4), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: const [
          Center(
            child: Text(
              '"GO-SHOP"',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Serif',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 72, 130),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'GO-SHOP adalah marketplace yang menyediakan barang kesukaan anda. mulai dari baju, celana, hingga sepatu. Tunggu apalagi segera cek barang yang ada di GO-SHOP dan temukan kemudahan belanja yang dapat ada temukan di GO-SHOP',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 13.0,
                fontFamily: 'Serif',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(236, 0, 72, 130),
              ),
            ),
          ),
        ],
      ),
    );

    Widget content3 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GFButton(
          boxShadow: const BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(4, 3), // Shadow position
          ),
          onPressed: () {},
          text: "Facebook",
          textColor: Colors.black,
          icon: const Icon(Icons.facebook),
          shape: GFButtonShape.pills,
          color: Colors.blue.shade400,
        ),
        const SizedBox(
          width: 10,
        ),
        GFButton(
          boxShadow: const BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(4, 3), // Shadow position
          ),
          color: Colors.blue.shade200,
          onPressed: () {},
          text: "Twitter",
          textColor: Colors.black,
          icon: const Icon(FontAwesomeIcons.twitter),
          shape: GFButtonShape.pills,
        ),
        const SizedBox(
          width: 10,
        ),
        GFButton(
          boxShadow: const BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(4, 3), // Shadow position
          ),
          onPressed: () {},
          text: "Instagram",
          textColor: Colors.black,
          icon: const Icon(
            FontAwesomeIcons.instagram,
          ),
          shape: GFButtonShape.pills,
          color: Colors.red.shade200,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 71, 147, 248),
        shadowColor: const Color.fromARGB(255, 0, 11, 106),
        centerTitle: true,
        title: const Text(
          'ABOUT GO-SHOP',
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/info_blur.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(shrinkWrap: true, children: <Widget>[
            content1,
            const SizedBox(
              height: 5,
            ),
            content2,
            const SizedBox(
              height: 20,
            ),
            content3
          ]),
        ),
      ),
    );
  }
}
