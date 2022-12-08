import 'dart:async';

import 'package:final_project_kel_2/Screens/product_screen.dart';
import 'package:final_project_kel_2/Screens/search_widget.dart';
import 'package:final_project_kel_2/models/product_model/api/product_api.dart';
import 'package:final_project_kel_2/models/product_model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/product_view_model.dart';

class SearchCoba extends StatefulWidget {
  @override
  SearchCobaState createState() => SearchCobaState();
}

class SearchCobaState extends State<SearchCoba> {
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
    final products = ProductViewModel().listProductByCategory;

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
            _filter(),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Name or Category Product',
        onChanged: searchBook,
      );

  Widget _filter() {
    return query == '' ? _listOfProducts() : _listOfSearch();
  }

  Widget _listOfSearch() {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final data = products[index];
          return buildProduct(data, context);
        },
      ),
    );
  }

  Future searchBook(String query) async => debounce(() async {
        final products = await ProductApi().searchProduct(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this._products = products;
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
  Widget _listOfProducts() {
    return Consumer<ProductViewModel>(
      builder: (context, product, _) => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final data = products[index];
                return buildProduct(data, context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
