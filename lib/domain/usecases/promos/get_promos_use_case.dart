

import 'package:finalProject/data/model/promo.dart';
import 'package:finalProject/data/repositories/abstract/promo_repository.dart';
import 'package:finalProject/domain/usecases/base_use_case.dart';
import 'package:finalProject/locator.dart';

abstract class GetPromosUseCase
  implements BaseUseCase<GetPromosResult, GetPromosParams> {}
    
class GetPromosUseCaseImpl implements GetPromosUseCase {

  @override
  Future<GetPromosResult> execute(
      GetPromosParams params) async {
    try {
      PromoRepository promoRepository = sl();
      var promos = await promoRepository.getPromoList();

      if (promos != null && promos.isNotEmpty) {
        return GetPromosResult(  
          promos: promos,
          result: true
        );
      }

    } catch (e) {
      return GetPromosResult( 
        promos: [],
        result: false,
        exception: EmptyProductsException()
      );
    }
    return GetPromosResult(  
      promos: [],
      result: false,
      exception: EmptyProductsException()
    );
  }

}

class GetPromosResult extends UseCaseResult {
  List<Promo> promos;
  
  GetPromosResult({this.promos, Exception exception, bool result}) 
    : super(exception: exception, result: result);
}
  
class GetPromosParams { }

class EmptyProductsException implements Exception {}