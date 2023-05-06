import 'dart:math';

import 'package:flutter/material.dart';

import '../providers/orders.dart' as order_item;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final order_item.OrderItem order;
  const OrderItem({super.key, required this.order});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Tk ${widget.order.amount.toStringAsFixed(2)}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy, hh:mmm').format(widget.order.dateTime)),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(
                  _expanded == false ? Icons.expand_more : Icons.expand_less),
            ),
          ),
          if (_expanded == true)
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: min(widget.order.products.length * 20.0 + 100, 180),
              color: const Color.fromARGB(255, 238, 236, 236),
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: (cntxt, index) => ListTile(
                  title: Text(widget.order.products[index].title),
                  subtitle: Text('1 x ${widget.order.products[index].price}'),
                  trailing: Text('${widget.order.products[index].quantity} x'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
