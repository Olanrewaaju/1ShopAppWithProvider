import 'package:flutter/material.dart';
import 'package:sneaker_provider/arrivals.dart';
import 'package:sneaker_provider/best_sellers.dart';
import 'package:sneaker_provider/listmore.dart';
import 'package:sneaker_provider/order_screen.dart';
import 'package:sneaker_provider/see_more.dart';
// import 'package:sneaker_provider/sellers.dart';
// import 'arrivals.dart';
import 'list.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> selectedChips = ['Women', 'Men', 'Kids', 'Sports', 'Fashion'];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, size: 18),
            Text('Fits4Feet', style: TextStyle(fontWeight: FontWeight.w400)),
            Icon(Icons.notifications, size: 18),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Container(
                  color: Colors.brown,
                  width: double.infinity,
                  child: Column(children: [Text('PlaceHolder Text')]),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today\'s Special',
                    style: TextTheme.of(context).titleLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SeeMore();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'See More',
                      style: TextTheme.of(context).titleSmall,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 250,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (child, value) {
                    final product = products[value];
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
                      child: Arrivals(
                        currentPrice: product['currentPrice'] as String,
                        image: product['image'] as String,
                        name: product['name'] as String,
                        type: product['type'] as String,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Sellers', style: TextTheme.of(context).titleLarge),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SeeMore();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'See More',
                      style: TextTheme.of(context).titleSmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(selectedChips.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text(
                          selectedChips[index],
                          style: TextStyle(
                            color: selected == index
                                ? Colors.white
                                : (Colors.black87),
                          ),
                        ),
                        selected: selected == index,
                        selectedColor: Color.fromARGB(255, 36, 108, 167),

                        checkmarkColor: Colors.white,
                        onSelected: (bool selectedValue) {
                          setState(() {
                            selected = selectedValue ? index : selected;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16),
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
                      child: BestSellers(
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
      ),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 9,
        selectedItemColor: Color.fromARGB(255, 36, 108, 167),
        unselectedItemColor: Colors.black45,
        selectedLabelStyle: TextStyle(color: Color.fromARGB(255, 36, 108, 167)),
        unselectedLabelStyle: TextStyle(color: Colors.black45),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add_outlined),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
