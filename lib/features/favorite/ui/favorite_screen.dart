import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  static const String routeName = 'Favorite Screen';
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Fav Screen')),
    );
  }
}
