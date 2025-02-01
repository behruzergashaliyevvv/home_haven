import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
// import 'package:dars_3/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<dynamic, BannerEntity>> getBanners();
  // Future<Either<dynamic, ProductEntity>> getProducts();
}

abstract class ProRepo {

  Future<Either<dynamic, ProductEntity>> getProducts();
}