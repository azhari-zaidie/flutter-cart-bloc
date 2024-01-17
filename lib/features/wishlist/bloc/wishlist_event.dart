part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class RemoveWishlistEvent extends WishlistEvent {
  final ProductDataModel product;

  RemoveWishlistEvent({required this.product});
}
