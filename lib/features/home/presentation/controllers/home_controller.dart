import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:dars_3/core/common/app/services/injcetion_container.dart';
import 'package:dars_3/features/home/domain/entities/banner_entity.dart';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:dars_3/features/home/domain/usecases/get_banners_usecase.dart';

class HomeProvider extends ChangeNotifier {
  final bannerUseCase = getIt<GetBannersUsecase>();
  final productUseCase = getIt<GetProductUsecase>();

  bool isLoading = false;
  BannerEntity? banners = BannerEntity();
  ProductEntiti? products = ProductEntiti();
  String? message;

  Future<void> getBanners() async {
    log("Get abnners called in provider");
    isLoading = true;
    notifyListeners();
    final result = await bannerUseCase.call();
    result.fold(
      (l) => message = l,
      (r) => banners = r,
    );
    log(banners!.data.toString());
    isLoading = false;
    notifyListeners();
  }

  Future<void> getProducts() async {
    log("Get products called in provider");
    isLoading = true;
    notifyListeners();
    final result = await productUseCase.call();
    result.fold(
      (l) => message = l,
      (r) => products = r,
    );
    log(products!.data.toString());
    isLoading = false;
    notifyListeners();
  }
}