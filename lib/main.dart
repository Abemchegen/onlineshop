import 'package:flutter/material.dart';
import 'package:onlineshop/models/catagory.dart';
import 'package:onlineshop/pages/cart_page.dart';
import 'package:onlineshop/pages/intro_page.dart';
import 'package:onlineshop/pages/shop_page.dart';
import 'package:onlineshop/theme/light_mode.dart';
import 'package:provider/provider.dart';
import 'package:onlineshop/models/shop.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Shop()),
      ChangeNotifierProvider(create: (context) => CategoryProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightmode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
