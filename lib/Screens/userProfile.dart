// ignore: file_names
import 'package:final_project_kel_2/Screens/bottomnav.dart';
import 'package:final_project_kel_2/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

// ignore: camel_case_types
class _userProfileState extends State<userProfile> {
  @override
  Widget build(BuildContext context) {
    Widget button = SizedBox(
      height: 45.0,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BottomNav()));
        },
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
            constraints: const BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 71, 147, 248),
        shadowColor: const Color.fromARGB(255, 0, 11, 106),
        centerTitle: true,
        title: const Text(
          'User Profile',
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
        child: SafeArea(
            child: Consumer<LoginProv>(
          builder: (context, login, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/Profile.jpeg'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                login.user.userData.userDetail.name,
                style: const TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
              Text(
                login.user.userData.userDetail.role,
                style: const TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    letterSpacing: 2.5),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 0, 178, 248),
                    width: 2.0,
                  ),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.solidIdCard,
                    color: Color.fromARGB(255, 133, 180, 255),
                  ),
                  title: Text(login.user.userData.userDetail.id.toString()),
                ),
              ),
              Card(
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 0, 178, 248),
                    width: 2.0,
                  ),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(
                    Icons.email_rounded,
                    color: Color.fromARGB(255, 133, 180, 255),
                  ),
                  title: Text(login.user.userData.userDetail.email),
                ),
              ),
              Card(
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Color.fromARGB(255, 0, 178, 248),
                    width: 2.0,
                  ),
                ),
                margin:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.squarePhone,
                    color: Color.fromARGB(255, 133, 180, 255),
                  ),
                  title: Text(login.user.userData.userDetail.handphone),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              button
            ],
          ),
        )),
      ),
    );
  }
}