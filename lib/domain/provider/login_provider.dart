import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/use_cases/user/login_user_use_case.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final loginUseCase = LoginUserUseCase();
  bool isLoading = false;

  void logginUser(String userName, String password,
      {required VoidCallback onSuccess,
      required Function(String) onFailure}) async {
    _setLoading(true);
    final request = await loginUseCase
        .invoke(LoginParamsModel(username: userName, password: password));
    request != null
        ? onSuccess.call()
        : onFailure.call('Ups! ocurrio un error en el loggeo');
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
