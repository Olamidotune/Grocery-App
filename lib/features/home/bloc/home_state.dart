part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeLoadingState extends HomeState {}

class HomeLoadingErrorState extends HomeState {}

class FavoriteScreenNavigateActionState extends HomeActionState {}

class CartScreenNavigateActionState extends HomeActionState {}
