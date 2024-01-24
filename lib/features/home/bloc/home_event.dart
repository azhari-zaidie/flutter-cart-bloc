part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

//default event
class HomeInitialEvent extends HomeEvent {}

//
class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductWishListButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeProductButtonNagivateEvent extends HomeEvent {
  final ProductDataModel clickedProduct;
  HomeProductButtonNagivateEvent({required this.clickedProduct});
}

class HometWishListButtonNavigateEvent extends HomeEvent {}

class HometCartButtonNavigateEvent extends HomeEvent {}
