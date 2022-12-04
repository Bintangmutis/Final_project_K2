import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/product_view_model.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  const CategoryScreen({super.key, required this.categoryName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .fetchProductByCategoryName(widget.categoryName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductViewModel>(
        builder: (context, product, _) => Center(
          child: Text(
              "Jumlah product yang tersedia = ${product.listProductByCategory.length}"),
        ),
      ),
    );
  }
}
