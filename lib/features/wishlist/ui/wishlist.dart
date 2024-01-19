import 'package:bloc_1/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_1/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          // TODO: implement listener
          if (state is RemoveWishlistActionState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item Remove from wishlisting'),
            ));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccesState:
              final successState = state as WishlistSuccesState;

              return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                      productDataModel: successState.wishlistItems[index],
                      wishlistBloc: wishlistBloc,
                    );
                  });
          }
          return Container();
        },
      ),
    );
  }
}
