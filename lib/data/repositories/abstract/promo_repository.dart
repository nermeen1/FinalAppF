

import 'package:finalProject/data/model/promo.dart';


abstract class PromoRepository {
  Future<List<Promo>> getPromoList();
}