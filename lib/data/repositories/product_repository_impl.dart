import 'dart:collection';

import 'package:finalProject/config/theme.dart';
import 'package:finalProject/data/repositories/abstract/favorites_repository.dart';
import 'package:finalProject/data/model/favorite_product.dart';
import 'package:finalProject/data/model/filter_rules.dart';
import 'package:finalProject/data/model/hashtag.dart';
import 'package:finalProject/data/model/product.dart';
import 'package:finalProject/data/model/product_attribute.dart';
import 'package:finalProject/data/model/sort_rules.dart';
import 'package:finalProject/data/repositories/abstract/product_repository.dart';
import 'package:finalProject/data/error/exceptions.dart';
import 'package:finalProject/data/local/local_product_repository.dart';
import 'package:finalProject/data/network/network_status.dart';
import 'package:finalProject/data/woocommerce/repositories/product_remote_repository.dart';
import 'package:finalProject/locator.dart';

class ProductRepositoryImpl extends ProductRepository with FavoritesRepository {

  static ProductDataStorage dataStorage = ProductDataStorage();
  
  @override
  Future<Product> getProduct(int id) {
   
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getSimilarProducts(int categoryId,
      {int pageIndex = 0, int pageSize = AppConsts.page_size}) {
    
    throw UnimplementedError();
  }

  @override
  Future<FilterRules> getPossibleFilterOptions(int categoryId) async {
    HashMap<ProductAttribute, List<String>> result = HashMap();
    
    return FilterRules(
        categories: HashMap(),
        hashTags: [],
        selectedHashTags: HashMap<HashTag, bool>(),
        selectableAttributes: result,
        selectedPriceRange: PriceRange(10, 100));
  }

  @override
  Future<List<Product>> getProducts(
      {int pageIndex = 0,
      int pageSize = AppConsts.page_size,
      int categoryId = 0,
      bool isFavorite = false,
      SortRules sortRules = const SortRules(),
      FilterRules filterRules}) async {
    // TODO: implement getProducts
    try
    {
      NetworkStatus networkStatus = sl();
      ProductRepository productRepository;
      if ( networkStatus.isConnected != null ) {
        productRepository = RemoteProductRepository(woocommerce: sl());
      } else {
        productRepository = LocalProductRepository();
      }

      List<Product> products = await productRepository.getProducts();

      //check favorites
      dataStorage.products = [];
      products.forEach( (product) =>{
        dataStorage.products.add(
          product.favorite(
            checkFavorite(product.id)
          )
        )
      }); 

      return dataStorage.products;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future addToFavorites(Product product, HashMap<ProductAttribute, String> selectedAttributes) async {
    dataStorage.favProducts.add(FavoriteProduct(product, selectedAttributes));
  }

  @override
  Future<List<FavoriteProduct>> getFavoriteProducts({int pageIndex = 0, int pageSize = AppConsts.page_size, 
      SortRules sortRules = const SortRules(), FilterRules filterRules}) async {
    
    return dataStorage.favProducts;
  }

  @override
  Future<FilterRules> getFavoritesFilterOptions() async {
    
    return FilterRules.getSelectableAttributes(dataStorage.products);
  }

  @override
  Future<List<FavoriteProduct>> removeFromFavorites(int productId, HashMap<ProductAttribute, String> selectedAttributes) async {
   
    dataStorage.favProducts.removeWhere((product) => product.product.id == productId && 
      (selectedAttributes == null || product.favoriteForm == selectedAttributes)
    );
    return dataStorage.favProducts;
  }

  @override
  bool checkFavorite(int productId) {
   
    bool isFavorite = false;
    for( int i = 0; i < dataStorage.favProducts.length; i++) {
      if ( dataStorage.favProducts[i].product.id == productId) {
        isFavorite = true;
        break;
      }
    }
    return isFavorite;
  }
}

class ProductDataStorage {
  List<Product> products = [];
  List<FavoriteProduct> favProducts = [];
}