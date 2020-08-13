
import 'package:finalProject/data/model/cart_item.dart';
import 'package:finalProject/data/repositories/cart_repository_impl.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';

abstract class RemoveProductFromCartUseCase
  implements BaseUseCase<RemoveProductFromCartResult, CartItem> {}

    
class RemoveProductFromCartUseCaseImpl implements RemoveProductFromCartUseCase {
  @override
  Future<RemoveProductFromCartResult> execute(CartItem item) async {
    try {
      CartRepositoryImpl.cartProductDataStorage.items.remove(item);
      return RemoveProductFromCartResult(result: true);
    } catch (e) {
      return RemoveProductFromCartResult(  
        result: false,
        exception: AddProductToCartException()
      );
    }
  }
}

class AddProductToCartException implements Exception {}

class RemoveProductFromCartResult extends UseCaseResult {
  RemoveProductFromCartResult({Exception exception, bool result}) 
    : super(exception: exception, result: result);
}