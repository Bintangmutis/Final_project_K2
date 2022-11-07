import 'package:final_project_kel_2/Auth/signup.dart';
import 'package:final_project_kel_2/Screens/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project_kel_2/provider/login_provider.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final loginResponse = Provider.of<LoginProv>(context, listen: false);

    <String, WidgetBuilder>{
      '/signup': (BuildContext context) => const SignUpPage()
    };
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
                      obscureText: _obscure,
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
                              icon: Icon(Icons.remove_red_eye)),
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
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: const Text('Forgot Password?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 47, 200),
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(255, 91, 168, 255),
                                      blurRadius: 10.0,
                                      offset: Offset(3, 2),
                                    ),
                                  ])),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: const Text('Sign Up',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 47, 200),
                                  fontFamily: 'Serif',
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(255, 91, 168, 255),
                                      blurRadius: 10.0,
                                      offset: Offset(3, 2),
                                    ),
                                  ])),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 45,
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: const Color.fromARGB(255, 0, 47, 200),
                        color: const Color.fromARGB(255, 0, 159, 252),
                        elevation: 7,
                        child: GestureDetector(
                            onTap: () {
                              loginResponse.Login(_emailController.text,
                                  _passwordController.text);
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()),
                              );
                            },
                            child: const Center(
                                child: Text('LOGIN',
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
