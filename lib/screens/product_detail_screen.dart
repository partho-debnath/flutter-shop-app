import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/product detail";
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    final Product product = productsProvider.getProduct(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Text(product.description),
      ),
    );
  }
}
