import 'package:finalProject/data/repositories/abstract/favorites_repository.dart';

import 'package:finalProject/data/model/favorite_product.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';
import 'package:finalProject/locator.dart';

abstract class RemoveFromFavoritesUseCase
  implements BaseUseCase<RemoveFromFavoritesResult, RemoveFromFavoritesParams> {}

class RemoveFromFavoritesUseCaseImpl implements RemoveFromFavoritesUseCase {
  @override
  Future<RemoveFromFavoritesResult> execute(RemoveFromFavoritesParams params) async {
    try {
      FavoritesRepository favoritesRepository = sl();
      await favoritesRepository.removeFromFavorites(
        params.product.product.id, 
        params.product.favoriteForm);
      return RemoveFromFavoritesResult(result: true);
    } catch (e) {
      return RemoveFromFavoritesResult(  
        result: false,
        exception: RemoveFromFavoritesException()
      );
    }
  }

}

class RemoveFromFavoritesParams {
  final FavoriteProduct product;

  RemoveFromFavoritesParams(this.product);
}

class RemoveFromFavoritesResult extends UseCaseResult {
  RemoveFromFavoritesResult({Exception exception, bool result}) 
    : super(exception: exception, result: result);
}

class RemoveFromFavoritesException implements Exception {}
