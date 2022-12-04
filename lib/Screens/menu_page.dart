import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project_kel_2/Screens/category_screen.dart';
import 'package:final_project_kel_2/Screens/product_detail.dart';
import 'package:final_project_kel_2/Screens/user_profile.dart';
import 'package:final_project_kel_2/models/product_model/productmodel.dart';
import 'package:final_project_kel_2/view_models/product_view_model.dart';
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
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .fetchProductByCategoryName("k2"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Menu Page',
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CategoryScreen(categoryName: "k2_baju")));
                } else if (value == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryScreen(
                              categoryName: "k2_sweater")));
                } else if (value == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CategoryScreen(categoryName: "k2_celana")));
                } else if (value == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const CategoryScreen(categoryName: "k2_sepatu")));
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
                  MaterialPageRoute(builder: (context) => const UserProfile()),
                );
              },
              icon: const Icon(Icons.person),
            ),
          ),
        ],
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ===== MENU =====
                const SizedBox(
                  height: 8,
                ),
                _listOfProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listOfProducts() {
    return Consumer<ProductViewModel>(
      builder: (context, product, _) => Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: product.listProductByCategory.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final data = product.listProductByCategory[index];
              return _cardProduct(data, context);
            },
          ),
        ],
      ),
    );
  }
}

Widget _cardProduct(ProductModel product, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetail(product: product)));
    },
    child: Card(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: product.img,
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
              fit: BoxFit.fill,
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 62, 65, 102),
                ),
              ),
              Text(
                product.price.toString(),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 62, 65, 102),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
