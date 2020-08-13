import 'package:finalProject/data/repositories/abstract/category_repository.dart';
import 'package:finalProject/data/model/category.dart';

class LocalCategoryRepository extends CategoryRepository{
  @override
  Future<List<ProductCategory>> getCategories({int parentCategoryId = 0}) async {
   
    return null;
  }

  @override
  Future<ProductCategory> getCategoryDetails(int categoryId) {
    
    return null;
  }

}