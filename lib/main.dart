import 'package:final_project_kel_2/Screens/home.dart';
import 'package:final_project_kel_2/Screens/product_detail.dart';
import 'package:final_project_kel_2/models/productmodel.dart';
import 'package:final_project_kel_2/provider/api/product_api.dart';
import 'package:final_project_kel_2/provider/card_product.dart';
import 'package:final_project_kel_2/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project_kel_2/provider/login_provider.dart';
import 'package:final_project_kel_2/provider/signup_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignupProv(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductApi(),
        ),
        ChangeNotifierProvider(
          create: (context) => CardProductData(),
        ),
      ],
      child: MaterialApp(
        routes: {
          ProductDetail.routeName: (context) => const ProductDetail(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
