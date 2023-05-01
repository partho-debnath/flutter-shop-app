import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../models/product.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductsProvider product =
        Provider.of<ProductsProvider>(context, listen: true);
    final List<Product> products = product.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (cntxt, index) => ProductItem(
        id: products[index].id,
        title: products[index].title,
        price: products[index].price,
        imageUrl: products[index].imageUrl,
      ),
    );
  }
}
