import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
import 'package:dartz/dartz.dart';


abstract class HomeRepo {
  Future<Either<dynamic, BannerEntity>> getBanners();
}
