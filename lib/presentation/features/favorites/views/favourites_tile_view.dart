

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalProject/config/routes.dart';
import 'package:finalProject/config/theme.dart';
import 'package:finalProject/presentation/features/product_details/product_screen.dart';
import 'package:finalProject/presentation/widgets/extensions/product_view.dart';

import '../favorites_bloc.dart';
import '../favorites_event.dart';
import '../favorites_state.dart';

class FavouritesTileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
      return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: 1.589),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
              child: state.data[index].getTileView(
                context: context,
                showProductInfo: () {
                  Navigator.of(context).pushNamed(
                      OpenFlutterEcommerceRoutes.product,
                      arguments: ProductDetailsParameters(
                          state.data[index].product.id,
                          state.data[index].product.categories.isNotEmpty ? 
                            state.data[index].product.categories[0].id: 0,
                          selectedAttributes: state.data[index].favoriteForm));
                },
                onRemoveFromFavorites: () {
                  BlocProvider.of<FavouriteBloc>(context).add(
                      RemoveFromFavoriteEvent(state.data[index]));
                },
                onAddToCart: () {
                  BlocProvider.of<FavouriteBloc>(context)
                    .add(AddToCartEvent(state.data[index]));
                  Navigator.of(context)
                    .pushNamed(OpenFlutterEcommerceRoutes.cart);
                },
                selectedAttributes: state.data[index]?.favoriteForm
              ),
            );
          },
        ),
      );
    });
  }
}
