// ignore_for_file: empty_constructor_bodies

import 'package:dartz/dartz.dart';
import 'package:dars_3/core/common/exceptions/custom_exception.dart';
import 'package:dars_3/features/home/data/datasource/home_remote_data_source.dart';
import 'package:dars_3/features/home/data/datasource/product_remote_data_sourse.dart';
import 'package:dars_3/features/home/data/mappers/banner_mapper.dart';
import 'package:dars_3/features/home/data/mappers/product_mapper.dart';
import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:dars_3/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
  });

  @override
  Future<Either<dynamic, BannerEntity>> getBanners() async {
    try {
      final result = await homeRemoteDataSource.getBanners();
      return Right(BannerMapper.mapBannerEntity(result));
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }
}


class ProducTRepoImpl implements Productrepo{
  final ProductRemoteDataSourse productRemoteDataSourse;

  ProducTRepoImpl({
    required this.productRemoteDataSourse
  });

  @override
  Future<Either<dynamic, ProductEntiti>> getProduct() async {
    try {
      final result = await productRemoteDataSourse.getProducts();
      return Right(ProductMapper.mapProductEntiti(result));
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }
}