import 'dart:async';

import 'package:final_project_kel_2/Screens/product_screen.dart';
import 'package:final_project_kel_2/Screens/search_widget.dart';
import 'package:final_project_kel_2/models/product_model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/product_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .fetchProductByCategoryName("k2"),
    );
    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .searchProductByName("k2"),
    );
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    // final products = await ProductApi().searchProduct(query);
    // ignore: await_only_futures
    final products = await ProductViewModel().listProductByCategory;

    // ignore: unnecessary_this
    setState(() => this._products = products);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search Product',
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
          centerTitle: true,
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
          child: Column(
            children: <Widget>[
              buildSearch(),
              _listOfSearch(),
            ],
          ),
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Name or Category Product',
        onChanged: searchBook,
      );

  Widget _listOfSearch() {
    return Consumer<ProductViewModel>(
      builder: (context, search, _) => query == ''
          ? Expanded(
              child: ListView.builder(
                itemCount: search.listProductByCategory.length,
                itemBuilder: (context, index) {
                  final data = search.listProductByCategory[index];
                  return buildProduct(data, context);
                },
              ),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: search.listProductSearch.length,
                itemBuilder: (context, index) {
                  final data = search.listProductSearch[index];
                  return buildProduct(data, context);
                },
              ),
            ),
    );
  }

  Future searchBook(String query) async => debounce(() async {
        Provider.of<ProductViewModel>(context, listen: false)
            .searchProductByName(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
        });
      });

  Widget buildProduct(ProductModel product, BuildContext context) =>
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetail(product: product)));
        },
        child: ListTile(
          leading: Image.network(
            product.img,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          title: Text(product.name),
          subtitle: Text(product.category.name),
        ),
      );
}
