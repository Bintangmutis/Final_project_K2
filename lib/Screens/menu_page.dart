import 'package:final_project_kel_2/Screens/info.dart';
import 'package:final_project_kel_2/Screens/userProfile.dart';
import 'package:final_project_kel_2/models/productmodel.dart';
import 'package:final_project_kel_2/provider/card_product.dart';
import 'package:final_project_kel_2/provider/product_provider.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 71, 147, 248),
              borderRadius: BorderRadius.circular(8),
            ),
            child: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "Kategori 1",
                      style: TextStyle(
                          fontFamily: 'serif', fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      "Kategori 2",
                      style: TextStyle(
                          fontFamily: 'serif', fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text(
                      "Kategori 3",
                      style: TextStyle(
                          fontFamily: 'serif', fontWeight: FontWeight.bold),
                    ),
                  ),
                ];
              },
              onSelected: ((value) {
                if (value == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Info()));
                } else if (value == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Info()));
                } else if (value == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Info()));
                }
              }),
            )),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const userProfile()));
              },
              icon: const Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ===== MENU =====
              const SizedBox(
                height: 8,
              ),
              Consumer<List<ProductData>>(
                builder: (context, product, _) => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: product.length < 2 ? product.length : 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                    mainAxisExtent: 300,
                  ),
                  itemBuilder: (context, index) {
                    final data = product[index];
                    return CardProduct();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
