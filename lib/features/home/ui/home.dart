import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/ui/cart_screen.dart';
import 'package:grocery_app/features/favorite/ui/favorite_screen.dart';

import 'package:grocery_app/features/home/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is FavoriteScreenNavigateActionState) {
          Navigator.of(context).pushNamed(FavoriteScreen.routeName);
        } else if (state is CartScreenNavigateActionState) {
          Navigator.of(context).pushNamed(CartScreen.routeName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Grocery App'),
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    FavoriteButtonNavigateEvent(),
                  );
                },
                icon: const Icon(
                  Icons.favorite,
                ),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    CartButtonNavigationEvent(),
                  );
                },
                icon: const Icon(
                  Icons.shopping_bag,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
