import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;

import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders-screen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Orders ordersProvider = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: ordersProvider.orders.length,
        itemBuilder: (cntxt, index) => OrderItem(
          order: ordersProvider.orders[index],
        ),
      ),
    );
  }
}
