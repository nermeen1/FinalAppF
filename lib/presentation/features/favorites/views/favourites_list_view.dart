

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalProject/config/routes.dart';
import 'package:finalProject/config/theme.dart';
import 'package:finalProject/presentation/features/favorites/favorites.dart';
import 'package:finalProject/presentation/features/product_details/product_screen.dart';
import 'package:finalProject/presentation/widgets/data_driven/blank_product_list_item.dart';
import 'package:finalProject/presentation/widgets/extensions/product_view.dart';

class FavoritesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (state.data == null) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                child: BlankProductListItem(),
              );
            } else {
              return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppSizes.sidePadding),
                  child: state.data[index]?.getListView(
                    context: context,
                    showProductInfo: () {
                      Navigator.of(context).pushNamed(
                          OpenFlutterEcommerceRoutes.product,
                          arguments: ProductDetailsParameters(
                              state.data[index].product.id,
                              state.data[index].product.categories.isNotEmpty ? 
                                state.data[index].product.categories[0].id: 0,
                              selectedAttributes:
                                  state.data[index].favoriteForm));
                    },
                    onRemoveFromFavorites: () {
                      BlocProvider.of<FavouriteBloc>(context).add(
                          RemoveFromFavoriteEvent(
                              state.data[index]));
                    },
                    onAddToCart: () {
                      BlocProvider.of<FavouriteBloc>(context)
                          .add(AddToCartEvent(state.data[index]));
                      Navigator.of(context)
                        .pushNamed(OpenFlutterEcommerceRoutes.cart);
                    },
                    selectedAttributes: state.data[index]?.favoriteForm
                  ));
            }
          },
          childCount: state.data?.length
        ),
      );
    });
  }
}
