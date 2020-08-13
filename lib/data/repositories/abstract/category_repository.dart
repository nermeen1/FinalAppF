

import '../../model/category.dart';

abstract class CategoryRepository {
  
  Future<List<ProductCategory>> getCategories({int parentCategoryId = 0});

  Future<ProductCategory> getCategoryDetails(int categoryId);
}
