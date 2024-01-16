import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_1/data/cart_items.dart';
import 'package:bloc_1/features/home/models/home_product_data.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    print('clicked remove');
    cartItems.remove(event.product);
    emit(CartSuccessState(cartItems: cartItems));
    //need to emit cart success state because it will refresh the state
  }
}
