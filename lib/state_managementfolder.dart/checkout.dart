import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_provider/button.dart';
import 'package:sneaker_provider/loading.dart';

import 'package:sneaker_provider/state_managementfolder.dart/cart_notifier.dart';
import 'package:sneaker_provider/state_managementfolder.dart/counter.dart';

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
      appBar: AppBar(title: Text('Cart'), automaticallyImplyLeading: false),

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
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['currentPrice'] as String),
                      Consumer<Counter>(
                        builder: (context, value, child) {
                          return Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    value.decrement(item['id']);
                                  },
                                  icon: Icon(Icons.remove, size: 14),
                                ),
                              ),
                              Text('${value.getCount(item['id'])}'),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    value.increment(item['id']);
                                  },
                                  icon: Icon(Icons.add, size: 14),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<CartNotifier>().removeFromCart(item['id']);
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Loading();
                  },
                ),
              );
            },
            child: Text('Proceed', style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              fixedSize: WidgetStatePropertyAll(Size(double.infinity, 52)),
              backgroundColor: WidgetStatePropertyAll(
                const Color.fromARGB(255, 36, 108, 167),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
