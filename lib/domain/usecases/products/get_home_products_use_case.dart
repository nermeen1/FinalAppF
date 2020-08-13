
import 'package:finalProject/data/model/product.dart';
import 'package:finalProject/data/repositories/abstract/product_repository.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';
import 'package:finalProject/locator.dart';

abstract class GetHomePageProductsUseCase
    implements BaseUseCase<HomeProductsResult, HomeProductParams> {}

    
class GetHomePageProductsUseCaseImpl implements GetHomePageProductsUseCase {

  @override
  Future<HomeProductsResult> execute(
      HomeProductParams params) async {
    try {
      ProductRepository productRepository = sl();
      return HomeProductsResult(  
        salesProducts: await productRepository.getProducts(categoryId: 1),
        newProducts: await productRepository.getProducts(categoryId: 2),
        result: false,
      );
    } catch (e) {
      return HomeProductsResult(  
        salesProducts: [],
        newProducts: [],
        result: false,
        exception: HomeProductsException()
      );
    }
  }
}
class HomeProductParams {}

class HomeProductsResult extends UseCaseResult {
  final List<Product> salesProducts;
  final List<Product> newProducts;

  HomeProductsResult({this.salesProducts, this.newProducts, Exception exception, bool result})
    : super(exception: exception, result: result);
}

class HomeProductsException implements Exception {}