import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Anton',
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      initialRoute: ProductsOverviewScreen.routeName,
      routes: {
        ProductsOverviewScreen.routeName: (cntxt) => ProductsOverviewScreen(),
        ProductDetailScreen.routeName: (cntxt) => const ProductDetailScreen(),
      },
    );
  }
}
