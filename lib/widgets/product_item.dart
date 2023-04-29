import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  void _changeScreen(BuildContext cntxt) {
    /// Go to Product Detail Screen.
    Navigator.of(cntxt).pushNamed(ProductDetailScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
          ),
        ),
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () => _changeScreen(context),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
