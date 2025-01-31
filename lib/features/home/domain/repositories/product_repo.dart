

import 'package:dartz/dartz.dart';

import 'package:dars_3/features/home/domain/entities/product_entity.dart';

abstract class ProRepo {

  Future<Either<dynamic, ProductEntity>> getProducts();
}

