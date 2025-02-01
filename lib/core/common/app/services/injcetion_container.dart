// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:dars_3/features/auth/data/data_source/auth_remote_data_source.dart';
// import 'package:dars_3/features/auth/data/repositories/auth_repo_impl.dart';
// import 'package:dars_3/features/auth/domain/repositories/auth_repo.dart';
// import 'package:dars_3/features/auth/domain/usecases/login_usecase.dart';
// import 'package:dars_3/features/auth/domain/usecases/register_usecase.dart';
// import 'package:dars_3/features/auth/presentation/controller/auth_provider.dart';
// import 'package:dars_3/features/home/data/datasource/home_remote_data_source.dart';
// import 'package:dars_3/features/home/data/repositories/home_repo_impl.dart';
// import 'package:dars_3/features/home/domain/repositories/home_repo.dart';
// import 'package:dars_3/features/home/domain/usecases/get_banners_usecase.dart';
// import 'package:dars_3/features/home/presentation/controllers/home_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final getIt = GetIt.instance;

// Future<void> initInjection() async {
//   getIt.registerLazySingleton(
//     () => Dio(),
//   );
//   final prefs = await SharedPreferences.getInstance();
//   getIt.registerLazySingleton<SharedPreferences>(() => prefs);
//   await authInit();
//   await homeInit();
// }

// Future<void> authInit() async {
//   getIt
//     ..registerLazySingleton<LoginUsecase>(() => LoginUsecase(authRepo: getIt()))
//     ..registerLazySingleton<RegisterUsecase>(
//       () => RegisterUsecase(authRepo: getIt()),
//     )
//     ..registerLazySingleton<AuthRepo>(
//         () => AuthRepoImpl(authRemoteDataSource: getIt()))
//     ..registerLazySingleton<AuthRemoteDataSource>(
//         () => AuthRemoteDataSourceImpl())
//     ..registerLazySingleton(
//       () => AuthProvider(),
//     );
// }

// // home
// Future<void> homeInit() async {
//   getIt
//     ..registerLazySingleton(() => GetBannersUsecase(homeRepo: getIt()))
//     ..registerLazySingleton<HomeRepo>(
//         () => HomeRepoImpl(homeRemoteDataSource: getIt()))
//     ..registerLazySingleton<HomeRemoteDataSource>(
//       () => HomeRemoteDataSourceImpl(),
//     )
//     ..registerLazySingleton<HomeProvider>(
//       () => HomeProvider(),
//     );
// }

// product importl
import 'package:dars_3/features/home/data/datasource/product_remote_data_source.dart';
import 'package:dars_3/features/home/data/repositories/product_repo_ompl.dart';
import 'package:dars_3/features/home/domain/usecases/get_products_usecase.dart';
import 'package:dars_3/features/home/presentation/controllers/pro_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Auth imports
import 'package:dars_3/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:dars_3/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:dars_3/features/auth/domain/repositories/auth_repo.dart';
import 'package:dars_3/features/auth/domain/usecases/login_usecase.dart';
import 'package:dars_3/features/auth/domain/usecases/register_usecase.dart';
import 'package:dars_3/features/auth/presentation/controller/auth_provider.dart';

// Home imports
import 'package:dars_3/features/home/data/datasource/home_remote_data_source.dart';
import 'package:dars_3/features/home/data/repositories/home_repo_impl.dart';
import 'package:dars_3/features/home/domain/repositories/home_repo.dart';
import 'package:dars_3/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:dars_3/features/home/presentation/controllers/home_controller.dart';


final getIt = GetIt.instance;

Future<void> initInjection() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);

  await authInit();
  await homeInit();
  await productInit();
}


Future<void> authInit() async {
  getIt
    ..registerLazySingleton<LoginUsecase>(() => LoginUsecase(authRepo: getIt()))
    ..registerLazySingleton<RegisterUsecase>(() => RegisterUsecase(authRepo: getIt()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authRemoteDataSource: getIt()))
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl())
    ..registerLazySingleton<AuthProvider>(() => AuthProvider());
}


Future<void> homeInit() async {
  getIt
    ..registerLazySingleton<GetBannersUsecase>(() => GetBannersUsecase(homeRepo: getIt()))
    ..registerLazySingleton<HomeRepo>(() => HomeRepoImpl(homeRemoteDataSource: getIt()))
    ..registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl())
    ..registerLazySingleton<HomeProvider>(() => HomeProvider());
}

Future<void> productInit() async {
  getIt
    ..registerLazySingleton<GetProductsUsecase>(() => GetProductsUsecase(productRepo: getIt()))
    ..registerLazySingleton<ProRepo>(() => ProRepoImpl(proRemoteDataSource: getIt()))
    ..registerLazySingleton<ProRemoteDataSource>(() => ProRemoteDataSourceImpl())
    ..registerLazySingleton<ProProvider>(() => ProProvider());
}
