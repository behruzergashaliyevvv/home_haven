import 'package:dio/dio.dart';
import 'package:dars_3/core/common/app/services/injcetion_container.dart';
import 'package:dars_3/core/common/exceptions/custom_exception.dart';
import 'package:dars_3/core/utils/constants/network_constants.dart';
import 'package:dars_3/core/utils/constants/prefs_keys.dart';
import 'package:dars_3/features/home/data/models/banner_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeRemoteDataSource {
  Future<BannerModel?> getBanners();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final dio = getIt<Dio>();

  @override
  Future<BannerModel?> getBanners() async {
    final String? token =
        getIt<SharedPreferences>().getString(PrefsKeys.tokenKey);

    try {
      final response = await dio.get(NetworkConstants.bannerUrl,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        final payload = response.data;
        return BannerModel.fromJson(payload);
      }
    } catch (e) {
      throw ServerException(
        errorMessage: "Error happened while fetching banners",
        statusCode: 500,
      );
    }
  }
}
