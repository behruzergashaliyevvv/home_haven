import 'dart:developer';
import 'package:dars_3/features/home/domain/entities/product_entity.dart';
import 'package:dars_3/features/home/domain/usecases/get_products_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:dars_3/core/common/app/services/injcetion_container.dart';

class ProProvider extends ChangeNotifier {
  final productUseCase = getIt<GetProductsUsecase>();

  bool isLoading = false;
  ProductEntity? products = ProductEntity(); // TO‘G‘RILANDI!
  String? message;

  Future<void> getProducts() async {
    log("Get products called in provider");
    isLoading = true;
    notifyListeners();
    final result = await productUseCase.call();
    result.fold(
      (l) => message = l,
      (r) => products = r, // TO‘G‘RILANDI!
    );
    log(products!.data.toString()); // TO‘G‘RILANDI!
    isLoading = false;
    notifyListeners();
  }
}
