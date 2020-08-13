
import 'package:finalProject/data/model/favorite_product.dart';
import 'package:finalProject/data/repositories/product_repository_impl.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';

abstract class AddToFavoritesUseCase
  implements BaseUseCase<AddToFavoriteResult, FavoriteProduct> {}

    
class AddToFavoritesUseCaseImpl implements AddToFavoritesUseCase {
  @override
  Future<AddToFavoriteResult> execute(FavoriteProduct item) async {
    try {
      ProductRepositoryImpl.dataStorage.favProducts.add(
        FavoriteProduct(
          item.product,
          item.favoriteForm
        )
      );
      return AddToFavoriteResult(result: true);
    } catch (e) {
      return AddToFavoriteResult(  
        result: false,
        exception: AddProductToCartException()
      );
    }
  }

}

class AddProductToCartException implements Exception {}

class AddToFavoriteResult extends UseCaseResult {
  AddToFavoriteResult({Exception exception, bool result}) 
    : super(exception: exception, result: result);
}