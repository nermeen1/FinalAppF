

import 'package:finalProject/data/repositories/abstract/cart_repository.dart';
import 'package:finalProject/data/model/cart_item.dart';
import 'package:finalProject/data/model/product.dart';
import 'package:finalProject/data/model/product_attribute.dart';
import 'package:finalProject/data/model/promo.dart';

class CartRepositoryImpl extends CartRepository{
  static CartProductDataStorage cartProductDataStorage 
    = CartProductDataStorage();

  @override
  Future addProductToCart(Product product, int quantity, Map<ProductAttribute, String> selectedAttributes) async {
    cartProductDataStorage.items.add(
      CartItem(
        product: product,
        productQuantity: ProductQuantity(quantity), 
        selectedAttributes: selectedAttributes,
      )
    );
  }

  @override
  Future changeQuantity(CartItem item, int newQuantity) async {
    for(int i = 0; i < cartProductDataStorage.items.length; i++){
      if ( cartProductDataStorage.items[i] == item ) {
        cartProductDataStorage.items[i].productQuantity.changeQuantity(newQuantity);
      }
    }
  }

  @override
  Future<Promo> getAppliedPromo() async {
    return cartProductDataStorage.appliedPromo;
  }

  @override
  Future<List<CartItem>> getCartContent() async {
    return cartProductDataStorage.items;
  }

  @override
  Future setPromo(Promo promo) async {
    cartProductDataStorage.appliedPromo = promo;
  }

  @override
  double getTotalPrice(){
    double totalPrice = 0;
    for (var i = 0; i < cartProductDataStorage.items.length; i++) {
      totalPrice += cartProductDataStorage.items[i].price;
    }
    return totalPrice;
  }

  @override
  double getCalculatedPrice(){
    final totalPrice = getTotalPrice();
    final calculatedTotalPrice = 
      cartProductDataStorage.appliedPromo != null ?
        totalPrice * (1 - cartProductDataStorage.appliedPromo.discount/100)
        : totalPrice;
    return calculatedTotalPrice;
  }

}

class CartProductDataStorage {
  List<CartItem> items = [];
  Promo appliedPromo;
}