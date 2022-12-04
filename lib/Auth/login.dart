import 'package:final_project_kel_2/Auth/signup.dart';
import 'package:final_project_kel_2/Screens/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:final_project_kel_2/provider/login_provider.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginResponse = Provider.of<LoginProv>(context);

    <String, WidgetBuilder>{
      '/signup': (BuildContext context) => const SignUpPage()
    };
    Widget logo = const CircleAvatar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 50.0),
          children: <Widget>[
            Center(child: logo),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(top: 8, left: 20, right: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue.shade200,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                    color: Colors.blue.shade200, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                    color: Colors.blue.shade100, width: 1.0)),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              fontFamily: "Serif",
                            ),
                            prefixIcon: const Icon(Icons.person,
                                color: Color.fromARGB(255, 0, 110, 255))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue.shade200,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(
                                color: Colors.blue.shade200, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(
                                color: Colors.blue.shade100, width: 1.0)),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontFamily: "Serif",
                        ),
                        prefixIcon: const Icon(Icons.lock,
                            color: Color.fromARGB(255, 0, 110, 255)),
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
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    //ini button login
                    SizedBox(
                      height: 45.0,
                      child: MaterialButton(
                        onPressed: () async {
                          var formLogin = loginResponse.login(
                              _emailController.text, _passwordController.text);

                          try {
                            await formLogin.then((value) =>
                                Fluttertoast.showToast(msg: 'berhasil login')
                                    .then((value) =>
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const BottomNav()),
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
                              "LOGIN",
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
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Belum Punya Akun? ',
                          style: TextStyle(
                            fontFamily: "Serif",
                          ),
                        ),
                        const SizedBox(width: 1.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: const Center(
                            child: Text('Register Sekarang',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Serif",
                                  color: Color.fromARGB(255, 68, 85, 195),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            //ini batas container
          ],
        ),
      ),
    );
  }
}
