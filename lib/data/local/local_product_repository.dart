import 'package:finalProject/config/theme.dart';
import 'package:finalProject/data/model/filter_rules.dart';
import 'package:finalProject/data/model/product.dart';
import 'package:finalProject/data/model/sort_rules.dart';
import 'package:finalProject/data/repositories/abstract/product_repository.dart';

class LocalProductRepository implements ProductRepository {
  @override
  Future<Product> getProduct(int id) {
   
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getSimilarProducts(int categoryId,
      {int pageIndex = 0, int pageSize = AppConsts.page_size}) {
    
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts(
      {int pageIndex = 0,
      int pageSize = AppConsts.page_size,
      int categoryId = 0,
      bool isFavorite = false,
      SortRules sortRules = const SortRules(),
      FilterRules filterRules}) {
    
    return null;
  }

  @override
  Future<FilterRules> getPossibleFilterOptions(int categoryId) {
    
    return null;
  }
}
