import 'package:dars_3/features/home/data/datasource/product_remote_data_source.dart';
import 'package:dars_3/features/home/data/mappers/product_mapper.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:dars_3/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dars_3/core/common/exceptions/custom_exception.dart';

class ProRepoImpl implements ProRepo {
  final ProRemoteDataSource proRemoteDataSource;

  ProRepoImpl({required this.proRemoteDataSource});

  @override
  Future<Either<dynamic, ProductEntity>> getProducts() async {
    try {
      final result = await proRemoteDataSource.getProducts();
      return Right(ProductMapper.mapProductEntity(result));
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }
}
