part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class ItemInitialEvent extends ItemEvent {
  final ProductDataModel product;

  ItemInitialEvent({required this.product});
}
