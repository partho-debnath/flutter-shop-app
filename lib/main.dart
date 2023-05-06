import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products_provider.dart';
import './providers/cart.dart';
import './providers/orders.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (cntxt) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (cntxt) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (cntxt) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // fontFamily: 'Anton',
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
        ),
        initialRoute: ProductsOverviewScreen.routeName,
        routes: {
          ProductsOverviewScreen.routeName: (cntxt) =>
              const ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (cntxt) => const ProductDetailScreen(),
          CartScreen.routeName: (cntxt) => const CartScreen(),
          OrdersScreen.routeName: (cntxt) => const OrdersScreen(),
        },
      ),
    );
  }
}
