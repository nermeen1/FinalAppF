import 'dart:collection';

import 'package:finalProject/config/theme.dart';
import 'package:finalProject/data/model/favorite_product.dart';
import 'package:finalProject/data/model/product.dart';


import '../../model/filter_rules.dart';
import '../../model/product_attribute.dart';
import '../../model/sort_rules.dart';

abstract class FavoritesRepository {
 
  Future<List<FavoriteProduct>> getFavoriteProducts({
    int pageIndex = 0,
    int pageSize = AppConsts.page_size,
    SortRules sortRules = const SortRules(),
    FilterRules filterRules,
  });


  Future addToFavorites(
      Product product, HashMap<ProductAttribute, String> selectedAttributes);
  Future<List<FavoriteProduct>> removeFromFavorites(int productId, HashMap<ProductAttribute, String> selectedAttributes);

  bool checkFavorite(int productId);

  Future<FilterRules> getFavoritesFilterOptions();
}
