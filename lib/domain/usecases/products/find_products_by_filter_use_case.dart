
import 'package:finalProject/data/model/filter_rules.dart';
import 'package:finalProject/data/model/product.dart';
import 'package:finalProject/data/repositories/abstract/product_repository.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';
import 'package:finalProject/domain/usecases/products/products_by_filter_params.dart';
import 'package:finalProject/domain/usecases/products/products_by_filter_result.dart';
import 'package:finalProject/locator.dart';

abstract class FindProductsByFilterUseCase
    implements BaseUseCase<ProductsByFilterResult, ProductsByFilterParams> {}

    
class FindProductsByFilterUseCaseImpl implements FindProductsByFilterUseCase {

  @override
  Future<ProductsByFilterResult> execute(
      ProductsByFilterParams params) async {
    try {
      var products = await _findProductsByFilter(params);

      if (products != null && products.isNotEmpty) {
        return ProductsByFilterResult(  
          products,
          products.length,
          FilterRules.getSelectableAttributes(products)
        );
      }

    } catch (e) {
      return ProductsByFilterResult(  
        [],
        0,
        null,
        exception: EmptyProductsException()
      );
    }
    return ProductsByFilterResult(  
      [],
      0,
      null,
      exception: EmptyProductsException()
    );
  }

  Future<List<Product>> _findProductsByFilter(
      ProductsByFilterParams params) async {
    List<Product> products;
    if (params.filterByCategory) {
      ProductRepository productRepository = sl();
      products =
          await productRepository.getProducts(categoryId: params.categoryId);
    }
    return products;
  }
}

class EmptyProductsException implements Exception {}