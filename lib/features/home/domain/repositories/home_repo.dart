// ignore_for_file: camel_case_types

import 'package:dartz/dartz.dart';
import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<dynamic, BannerEntity>> getBanners();
}

abstract class Productrepo {
  Future<Either<dynamic, ProductEntiti>> getProduct();
}
