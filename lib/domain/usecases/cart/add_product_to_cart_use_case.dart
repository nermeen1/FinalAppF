
import 'package:finalProject/data/model/cart_item.dart';
import 'package:finalProject/data/repositories/cart_repository_impl.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';

abstract class AddProductToCartUseCase
  implements BaseUseCase<AddToCartResult, CartItem> {}

    
class AddProductToCartUseCaseImpl implements AddProductToCartUseCase {
  @override
  Future<AddToCartResult> execute(CartItem item) async {
    try {
      CartRepositoryImpl.cartProductDataStorage.items.add(item);
      return AddToCartResult(result: true);
    } catch (e) {
      return AddToCartResult(  
        result: false,
        exception: AddProductToCartException()
      );
    }
  }

}

class AddProductToCartException implements Exception {}

class AddToCartResult extends UseCaseResult {
  AddToCartResult({Exception exception, bool result}) 
    : super(exception: exception, result: result);
}