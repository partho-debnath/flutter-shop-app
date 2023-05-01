import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products_provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (cntxt) => ProductsProvider(),
      child: MaterialApp(
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
      ),
    );
  }
}
