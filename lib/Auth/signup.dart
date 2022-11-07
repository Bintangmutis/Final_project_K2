import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget logo = const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 104, 162, 255),
      radius: 100,
      child: CircleAvatar(
        radius: 95,
        backgroundImage: AssetImage('images/logo.jpg'),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 71, 147, 248),
          shadowColor: const Color.fromARGB(255, 0, 11, 106),
          centerTitle: true,
          title: const Text(
            'GO-SHOP',
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
          )),
          child: ListView(
            padding: const EdgeInsets.only(top: 50.0),
            children: <Widget>[
              Center(child: logo),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 30),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              fontFamily: 'Serif',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 92, 90, 90)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 12, 124)),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          ),
                          labelStyle: TextStyle(
                              fontFamily: 'Serif',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 92, 90, 90)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 12, 124)),
                          )),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: _passwordConfirmController,
                      decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          ),
                          labelStyle: TextStyle(
                              fontFamily: 'Serif',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 92, 90, 90)),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 12, 124)),
                          )),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    SizedBox(
                      height: 45,
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: const Color.fromARGB(255, 0, 47, 200),
                        color: const Color.fromARGB(255, 0, 159, 252),
                        elevation: 7,
                        child: GestureDetector(
                            onTap: () {},
                            child: const Center(
                                child: Text('SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Serif')))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
