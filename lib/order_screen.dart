import 'package:flutter/material.dart';
import 'main.dart';

class OrderScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const OrderScreen({super.key, required this.product});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<String> sizes = ['32', '33', '34', '36', '38', '39', '45'];
  int selectedValue = 0;
  // int counter = 0;
  // void subtract() {
  //   setState(() {
  //     counter--;
  //   });
  // }

  // void adder() {
  //   setState(() {
  //     counter++;
  //   });
  // }
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
                      ValueListenableBuilder(
                        valueListenable: favorites,
                        builder: (context, value, child) {
                          return IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: value
                                      ? Text('Added to liked ')
                                      : Text('Removed from Liked'),
                                ),
                              );
                              setState(() {
                                favorites.value = !favorites.value;
                              });
                            },
                            color: value
                                ? Colors.black54
                                : const Color.fromARGB(255, 36, 108, 167),
                            icon: value
                                ? Icon(Icons.favorite_border)
                                : Icon(Icons.favorite),
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
                    child: ValueListenableBuilder(
                      valueListenable: counter,
                      builder: (context, value, child) {
                        return Container(
                          height: 80,
                          color: const Color.fromARGB(255, 237, 236, 236),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    if (counter.value > 0) {
                                      counter.value--;
                                    }
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ),
                              Text('${counter.value}'),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    counter.value++;
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
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
                                    backgroundColor: WidgetStatePropertyAll(
                                      const Color.fromARGB(255, 36, 108, 167),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
