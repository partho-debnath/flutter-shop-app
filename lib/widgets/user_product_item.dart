import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageURL;
  final double price;
  const UserProductItem({
    super.key,
    required this.title,
    required this.imageURL,
    required this.price,
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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
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
