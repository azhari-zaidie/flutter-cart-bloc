part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

sealed class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistSuccesState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishlistSuccesState({required this.wishlistItems});
}

class RemoveWishlistActionState extends WishlistActionState {}
