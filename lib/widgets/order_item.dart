import 'package:flutter/material.dart';

import '../providers/orders.dart' as order_item;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final order_item.OrderItem order;
  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Tk ${order.amount.toStringAsFixed(2)}'),
            subtitle:
                Text(DateFormat('dd MM YYY hh:mmm').format(order.dateTime)),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.expand_more),
            ),
          ),
        ],
      ),
    );
  }
}
