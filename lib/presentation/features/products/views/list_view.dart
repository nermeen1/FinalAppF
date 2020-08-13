
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finalProject/config/routes.dart';
import 'package:finalProject/config/theme.dart';
import 'package:finalProject/presentation/features/product_details/product_screen.dart';
import 'package:finalProject/presentation/widgets/data_driven/blank_product_list_item.dart';
import 'package:finalProject/presentation/widgets/extensions/product_view.dart';

import '../products.dart';

class ProductsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
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
                child: state.data.products[index].getListView(
                    context: context,
                    showProductInfo: () {
                      Navigator.of(context).pushNamed(
                          OpenFlutterEcommerceRoutes.product,
                          arguments: ProductDetailsParameters(
                            state.data.products[index].id,
                            state.data.category?.id));
                    },
                    onFavoritesClick: () {
                      BlocProvider.of<ProductsBloc>(context).add(
                          ProductMakeFavoriteEvent(
                              !state.data.products[index].isFavorite,
                              state.data.products[index]));
                    },
                  )) ;
            }
          },
          childCount: state.data?.products?.length ?? 20,
        ),
      );
    });
  }
}
