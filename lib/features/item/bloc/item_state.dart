part of 'item_bloc.dart';

@immutable
sealed class ItemState {}

sealed class ItemActionState extends ItemState {}

final class ItemInitial extends ItemState {}

class ItemLoadedState extends ItemState {
  final ProductDataModel product;

  ItemLoadedState({required this.product});
}
