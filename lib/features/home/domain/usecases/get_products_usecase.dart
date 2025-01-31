import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:dars_3/features/home/domain/repositories/product_repo.dart';
import 'package:dartz/dartz.dart';

class GetProductsUsecase {
  final ProductRepo productRepo;

  GetProductsUsecase({required this.productRepo});

  Future<Either<dynamic, ProductEntity>> call() async {
    return await productRepo.getProducts();
  }
}