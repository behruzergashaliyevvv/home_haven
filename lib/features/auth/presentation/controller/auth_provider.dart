// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dars_3/core/common/app/services/injcetion_container.dart';

import 'package:dars_3/features/auth/domain/usecases/login_usecase.dart';
import 'package:dars_3/features/auth/domain/usecases/register_usecase.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUsecase loginUsecase = getIt<LoginUsecase>();
  final RegisterUsecase registerUsecase = getIt<RegisterUsecase>();

  AuthProvider();

  bool isLoading = false;
  String message = "";

  Future<void> loginWithPhone({
    required String phoneNumber,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    log("data in usecase: $phoneNumber, $password");
    final result = await loginUsecase.call(
      phoneNumber: phoneNumber,
      password: password,
    );
    isLoading = false;

    result.fold(
      (error) => message = error,
      (_) => message = "Login succcesfuly",
    );
    notifyListeners();
  }

  // register
  Future<void> register({
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();
    final result = await registerUsecase.call(
      phoneNumber: phoneNumber,
      email: email,
      password: password,
    );

    log(result.toString());
    isLoading = false;
    notifyListeners();
    return result.fold(
      (error) {
        message = error;
      },
      (success) {
        message = "Successfully registered.";
      },
    );
  }
}
