part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {

}

class CartButtonClickedEvent extends HomeEvent {}

class FavoriteButtonClickedEvent extends HomeEvent {}

class CartButtonNavigationEvent extends HomeEvent {}

class FavoriteButtonNavigateEvent extends HomeEvent {}
