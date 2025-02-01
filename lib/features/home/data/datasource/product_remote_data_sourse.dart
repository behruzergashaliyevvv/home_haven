// ignore_for_file: body_might_complete_normally_nullable

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dars_3/core/common/app/services/injcetion_container.dart';
import 'package:dars_3/core/common/exceptions/custom_exception.dart';
import 'package:dars_3/core/utils/constants/network_constants.dart';
import 'package:dars_3/core/utils/constants/prefs_keys.dart';
import 'package:dars_3/features/home/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductRemoteDataSourse {
  Future<ProductModel?> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSourse {
  final dio = getIt<Dio>();
  @override
  Future<ProductModel?> getProducts() async {
    final String? token =
        getIt<SharedPreferences>().getString(PrefsKeys.tokenKey);
    log("payload $token");
    try {
      final response = await dio.get(NetworkConstants.productUrl,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ));
      log("payload ${response.statusCode}");
      if (response.statusCode == 200) {
        final payload = response.data;
        log("payload $payload");
        return ProductModel.fromJson(payload);
      }
    } catch (e) {
      log("payload $e");
      throw ServerException(
        errorMessage: "Error happened while fetching banners",
        statusCode: 500,
      );
    }
  }
}
