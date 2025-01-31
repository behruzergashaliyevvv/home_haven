import 'package:dars_3/features/home/data/datasource/home_remote_data_source.dart';
import 'package:dars_3/features/home/data/datasource/product_remote_data_source.dart';
import 'package:dars_3/features/home/data/mappers/product_mapper.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:dars_3/features/home/domain/repositories/product_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dars_3/core/common/exceptions/custom_exception.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl({required this.productRemoteDataSource});

  @override
  Future<Either<dynamic, ProductEntity>> getProducts() async {
    try {
      final result = await productRemoteDataSource.getProducts();
      return Right(ProductMapper.mapProductEntity(result));
    } on ServerException catch (e) {
      return Left(e.errorMessage);
    }
  }
}
