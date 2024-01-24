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

    List<ProductDataModel> productList = GroceryData.groceryProducts
        .map(
          (e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            imageUrl: e['imageUrl'],
            price: e['price'],
          ),
        )
        .toList();
    emit(HomeLoadedSuccessState(product: productList));
  }

  // Stream<HomeCheckedState> mapEventToState(HomeEvent event) async* {
  //   if (event is HometWishListButtonNavigateEvent) {
  //     final updatedProducts = state..map((product) {
  //       if (product.id == event.productId) {
  //         // Toggle the favorite status for the selected product
  //         return product.copyWith(isFavorite: !product.isFavorite);
  //       } else {
  //         return product;
  //       }
  //     }).toList();

  //     // Emit the updated state
  //     yield FavoriteUpdatedState(products: updatedProducts);
  //   }
  // }

  FutureOr<void> homeProductWishListButtonClickedEvent(
      HomeProductWishListButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist  clicked');

    if (wishlistItems.contains(event.clickedProduct)) {
      wishlistItems.remove(event.clickedProduct);
    } else {
      wishlistItems.add(event.clickedProduct);
    }
    emit(HomeProductItemWishlistActionState());
    List<ProductDataModel> productList = GroceryData.groceryProducts
        .map(
          (e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            imageUrl: e['imageUrl'],
            price: e['price'],
          ),
        )
        .toList();
    emit(HomeLoadedSuccessState(product: productList));
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

  bool isWishlistChecked(ProductDataModel products) {
    final result = wishlistItems.contains(products);

    return result;
  }
}
