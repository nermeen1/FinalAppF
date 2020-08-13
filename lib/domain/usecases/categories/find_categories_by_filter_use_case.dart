import 'package:finalProject/data/repositories/abstract/category_repository.dart';

import 'package:finalProject/data/model/category.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';
import 'package:finalProject/domain/usecases/categories/categories_by_filter_params.dart';
import 'package:finalProject/domain/usecases/categories/categories_by_filter_result.dart';
import 'package:finalProject/locator.dart';

abstract class FindCategoriesByFilterUseCase
  implements BaseUseCase<CategoriesByFilterResult, CategoriesByFilterParams> {}

    
class FindCategoriesByFilterUseCaseImpl implements FindCategoriesByFilterUseCase {
  @override
  Future<CategoriesByFilterResult> execute(CategoriesByFilterParams params) async {
    try {
      CategoryRepository _categoryRepository = sl();
      List<ProductCategory> categories = await _categoryRepository.getCategories(parentCategoryId: params.categoryId);
      return CategoriesByFilterResult(
        categories,
        categories.length
      );
      
    } catch (e) {
      return CategoriesByFilterResult(  
        null,
        0,
        exception: EmptyCategoriesException()
      );
    }
  }
}

class EmptyCategoriesException implements Exception {}