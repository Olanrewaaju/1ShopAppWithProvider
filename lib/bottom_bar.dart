import 'package:flutter/material.dart';
import 'package:sneaker_provider/state_managementfolder.dart/checkout.dart';

import 'homescreen.dart';
import 'see_more.dart';

import 'package:sneaker_provider/state_managementfolder.dart/liked_display.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  ValueNotifier<bool> iconWitBorder = ValueNotifier(false);

  int currentpage = 0;

  final List<Widget> screens = [
    Homescreen(),
    SeeMore(),
    LikedProductsDisplayScreen(),
    Checkout(),
    Homescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentpage, children: screens),

      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: iconWitBorder,
        builder: (context, stuff, child) {
          return BottomNavigationBar(
            elevation: 9,
            selectedItemColor: Color.fromARGB(255, 36, 108, 167),
            unselectedItemColor: Colors.black45,
            selectedLabelStyle: TextStyle(
              color: Color.fromARGB(255, 36, 108, 167),
            ),
            unselectedLabelStyle: TextStyle(color: Colors.black45),
            currentIndex: currentpage,
            onTap: (value) {
              setState(() {
                currentpage = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: stuff
                    ? Icon(Icons.home_outlined)
                    : Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_open_rounded),
                label: 'All Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_add_outlined),

                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_rounded),

                label: 'Checkout',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
