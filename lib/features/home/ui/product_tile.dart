import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/bloc/home_bloc.dart';
import 'package:grocery_app/features/home/model/home_product_data_model.dart';

class ProductTile extends StatelessWidget {
  final HomeBloc homeBloc;
  final ProductDataModel productDataModel;
  final bool isClicked;
  const ProductTile(
      {super.key,
      required this.productDataModel,
      required this.homeBloc,
      required this.isClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' \$ ${productDataModel.price}',
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        FavoriteButtonClickedEvent(
                            clickedProduct: productDataModel),
                      );
                    },
                    icon: isClicked
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        CartButtonClickedEvent(
                            clickedProduct: productDataModel),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
