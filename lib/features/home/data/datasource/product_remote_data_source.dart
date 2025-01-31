import 'package:dars_3/core/common/app/services/injcetion_container.dart';
import 'package:dars_3/core/common/exceptions/custom_exception.dart';
import 'package:dars_3/core/utils/constants/network_constants.dart';
import 'package:dars_3/core/utils/constants/prefs_keys.dart';
import 'package:dars_3/features/home/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel?> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final dio = getIt<Dio>();

  @override
  Future<ProductModel?> getProducts() async {
    final String? token =
        getIt<SharedPreferences>().getString(PrefsKeys.tokenKey);

    try {
      final response = await dio.get(NetworkConstants.productUrl,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final payload = response.data;
        return ProductModel.fromJson(payload);
      }
    } catch (e) {
      throw ServerException(
        errorMessage: "Error happened while fetching products",
        statusCode: 500,
      );
    }
  }
}
