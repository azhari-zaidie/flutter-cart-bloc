import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_1/features/home/models/home_product_data.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial()) {
    on<ItemInitialEvent>(itemInitialEvent);
  }

  FutureOr<void> itemInitialEvent(
      ItemInitialEvent event, Emitter<ItemState> emit) {
    emit(ItemLoadedState(product: event.product));
  }
}
