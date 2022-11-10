import 'package:final_project_kel_2/Screens/product_detail.dart';
import 'package:final_project_kel_2/provider/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class MenuPage extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // const MenuPage({super.key});
  // final List<String> item = [
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  //   "T-shirt",
  // ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool shadowColor = false;
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context).listProduct;

    return MaterialApp(
      routes: {ProductDetail.routeName: (context) => ProductDetail()},
      home: Scaffold(
        extendBody: true,
        // primary: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_list),
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // ===== MENU =====
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: productData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 300),
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: productData[index],
                      child: CardProduct(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.star_border_outlined),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.add_shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
              backgroundColor: Colors.blue,
            ),
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
