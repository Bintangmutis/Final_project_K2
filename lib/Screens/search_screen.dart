import 'dart:async';

import 'package:final_project_kel_2/Screens/search_widget.dart';
import 'package:final_project_kel_2/models/product_model/api/product_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project_kel_2/view_models/product_view_model.dart';
import '../models/product_model/productmodel.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ProductModel> products = [];
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
    final products = await ProductApi.searchProduct(query);

    setState(() => this.products = products);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("title"),
        centerTitle: true,
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, search, _) => Column(
          children: <Widget>[
            buildSearch(),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: search.listProductByCategory.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final data = search.listProductByCategory[index];
                return buildProduct(data);
              },
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: products.length,
            //     itemBuilder: (context, index) {
            //       final book = products[index];

            //       return buildProduct(book);
            //     },
            //   ),
            // ),
          ],
        ),
      ));

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: _searchProduct,
      );

  Future _searchProduct(String query) async => debounce(() async {
        final products = await ProductApi.searchProduct(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.products = products;
        });
      });

  Widget buildProduct(ProductModel product) => ListTile(
        leading: Image.network(
          product.img,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(product.name),
        subtitle: Text(product.category.name),
      );
}
