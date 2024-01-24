import 'package:bloc_1/features/home/models/home_product_data.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  final bool wishlistChecked;
  const ProductTileWidget(
      {super.key,
      required this.productDataModel,
      required this.homeBloc,
      required this.wishlistChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              homeBloc.add(HomeProductButtonNagivateEvent(
                  clickedProduct: productDataModel));
            },
            child: Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RM ${productDataModel.price.toString()}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishListButtonClickedEvent(
                          clickedProduct: productDataModel));
                      // homeBloc.add(HometWishListButtonNavigateEvent());
                    },
                    icon: Icon(wishlistChecked
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HometCartButtonNavigateEvent());
                      homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
