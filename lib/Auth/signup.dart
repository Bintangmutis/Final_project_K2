import 'package:final_project_kel_2/Auth/login.dart';
import 'package:final_project_kel_2/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _handphoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  bool _obscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final SignupResponse = Provider.of<SignupProv>(context);

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
                      controller: username,
                      decoration: const InputDecoration(
                          labelText: 'Name',
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
                      controller: _handphoneController,
                      decoration: const InputDecoration(
                          labelText: 'Handphone',
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
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_obscure) {
                                  _obscure = false;
                                } else {
                                  _obscure = true;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                          labelStyle: const TextStyle(
                              fontFamily: 'Serif',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 92, 90, 90)),
                          focusedBorder: const UnderlineInputBorder(
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
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_obscure) {
                                  _obscure = false;
                                } else {
                                  _obscure = true;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                          labelStyle: const TextStyle(
                              fontFamily: 'Serif',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 92, 90, 90)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 12, 124)),
                          )),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      height: 45.0,
                      child: MaterialButton(
                        onPressed: () async {
                          var formSignup = SignupResponse.signup(
                              username.text,
                              _emailController.text,
                              _handphoneController.text,
                              _passwordController.text,
                              _passwordConfirmController.text);

                          try {
                            await formSignup.then((value) =>
                                Fluttertoast.showToast(msg: 'berhasil register')
                                    .then((value) =>
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()),
                                        )));
                          } catch (e) {
                            Fluttertoast.showToast(msg: e.toString());
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 68, 85, 195),
                                  Color(0xff64B6FF)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: const BoxConstraints(
                                maxWidth: 400.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Serif",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
