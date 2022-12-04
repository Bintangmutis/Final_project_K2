import 'package:final_project_kel_2/Screens/info.dart';
import 'package:final_project_kel_2/Screens/userProfile.dart';
import 'package:final_project_kel_2/models/model.dart';
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
//   bool _searchBoolean = false;
//   List<int> _searchIndexList = [];
//   List<Product> _list = [
//     Product(
//       productId: "1",
//       productImg: "images/contoh_baju.jpeg",
//       productName: "Tshirt",
//       productPrice: "50000",
//     ),
//     Product(
//       productId: "2",
//       productImg: "images/contoh_baju.jpeg",
//       productName: "Sweeter",
//       productPrice: "50000",
//     ),
//     Product(
//       productId: "3",
//       productImg: "images/contoh_baju.jpeg",
//       productName: "Jacket",
//       productPrice: "50000",
//     ),
//   ];

// Widget _searchTextField() {
//     return TextField(
//       onChanged: (String s) {
//         setState(() {
//           _searchIndexList = [];
//           for (int i = 0; i < _list.length; i++) {
//             if (_list[i].contains(s)) {
//               _searchIndexList.add(i);
//             }
//           }
//         });
//       },
//       autofocus: true,
//       cursorColor: Colors.white,
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 20,
//       ),
//       textInputAction: TextInputAction.search,
//       decoration: InputDecoration(
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.white)
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.white)
//         ),
//         hintText: 'Search',
//         hintStyle: TextStyle(
//           color: Colors.white60,
//           fontSize: 20,
//         ),
//       ),
//     );
//   }

//    Widget _searchListView() {
//     return ListView.builder(
//       itemCount: _searchIndexList.length,
//       itemBuilder: (context, index) {
//         index = _searchIndexList[index];
//         return Card(
//           child: ListTile(
//             title: Text(_list[index])
//           )
//         );
//       }
//     );
//   }

//   Widget _defaultListView() {
//     return ListView.builder(
//       itemCount: _list.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             title: Text(_list[index])
//           )
//         );
//       }
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      "Baju",
                      style: TextStyle(
                          fontFamily: 'serif', fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      "Sweater",
                      style: TextStyle(
                          fontFamily: 'serif', fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text(
                      "Celana",
                      style: TextStyle(
                          fontFamily: 'serif', fontWeight: FontWeight.bold),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 3,
                    child: Text(
                      "Sepatu",
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
                } else if (value == 3) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Info()));
                }
              }),
            )),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
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
              Consumer<Products>(
                builder: (context, product, _) => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: product.listProduct.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 300),
                  itemBuilder: (context, index) {
                    final data = product.listProduct[index];
                    return CardProduct(
                      product: data,
                    );
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
