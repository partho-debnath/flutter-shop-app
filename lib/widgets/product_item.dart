import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final double price;
  // final String imageUrl;

  const ProductItem({
    super.key,
    // required this.id,
    // required this.title,
    // required this.price,
    // required this.imageUrl,
  });

  void _changeScreen(BuildContext cntxt, String id) {
    /// Go to Product Detail Screen.
    Navigator.of(cntxt).pushNamed(
      ProductDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        header: Container(
          color: Colors.black54,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            product.title,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Lato',
              fontSize: 20,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (cntxt, product1, child) => IconButton(
              onPressed: () {
                product1.toggleFavoriteStatus();
              },
              icon: Icon(product1.isFavorite == true
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(
            product.price.toStringAsFixed(3),
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
          onTap: () => _changeScreen(context, product.id),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
