import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:finalProject/data/repositories/abstract/cart_repository.dart';
import 'package:finalProject/data/repositories/abstract/category_repository.dart';
import 'package:finalProject/data/repositories/abstract/favorites_repository.dart';
import 'package:finalProject/data/repositories/abstract/payment_method_repository.dart';
import 'package:finalProject/data/repositories/abstract/product_repository.dart';
import 'package:finalProject/data/repositories/abstract/promo_repository.dart';
import 'package:finalProject/data/repositories/abstract/shipping_address_repository.dart';
import 'package:finalProject/data/repositories/abstract/user_repository.dart';
import 'package:finalProject/data/network/network_status.dart';
import 'package:finalProject/data/repositories/cart_repository_impl.dart';
import 'package:finalProject/data/repositories/category_repository_impl.dart';
import 'package:finalProject/data/repositories/payment_method_repository_impl.dart';
import 'package:finalProject/data/repositories/product_repository_impl.dart';
import 'package:finalProject/data/repositories/promo_repository_impl.dart';
import 'package:finalProject/data/repositories/shipping_address_repository_impl.dart';
import 'package:finalProject/data/repositories/user_repository_impl.dart';
import 'package:finalProject/data/woocommerce/repositories/remote_user_repository.dart';
import 'package:finalProject/data/woocommerce/repositories/woocommerce_wrapper.dart';
import 'package:finalProject/domain/usecases/cart/add_product_to_cart_use_case.dart';
import 'package:finalProject/domain/usecases/cart/change_cart_item_quantity_use_case.dart';
import 'package:finalProject/domain/usecases/cart/get_cart_products_use_case.dart';
import 'package:finalProject/domain/usecases/cart/remove_product_from_cart_use_case.dart';
import 'package:finalProject/domain/usecases/categories/find_categories_by_filter_use_case.dart';
import 'package:finalProject/domain/usecases/checkout/checkout_start_use_case.dart';
import 'package:finalProject/domain/usecases/favorites/add_to_favorites_use_case.dart';
import 'package:finalProject/domain/usecases/favorites/get_favorite_products_use_case.dart';
import 'package:finalProject/domain/usecases/favorites/remove_from_favorites_use_case.dart';
import 'package:finalProject/domain/usecases/products/find_products_by_filter_use_case.dart';
import 'package:finalProject/domain/usecases/products/get_home_products_use_case.dart';
import 'package:finalProject/domain/usecases/products/get_product_by_id_use_case.dart';
import 'package:finalProject/domain/usecases/promos/get_promos_use_case.dart';

final sl = GetIt.instance;


void init() {
  
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(DataConnectionChecker()));

  
  sl.registerLazySingleton<GetHomePageProductsUseCase>(() => GetHomePageProductsUseCaseImpl());
  
 
  sl.registerLazySingleton<CheckoutStartUseCase>(() => CheckoutStartUseCaseImpl());
  
 
  sl.registerLazySingleton<GetPromosUseCase>(() => GetPromosUseCaseImpl());
  
  
  sl.registerLazySingleton<RemoveFromFavoritesUseCase>(() => RemoveFromFavoritesUseCaseImpl());
  
  
  sl.registerLazySingleton<GetFavoriteProductsUseCase>(() => GetFavoriteProductsUseCaseImpl());
  
  
  sl.registerLazySingleton<RemoveProductFromCartUseCase>(() => RemoveProductFromCartUseCaseImpl());
  
 
  sl.registerLazySingleton<ChangeCartItemQuantityUseCase>(() => ChangeCartItemQuantityUseCaseImpl());

  
  sl.registerLazySingleton<GetCartProductsUseCase>(() => GetCartProductsUseCaseImpl());

  
  sl.registerLazySingleton<AddToFavoritesUseCase>(() => AddToFavoritesUseCaseImpl());

  
  sl.registerLazySingleton<AddProductToCartUseCase>(() => AddProductToCartUseCaseImpl());

  
  sl.registerLazySingleton<FindCategoriesByFilterUseCase>(() => FindCategoriesByFilterUseCaseImpl());

 
  sl.registerLazySingleton<FindProductsByFilterUseCase>(() => FindProductsByFilterUseCaseImpl());

  
  sl.registerLazySingleton<GetProductByIdUseCase>(() => GetProductByIdUseCaseImpl());

  
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<WoocommercWrapperAbstract>(
    () => WoocommerceWrapper(client: sl()),
  );
  
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(),
  );
  
  sl.registerLazySingleton<RemoteUserRepository>(
    () => RemoteUserRepository(),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteUserRepository: sl()),
  );
  
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(),
  );

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(),
  );

  sl.registerLazySingleton<FavoritesRepository>(
    () => ProductRepositoryImpl(),
  );

  sl.registerLazySingleton<PromoRepository>(
    () => PromoRepositoryImpl(),
  );

  sl.registerLazySingleton<ShippingAddressRepository>(
    () => ShippingAddressRepositoryImpl(ShippingAddressDataStorage([])),
  );

  sl.registerLazySingleton<PaymentMethodRepository>(
    () => PaymentMethodRepositoryImpl(PaymentMethodDataStorage([]))
  );  
}
