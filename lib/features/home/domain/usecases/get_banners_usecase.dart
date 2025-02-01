import 'package:dartz/dartz.dart';
import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:dars_3/features/home/domain/repositories/home_repo.dart';

class GetBannersUsecase {
  final HomeRepo homeRepo;

  GetBannersUsecase({required this.homeRepo});

  Future<Either<dynamic, BannerEntity>> call() async {
    return await homeRepo.getBanners();
  }
}

class GetProductUsecase{
  final Productrepo productrepo;

  GetProductUsecase({required this.productrepo});

  Future<Either<dynamic, ProductEntiti>> call() async{
    return await productrepo.getProduct();
  }
}
