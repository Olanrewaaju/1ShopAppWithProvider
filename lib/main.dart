import 'package:flutter/material.dart';
import 'package:sneaker_provider/bottom_bar.dart';
// import 'package:sneaker_provider/homescreen.dart';
// import 'package:sneaker_provider/homescreen.dart';
// import 'package:sneaker_provider/list.dart';
// import 'package:sneaker_provider/login_screen.dart';
// import 'package:sneaker_provider/order_screen.dart';
// import 'package:sneaker_provider/see_more.dart';
// import 'arrivals.dart';

// import 'best_sellers.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_provider/login_screen.dart';
import 'package:sneaker_provider/state_managementfolder.dart/bookmarks.dart';
import 'package:sneaker_provider/state_managementfolder.dart/cart_notifier.dart';
import 'package:sneaker_provider/state_managementfolder.dart/counter.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return LikedScreen();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return CartNotifier();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Counter();
          },
        ),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lato',
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.w400),
          headlineMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          headlineSmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),

          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black45,
          ),
        ),
      ),
      home: LoginScreen(),
      // OrderScreen(i

      //   product: products[0]),
      // );
    );
  }
}
