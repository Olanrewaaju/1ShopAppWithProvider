import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sneaker_provider/state_managementfolder.dart/cart_notifier.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    final cartDetails = context.watch<CartNotifier>().cartDetails;
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cartDetails.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartDetails.length,
              itemBuilder: (_, index) {
                final item = cartDetails[index];
                return ListTile(
                  leading: Image.asset(
                    item['image'] as String,
                    height: 40,
                    // width: 30,
                  ),
                  title: Text(item['name']),
                  subtitle: Text(item['currentPrice'] as String),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<CartNotifier>().removeFromCart(item['id']);
                    },
                  ),
                );
              },
            ),
    );
  }
}
