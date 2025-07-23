import 'package:flutter/material.dart';
import 'package:sneaker_provider/more_holder.dart';
import 'package:sneaker_provider/order_screen.dart';
import 'listmore.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({super.key});

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon(Icons.arrow_back_ios_new_rounded),
            Text('More Products'),
            Icon(Icons.more_horiz),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // height: 290,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 4,
                childAspectRatio: 0.7,
                physics: NeverScrollableScrollPhysics(),

                children: List.generate(sneakers.length, (index) {
                  final product = sneakers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrderScreen(product: product);
                          },
                        ),
                      );
                    },
                    child: MoreHolder(
                      currentPrice: product['currentPrice'] as String,
                      image: product['image'] as String,
                      name: product['name'] as String,
                      type: product['type'] as String,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
