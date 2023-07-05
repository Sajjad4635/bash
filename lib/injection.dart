import 'dart:io';

import 'package:baash/features/home/data/data_sources/home_api.dart';
import 'package:baash/features/home/data/repositories/home_repository_impl.dart';
import 'package:baash/features/home/domain/repositories/home_repository.dart';
import 'package:baash/features/home/domain/use_cases/cart_inquiry.dart';
import 'package:baash/features/home/domain/use_cases/get_banners.dart';
import 'package:baash/features/home/domain/use_cases/get_category_list.dart';
import 'package:baash/features/home/presentation/manager/bannersBloc/Banners_bloc.dart';
import 'package:baash/features/home/presentation/manager/cartInquiryBloc/cart_inquiry_bloc.dart';
import 'package:baash/features/home/presentation/manager/categoryBloc/category_bloc.dart';
import 'package:baash/features/home/domain/use_cases/get_all_products.dart';
import 'package:baash/features/home/presentation/manager/productsBloc/products_bloc.dart';
import 'package:baash/features/product_detail/data/data_sources/product_detail_api.dart';
import 'package:baash/features/product_detail/data/repositories/product_detail_repository_impl.dart';
import 'package:baash/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:baash/features/product_detail/domain/use_cases/add_to_cart_detail_page.dart';
import 'package:baash/features/product_detail/domain/use_cases/get_product_detail.dart';
import 'package:baash/features/product_detail/presentation/manager/product_detail_bloc.dart';
import 'package:baash/features/shopping_cart/data/data_sources/cart_api.dart';
import 'package:baash/features/shopping_cart/data/repositories/cart_repository_impl.dart';
import 'package:baash/features/shopping_cart/domain/repositories/cart_repository.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/add_to_cart.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/create_payment_usecase.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/delete_from_cart.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/get_cart.dart';
import 'package:baash/features/shopping_cart/presentation/manager/cart_bloc.dart';
import 'package:baash/features/user_profile/data/data_sources/profile_api.dart';
import 'package:baash/features/user_profile/data/repositories/user_profile_repository_impl.dart';
import 'package:baash/features/user_profile/domain/repositories/profile_repository.dart';
import 'package:baash/features/user_profile/domain/use_cases/create_user_profile.dart';
import 'package:baash/features/user_profile/domain/use_cases/get_user_profile.dart';
import 'package:baash/features/user_profile/domain/use_cases/payment_log.dart';
import 'package:baash/features/user_profile/domain/use_cases/update_user_profile.dart';
import 'package:baash/features/user_profile/presentation/manager/profile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:baash/features/login/data/data_sources/login_api.dart';
import 'package:baash/features/login/domain/repositories/login_repository.dart';
import 'package:baash/features/login/domain/use_cases/send_number.dart';
import 'package:baash/features/login/presentation/manager/login/login_bloc.dart';
import 'package:baash/features/splash/data/data_sources/splash_data.dart';
import 'package:baash/features/splash/domain/repositories/splash_repository.dart';
import 'package:baash/features/splash/presentation/manager/splash_bloc.dart';

import 'core/local_storage/local_data.dart';
import 'core/network/chopper_api.dart';
import 'core/network/network_info.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/use_cases/verify_code.dart';
import 'features/splash/data/repositories/splash_repository_impl.dart';
import 'features/splash/domain/use_cases/get_token.dart';

final serviceLocator = GetIt.instance;

