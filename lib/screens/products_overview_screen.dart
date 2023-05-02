import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum POPUPMENU {
  favorite,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const String routeName = "/home-page";
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          Consumer<Cart>(
            builder: (cntxt, cart, child) => MyBadge(
              value: cart.totalItem,
              child: child as Widget,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          PopupMenuButton<POPUPMENU>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (cntxt) => [
              const PopupMenuItem(
                value: POPUPMENU.favorite,
                child: Text('Favorites'),
              ),
              const PopupMenuItem(
                value: POPUPMENU.all,
                child: Text('Show All'),
              ),
            ],
            onSelected: (POPUPMENU value) {
              setState(() {
                switch (value) {
                  case POPUPMENU.favorite:
                    _showOnlyFavorites = true;
                    break;
                  case POPUPMENU.all:
                    _showOnlyFavorites = false;
                }
              });
            },
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
