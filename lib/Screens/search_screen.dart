import 'dart:async';

import 'package:final_project_kel_2/Screens/product_screen.dart';
import 'package:final_project_kel_2/Screens/search_widget.dart';
import 'package:final_project_kel_2/models/product_model/api/product_api.dart';
import 'package:final_project_kel_2/models/product_model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/product_view_model.dart';

class SearchScreen extends StatefulWidget {
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
    final products = await ProductViewModel().listProductByCategory;

    setState(() => this._products = products);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("test"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            _listOfSearch(),
          ],
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

  // Widget _listOfSearch() {
  //   return Consumer<ProductViewModel>(
  //     builder: (context, product, _) => Column(
  //       children: [
  //         Expanded(
  //           child: ListView.builder(
  //             itemCount: product.listProductSearch.length,
  //             itemBuilder: (context, index) {
  //               final data = product.listProductSearch[index];
  //               return buildProduct(data, context);
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
