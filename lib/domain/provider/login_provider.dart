import 'package:fake_api_source_package/fake_api_source_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final userCatalog = FakeApiSourcePackage();
  bool isLoading = false;

  void logginUser(String userName, String password,
      {required VoidCallback onSuccess,
      required Function(String) onFailure}) async {
    _setLoading(true);
    final request = await userCatalog
        .loginUser(LoginParamsModel(username: userName, password: password));
    request.fold(
      (l) => onFailure.call(l.message),
      (r) => onSuccess.call(),
    );
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
