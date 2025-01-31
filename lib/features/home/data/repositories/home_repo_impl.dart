// import 'package:dartz/dartz.dart';
// import 'package:dars_3/core/common/exceptions/custom_exception.dart';
// import 'package:dars_3/features/home/data/datasource/home_remote_data_source.dart';
// import 'package:dars_3/features/home/data/mappers/banner_mapper.dart';
// import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
// import 'package:dars_3/features/home/domain/entities/product_entity.dart';
// import 'package:dars_3/features/home/domain/repositories/home_repo.dart';

// class HomeRepoImpl implements HomeRepo {
//   final HomeRemoteDataSource homeRemoteDataSource;

//   HomeRepoImpl({required this.homeRemoteDataSource});

//   @override
//   Future<Either<dynamic, BannerEntity>> getBanners() async {
//     try {
//       final result = await homeRemoteDataSource.getBanners();
//       return Right(BannerMapper.mapBannerEntity(result));
//     } on ServerException catch (e) {
//       return Left(e.errorMessage);
//     }
//   }

//   @override
//   Future<Either<dynamic, ProductEntity>> getProducts() async {
//     try {
//       final result = await homeRemoteDataSource.getProducts();
//       return Right(ProductEntity(products: result));
//     } on ServerException catch (e) {
//       return Left(e.errorMessage);
//     }
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:dars_3/core/common/exceptions/custom_exception.dart';
import 'package:dars_3/features/home/data/datasource/home_remote_data_source.dart';
import 'package:dars_3/features/home/data/mappers/banner_mapper.dart';
import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
import 'package:dars_3/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});

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

