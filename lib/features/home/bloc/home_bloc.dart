import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_1/data/cart_items.dart';
import 'package:bloc_1/data/grocery_data.dart';
import 'package:bloc_1/data/wishlist_items.dart';
import 'package:bloc_1/features/home/models/home_product_data.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishListButtonClickedEvent>(
        homeProductWishListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HometWishListButtonNavigateEvent>(hometWishListButtonNavigateEvent);
    on<HometCartButtonNavigateEvent>(hometCartButtonNavigateEvent);
    on<HomeInitialEvent>(homeInitialEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        product: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  imageUrl: e['imageUrl'],
                  price: e['price']),
            )
            .toList()));
  }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist  clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartActionState());
  }

  FutureOr<void> hometWishListButtonNavigateEvent(
      HometWishListButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Navigate wishlist clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> hometCartButtonNavigateEvent(
      HometCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Navigate cart clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
