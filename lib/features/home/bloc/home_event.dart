part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class CartButtonClickedEvent extends HomeEvent {
  //clicked Product is when the CartButtonClickedEvent is pressed is sends the product to bloc
  final ProductDataModel clickedProduct;
  CartButtonClickedEvent({required this.clickedProduct});
}

class FavoriteButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  FavoriteButtonClickedEvent({required this.clickedProduct});
}

class CartButtonNavigationEvent extends HomeEvent {}

class FavoriteButtonNavigateEvent extends HomeEvent {}
