import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dars_3/core/common/exceptions/custom_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dars_3/core/common/app/services/injcetion_container.dart';
import 'package:dars_3/core/utils/constants/network_constants.dart';
import 'package:dars_3/core/utils/constants/prefs_keys.dart';

sealed class AuthRemoteDataSource {
  Future<bool?> login({
    required String phoneNumber,
    required String password,
  });

  Future<bool?> register({
    required String phoneNumber,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Dio dio = getIt<Dio>();

  AuthRemoteDataSourceImpl();

  @override
  Future<bool?> login({
    required String phoneNumber,
    required String password,
  }) async {
    log("data in data source: $phoneNumber, $password");

    final url = "${NetworkConstants.authUrl}/signin";
    final data = {
      "phone_number": phoneNumber,
      "email": "",
      "auth_method": "phone-number",
      "password": password,
    };

    try {
      final response =
          await dio.post(url, data: jsonEncode(data), options: Options());
      log(response.data.toString());
      if (response.statusCode == 201) {
        log(response.statusCode.toString());
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            PrefsKeys.tokenKey, response.data["data"]["access_token"]);
        log(response.data["data"]["access_token"]);
        return true;
      }
      return false;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        log("User with same credentials already exist.");
        throw ServerException(
            errorMessage: "Incorrect credentials are provided",
            statusCode: 400);
      }
      log("Error happened: while logging in: $e");
    } catch (e) {
      throw ServerException(
          errorMessage: "Please try again later.", statusCode: 500);
    }
  }

  @override
  Future<bool?> register({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    final url = "${NetworkConstants.authUrl}/signup";

    final data = {
      "phone_number": phoneNumber,
      "email": email,
      "auth_method": "phone-number",
      "password": password
    };

    try {
      final response = await dio.post(
        url,
        data: jsonEncode(data),
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );

      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            PrefsKeys.tokenKey, response.data["data"]["access_token"]);
        log(response.data["data"]["access_token"].toString());
        return true;
      }
      return false;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        log("User with same credentials already exist.");
        throw ServerException(
            errorMessage: "User with same credentials already exist.",
            statusCode: 400);
      }
    } catch (e) {
      log("Error happened while registering: $e");
      throw ServerException(errorMessage: "Please try again.", statusCode: 400);
    }
  }
}
