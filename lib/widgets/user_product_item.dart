import 'package:flutter/material.dart';

import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final double price;
  final void Function(String) onDelete;
  const UserProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageURL,
    required this.price,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: FittedBox(
            fit: BoxFit.cover,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageURL),
            ),
          ),
          title: Text(title),
          subtitle: Text('Tk ${price.toStringAsFixed(2)}'),
          trailing: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      EditProductScreen.routeName,
                      arguments: id,
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onDelete(id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
