

import 'package:finalProject/config/theme.dart';
import 'package:finalProject/data/model/sort_rules.dart';

import '../../model/filter_rules.dart';
import '../../model/product.dart';

abstract class ProductRepository {
  
  Future<Product> getProduct(int id);

  Future<List<Product>> getSimilarProducts(int productId,
      {int pageIndex = 0, int pageSize = AppConsts.page_size});

  Future<List<Product>> getProducts({
    int pageIndex = 0,
    int pageSize = AppConsts.page_size,
    int categoryId = 0,
    SortRules sortRules = const SortRules(),
    FilterRules filterRules,
  });

  Future<FilterRules> getPossibleFilterOptions(int categoryId);
}
