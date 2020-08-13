
import 'package:finalProject/data/model/promo.dart';
import 'package:finalProject/data/repositories/abstract/promo_repository.dart';
import 'package:finalProject/data/error/exceptions.dart';
import 'package:finalProject/data/local/local_promo_repository.dart';
import 'package:finalProject/data/network/network_status.dart';
import 'package:finalProject/data/woocommerce/repositories/promo_remote_repository.dart';
import 'package:finalProject/locator.dart';

class PromoRepositoryImpl extends PromoRepository{
  static PromoDataStorage promoDataStorage = PromoDataStorage();

  @override
  Future<List<Promo>> getPromoList() async {
    try
    {
      NetworkStatus networkStatus = sl();
      PromoRepository promoRepository;
      if ( networkStatus.isConnected != null ) {
        promoRepository = RemotePromoRepository(woocommerce: sl());
      } else {
        promoRepository = LocalPromoRepository();
      }

      promoDataStorage.items = await promoRepository.getPromoList();

      return promoDataStorage.items;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}

class PromoDataStorage {
  List<Promo> items = [];
}