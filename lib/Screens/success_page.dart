import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    Widget check = const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 104, 162, 255),
      radius: 120,
      child: CircleAvatar(
        radius: 110,
        backgroundImage: AssetImage(
          'images/successs.gif',
        ),
      ),
    );

    Widget button = SizedBox(
      height: 45.0,
      child: MaterialButton(
        onPressed: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: const Text(
              "Back to Homepage",
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
        child: ListView(
          padding: const EdgeInsets.only(top: 120.0),
          children: [
            Center(child: check),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'ORDER SUCCESS!!',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 73, 220),
                ),
              ),
            ),
            const SizedBox(height: 260),
            Center(
              child: button,
            )
          ],
        ),
      ),
    );
  }
}
