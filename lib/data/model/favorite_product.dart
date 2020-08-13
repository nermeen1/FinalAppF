import 'dart:collection';

import 'package:finalProject/data/model/product.dart';
import 'package:finalProject/data/model/product_attribute.dart';


class FavoriteProduct {
  final Product product;
  final HashMap<ProductAttribute, String> favoriteForm;

  FavoriteProduct(this.product, this.favoriteForm);
}
