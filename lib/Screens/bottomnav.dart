import 'package:final_project_kel_2/Screens/info.dart';
import 'package:final_project_kel_2/Screens/menu_page.dart';
import 'package:final_project_kel_2/Screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List widgetOptions = const [
    MenuPage(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Info()
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {ProductDetail.routeName: (context) => const ProductDetail()},
      home: Scaffold(
        body: widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue.shade100,
          // currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 32,
                  color: Colors.blue,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star_rounded,
                  size: 32,
                  color: Colors.blue,
                ),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  size: 32,
                  color: Colors.blue,
                ),
                label: 'Keranjang'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  size: 32,
                  color: Colors.blue,
                ),
                label: 'About Go-Shop'),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
