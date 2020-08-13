class ServerAddresses {
  
  static const serverAddress = 'https://woocommerce.openflutterproject.com/';
  
  static const _woocommerceKeys = '';
  static const _categorySuffix = '/wp-json/wc/v3/products/categories/'; 
  static const _productSuffix = ' /wp-json/wc/v3/products/categories/';
  static const _promoSuffix = ' /wp-json/wc/v3/reports/coupons/';
  static const signUp = ''; 
  static const forgotPassword = ''; 

  
  static const authToken = 'wp-json/jwt-auth/v1/token';

  
  static const _productCategoriesCached = '/cachedapi/v3/products/categories.json';
  static const _productsCached = '/cachedapi/v3/products/products.json';
  static const _promosCached = '/cachedapi/v3/coupon.json';

  static bool useStatic = _woocommerceKeys.isEmpty;

  static String get productCategories => serverAddress  +
    (useStatic ? _productCategoriesCached 
      : serverAddress  +_categorySuffix + _woocommerceKeys);

  static String get products => serverAddress  +
    (useStatic ? _productsCached 
      : serverAddress  +_productSuffix + _woocommerceKeys);

  static String get promos => serverAddress  +
    (useStatic ? _promosCached 
      : serverAddress  +_promoSuffix + _woocommerceKeys);
}