Future init() async {
  ///feature splash
  ///bloc
  serviceLocator.registerFactory(
    () => SplashBloc(
      getToken: serviceLocator(),
    ),
  );

  ///use cases
  serviceLocator.registerLazySingleton(() => GetToken(serviceLocator()));

  ///repository

  serviceLocator.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(splashData: serviceLocator(), networkInfo: serviceLocator()));

  ///data sources

  serviceLocator.registerLazySingleton<SplashData>(() => SplashDataImpl(localData: serviceLocator(), chopperAPI: serviceLocator()));

  ///feature login
  ///bloc
  serviceLocator.registerFactory(
    () => LoginBloc(sendNumber: serviceLocator(), verifyCode: serviceLocator()),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => SendNumber(serviceLocator()));
  serviceLocator.registerLazySingleton(() => VerifyCode(serviceLocator()));

  ///repository

  serviceLocator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginApi: serviceLocator(), networkInfo: serviceLocator()));

  ///data sources
  serviceLocator.registerLazySingleton<LoginApi>(() => LoginApiImpl(serviceLocator()));

  ///feature Products
  ///bloc
  serviceLocator.registerFactory(
    () => ProductsHomeBloc(
      getAllProducts: serviceLocator(),
      cartInquiryTUseCase: serviceLocator(),
    ),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => GetAllProducts(serviceLocator()));

  ///repository

  serviceLocator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeApi: serviceLocator(), networkInfo: serviceLocator()));

  ///data sources
  serviceLocator.registerLazySingleton<HomeApi>(() => HomeApiImpl(serviceLocator()));

  ///feature Cart Inquiry
  ///bloc
  serviceLocator.registerFactory(
    () => cartInquiryBloc(
      cartInquiryUseCase: serviceLocator(),
    ),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => CartInquiryUseCase(serviceLocator()));

  ///feature categoryList
  ///bloc
  serviceLocator.registerFactory(
    () => CategoryBloc(
      getCategoryList: serviceLocator(),
      cartInquiryCUseCase: serviceLocator(),
    ),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => GetCategoryList(serviceLocator()));

  ///feature banners
  ///bloc
  serviceLocator.registerFactory(
    () => BannersBloc(
      getBanners: serviceLocator(),
    ),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => GetBanners(serviceLocator()));

  ///feature product detail
  ///bloc
  serviceLocator.registerFactory(
    () => ProductDetailBloc(
      getUserProfile: serviceLocator(),
      getProductDetail: serviceLocator(),
      addToCartDetailPage: serviceLocator(),
    ),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => GetProductDetail(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AddToCartDetailPageUseCase(serviceLocator()));

  ///repository

  serviceLocator.registerLazySingleton<ProductDetailRepository>(() => ProductDetailRepositoryImpl(productDetailApi: serviceLocator(), networkInfo: serviceLocator()));
  serviceLocator.registerLazySingleton<LocalData>(() => LocalDataImpl(storage: serviceLocator()));

  ///data sources
  serviceLocator.registerLazySingleton<ProductDetailApi>(() => ProductDetailApiImpl(serviceLocator()));

  ///feature get cart
  ///bloc
  serviceLocator.registerFactory(
    () => CartBloc(
      getCart: serviceLocator(),
      addToCart: serviceLocator(),
      deleteFromCart: serviceLocator(),
      createPayment: serviceLocator(),
    ),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => GetCartUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => AddToCartUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => DeleteFromCartUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => CreatePaymentUseCase(serviceLocator()));

  ///repository

  serviceLocator.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(cartApi: serviceLocator(), networkInfo: serviceLocator()));

  ///data sources
  serviceLocator.registerLazySingleton<CartApi>(() => CartApiImpl(serviceLocator()));

  ///feature get user profile
  ///bloc
  serviceLocator.registerFactory(
    () => ProfileBloc(
      getUserProfile: serviceLocator(),
      createUserProfile: serviceLocator(),
      updateUserProfile: serviceLocator(),
      paymentLogUseCase: serviceLocator(),
    ),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => GetUserProfile(serviceLocator()));
  serviceLocator.registerLazySingleton(() => CreateUserProfile(serviceLocator()));
  serviceLocator.registerLazySingleton(() => UpdateUserProfile(serviceLocator()));
  serviceLocator.registerLazySingleton(() => PaymentLogUseCase(serviceLocator()));

  ///repository

  serviceLocator.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(profileApi: serviceLocator(), networkInfo: serviceLocator()));

  ///data sources
  serviceLocator.registerLazySingleton<ProfileApi>(() => ProfileApiImpl(serviceLocator()));

  ///third parties and cores
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(serviceLocator()));
  final InternetConnectionChecker checker = InternetConnectionChecker.createInstance(addresses: [
    AddressCheckOptions(
        address: InternetAddress(
          '31.7.70.77',
          type: InternetAddressType.IPv4,
        ),
        port: 80)
  ]);
  serviceLocator.registerLazySingleton(() => checker);
  final ChopperAPI chopperAPI = ChopperAPI.create();
  serviceLocator.registerLazySingleton(() => chopperAPI);

  final storage = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton(() => storage);
}
