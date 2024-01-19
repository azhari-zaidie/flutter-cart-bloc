import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_1/data/wishlist_items.dart';
import 'package:bloc_1/features/home/models/home_product_data.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<RemoveWishlistEvent>(removeWishlistEvent);
    on<WishlistInitialEvent>(wishlistInitialEvent);
  }

  FutureOr<void> removeWishlistEvent(
      RemoveWishlistEvent event, Emitter<WishlistState> emit) async {
    wishlistItems.remove(event.product);
    emit(RemoveWishlistActionState());
    emit(WishlistSuccesState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccesState(wishlistItems: wishlistItems));
  }
}
