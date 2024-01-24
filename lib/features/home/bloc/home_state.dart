part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> product;
  HomeLoadedSuccessState({
    required this.product,
  });
}

final class HomeUpdatedSuccessState extends HomeState {
  final List<ProductDataModel> product;
  HomeUpdatedSuccessState({
    required this.product,
  });
}

final class HomeErrorState extends HomeState {}

final class HomeCheckedState extends HomeState {
  final List<ProductDataModel> product;

  HomeCheckedState({required this.product});
}

final class HomeNavigateToWishlistPageActionState extends HomeActionState {}

final class HomeNavigateToCartPageActionState extends HomeActionState {}

final class HomeProductItemWishlistActionState extends HomeActionState {}

final class HomeProductItemCartActionState extends HomeActionState {}
