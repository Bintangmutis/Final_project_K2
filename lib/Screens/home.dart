import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:final_project_kel_2/Auth/login.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  var colorizeColors = [
    const Color.fromARGB(255, 0, 140, 255),
    Colors.white,
    Colors.blue.shade900,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    Widget logo = const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      radius: 100,
      child: CircleAvatar(
        radius: 95,
        backgroundImage: AssetImage('images/logo.jpg'),
      ),
    );

    Widget judul = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Selamat Datang di ',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Serif',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Center(
          child: AnimatedTextKit(
            pause: const Duration(milliseconds: 5000),
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText("GO-SHOP",
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
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
        fontWeight: FontWeight.bold,
        fontSize: 12.5,
        fontFamily: 'Serif',
        color: Color.fromARGB(255, 255, 255, 255),
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

    Widget buttonhome = SizedBox(
      height: 45.0,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 68, 85, 195), Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: const Text(
              "Continue",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Serif",
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(shrinkWrap: true, children: <Widget>[
            logo,
            const SizedBox(
              height: 10,
            ),
            judul,
            const SizedBox(
              height: 5,
            ),
            Center(child: desc),
            const SizedBox(
              height: 50,
            ),
            Center(child: buttonhome)
          ]),
        ),
      ),
    );
  }
}
