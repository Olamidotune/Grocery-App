import 'package:flutter/material.dart';
import 'package:grocery_app/features/cart/ui/cart_screen.dart';
import 'package:grocery_app/features/favorite/ui/favorite_screen.dart';
import 'package:grocery_app/features/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          FavoriteScreen.routeName: (context) => const FavoriteScreen(),
          CartScreen.routeName: (context) => const CartScreen()
        });
  }
}
