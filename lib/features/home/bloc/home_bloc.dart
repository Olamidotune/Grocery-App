import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/data/grocery_data.dart';
import 'package:grocery_app/features/home/model/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //on <this event>  (pass this pass this state).

    on<HomeInitialEvent>(homeInitialEvent);

    on<CartButtonNavigationEvent>(cartButtonNavigationEvent);

    on<FavoriteButtonNavigateEvent>(favoriteButtonNavigateEvent);

    on<FavoriteButtonClickedEvent>(favoriteButtonClickedEvent);

    on<CartButtonClickedEvent>(cartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(
      const Duration(seconds: 5),
    );
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProcucts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList(),
      ),
    );
  }

  FutureOr<void> favoriteButtonNavigateEvent(
      FavoriteButtonNavigateEvent event, Emitter<HomeState> emit) {
    debugPrint('Navigated to the Favorite Screen');
    emit(FavoriteScreenNavigateActionState());
  }

  FutureOr<void> cartButtonNavigationEvent(
      CartButtonNavigationEvent event, Emitter<HomeState> emit) {
    debugPrint('Navigated to the Cart Screen');
    emit(CartScreenNavigateActionState());
  }

  FutureOr<void> favoriteButtonClickedEvent(
      FavoriteButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint('Item added to Favorite ');
  }

  FutureOr<void> cartButtonClickedEvent(
      CartButtonClickedEvent event, Emitter<HomeState> emit) {
    debugPrint('Item added to cart');
  }
}
