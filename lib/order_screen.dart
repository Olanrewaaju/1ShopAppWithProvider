import 'package:flutter/material.dart';
// import 'package:sneaker_provider/list.dart';
import 'package:sneaker_provider/state_managementfolder.dart/bookmarks.dart';
import 'package:sneaker_provider/state_managementfolder.dart/cart_notifier.dart';
import 'package:sneaker_provider/state_managementfolder.dart/counter.dart';
import 'listmore.dart';
// import 'main.dart';
// import 'list.dart';
import 'package:provider/provider.dart';
// import 'package:sneaker_provider/state_managementfolder.dart/cart_notifier.dart';

class OrderScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  // final String id;
  const OrderScreen({super.key, required this.product});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<String> sizes = ['32', '33', '34', '36', '38', '39', '45'];
  int selectedValue = 0;

  final ValueNotifier<int> counter = ValueNotifier(0);
  final ValueNotifier<bool> favorites = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon(Icons.arrow_back_ios_new_rounded),
            Text('Details Products'),
            Icon(Icons.more_horiz),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              color: const Color.fromARGB(160, 213, 213, 213),
              width: double.infinity,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Padding(padding: EdgeInsetsGeometry.all(40)),
                  Image.asset(height: 180, widget.product['image'] as String),
                ],
              ),
            ),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product['name'] as String,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Consumer<LikedScreen>(
                        builder: (context, provider, child) {
                          final productId = widget.product['id'] as String;
                          final isLiked = provider.isLiked(productId);
                          return IconButton(
                            onPressed: () {
                              provider.toggleLike(productId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: isLiked
                                      ? Text('Removed from Liked')
                                      : Text('Added to liked '),
                                ),
                              );
                              setState(() {
                                favorites.value = !favorites.value;
                              });
                            },
                            color: isLiked
                                ? Color.fromARGB(255, 36, 108, 167)
                                : Colors.black54,
                            icon: isLiked
                                ? Icon(Icons.favorite)
                                : Icon(Icons.favorite_border),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(widget.product['type'] as String),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        widget.product['currentPrice'] as String,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        widget.product['previousPrice'] as String,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(sizes.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: ChoiceChip(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: sizes == index
                                    ? Colors.white
                                    : (Colors.black87),
                              ),
                            ),
                            label: Text(
                              sizes[index],
                              style: TextStyle(
                                color: sizes == index
                                    ? Colors.white
                                    : (Colors.black87),
                              ),
                            ),
                            selected: sizes == index,
                            onSelected: (bool select) {
                              setState(() {
                                selectedValue = select ? index : selectedValue;
                              });
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 023),
                  Text(
                    widget.product['description'] as String,
                    style: TextStyle(color: Colors.black54),
                  ),

                  SizedBox(height: 67),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          // Wrap the entire content in Expanded
                          child: Container(
                            height: 80,
                            color: const Color.fromARGB(255, 237, 236, 236),
                            child: Row(
                              children: [
                                // Counter section
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
                                              value.decrement(
                                                widget.product['id'],
                                              );
                                            },
                                            icon: Icon(Icons.remove),
                                          ),
                                        ),
                                        Text(
                                          '${value.getCount(widget.product['id'])}',
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              value.increment(
                                                widget.product['id'],
                                              );
                                            },
                                            icon: Icon(Icons.add),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),

                                // Button section
                                Expanded(
                                  child: Consumer<CartNotifier>(
                                    builder: (context, cartNotifier, child) {
                                      final isIncart = cartNotifier.cartDetails
                                          .any(
                                            (item) =>
                                                item['id'] ==
                                                widget.product['id'],
                                          );
                                      return ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<CartNotifier>()
                                              .addToCart(widget.product);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text('Added to cart'),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Proceed',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                          ),
                                          fixedSize: WidgetStatePropertyAll(
                                            Size(double.infinity, 52),
                                          ),
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                const Color.fromARGB(
                                                  255,
                                                  36,
                                                  108,
                                                  167,
                                                ),
                                              ),
                                          // ...existing button style...
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
