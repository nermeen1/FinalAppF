

import 'package:finalProject/data/model/cart_item.dart';
import 'package:finalProject/data/model/product.dart';
import 'package:finalProject/data/model/promo.dart';

import '../../model/product_attribute.dart';

abstract class CartRepository {
  
  Future<List<CartItem>> getCartContent();

  Future addProductToCart(Product product, int quantity,
      Map<ProductAttribute, String> selectedAttributes);

  Future changeQuantity(CartItem item, int newQuantity);


  Future<Promo> getAppliedPromo();

 
  Future setPromo(Promo promo);

  double getTotalPrice();

  
  double getCalculatedPrice();
}
