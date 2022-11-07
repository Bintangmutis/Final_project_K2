import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:final_project_kel_2/Auth/login.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  var colorizeColors = [
    const Color.fromARGB(255, 62, 65, 102),
    Colors.blue,
    Colors.white,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    Widget logo = Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset.fromDirection(-15, -4))
        ],
      ),
      child: Image.asset(
        'images/home.png',
        colorBlendMode: BlendMode.softLight,
      ),
    );

    Widget judul = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Selamat Datang ',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Serif',
            color: Color.fromARGB(255, 62, 65, 102),
          ),
        ),
        Center(
          child: AnimatedTextKit(
            pause: const Duration(milliseconds: 5000),
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText("GO-SHOP",
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Serif',
                  ),
                  colors: colorizeColors)
            ],
          ),
        ),
      ],
    );

    Widget desc = DefaultTextStyle(
      style: const TextStyle(
        fontSize: 13.5,
        fontFamily: 'Serif',
        color: Color.fromARGB(255, 62, 65, 102),
      ),
      child: AnimatedTextKit(
        pause: const Duration(milliseconds: 5000),
        repeatForever: true,
        animatedTexts: [
          TypewriterAnimatedText(
              'Temukan Barang Idaman Anda Dengan Harga Terbaik'),
        ],
      ),
    );

    return Scaffold(
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
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            logo,
            const SizedBox(
              height: 30,
            ),
            judul,
            const SizedBox(
              height: 9,
            ),
            Center(child: desc),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                color: const Color.fromARGB(255, 0, 159, 252),
                textColor: Colors.white,
                minWidth: 350,
                height: 45,
                child: const Text(
                  'Lets Go',
                  style: TextStyle(
                      fontFamily: "Serif", fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
