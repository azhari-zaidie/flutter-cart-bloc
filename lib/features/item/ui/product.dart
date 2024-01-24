import 'package:bloc_1/features/home/bloc/home_bloc.dart';
import 'package:bloc_1/features/home/models/home_product_data.dart';
import 'package:bloc_1/features/item/bloc/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product extends StatefulWidget {
  final ProductDataModel product;
  const Product({super.key, required this.product});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final ItemBloc itemBloc = ItemBloc();
  @override
  void initState() {
    // TODO: implement initState
    itemBloc.add(ItemInitialEvent(product: widget.product));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemBloc, ItemState>(
      bloc: itemBloc,
      listenWhen: (previous, current) => current is ItemActionState,
      buildWhen: (previous, current) => current is! ItemActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case ItemLoadedState:
            final successState = state as ItemLoadedState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Product Details'),
                centerTitle: true,
              ),
              body: Center(
                child: Text(successState.product.name),
              ),
            );
        }
        return Container();
      },
    );
  }
}
