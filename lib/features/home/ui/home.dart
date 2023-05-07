import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/cart/ui/cart_screen.dart';
import 'package:grocery_app/features/favorite/ui/favorite_screen.dart';

import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/model/home_product_data_model.dart';
import 'package:grocery_app/features/home/ui/product_tile.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

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
        } else if (state is ItemAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item added to your cart'),
            ),
          );
        }
       else if (state is ItemAddedToFavoriteActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item added to your favorite'),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          case HomeLoadedSuccessState:
            // HomeLoadedSuccsessState has a property of products and i accessed it through successState
            final successState = state as HomeLoadedSuccessState;
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
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    //i called productDataModel through successState
                    productDataModel: successState.products[index],
                    homeBloc: homeBloc, isClicked: false,
                  );
                },
              ),
            );
          case HomeLoadingErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
