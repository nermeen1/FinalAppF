
import 'package:finalProject/data/repositories/abstract/cart_repository.dart';
import 'package:finalProject/data/model/cart_item.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';
import 'package:finalProject/locator.dart';

abstract class ChangeCartItemQuantityUseCase
  implements BaseUseCase<ChangeCartItemQuantityResult, ChangeCartItemQuantityParams> {}

    
class ChangeCartItemQuantityUseCaseImpl implements ChangeCartItemQuantityUseCase {
  @override
  Future<ChangeCartItemQuantityResult> execute(ChangeCartItemQuantityParams params) async {
    try {
      CartRepository cartReposiory = sl();
      await cartReposiory.changeQuantity(params.item, params.quantity);
      return ChangeCartItemQuantityResult(result: true);
    } catch (e) {
      return ChangeCartItemQuantityResult( 
        result: false,
        exception: ChangeCartItemQuantityException()
      );
    }
  }

}

class ChangeCartItemQuantityParams {
  final CartItem item;
  final int quantity;

  ChangeCartItemQuantityParams({this.item, this.quantity});
}

class ChangeCartItemQuantityResult extends UseCaseResult {
  ChangeCartItemQuantityResult({
    Exception exception, 
    bool result
  }) 
    : super(exception: exception, result: result);
}

class ChangeCartItemQuantityException implements Exception {}