import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/models/user/user_params_model.dart';
import 'package:fake_store_app/domain/use_cases/user/register_user_use_case.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  final registerUseCase = RegisterUserUseCase();
  bool isLoading = false;

  void registerUser(UserParamsModel user,
      {required VoidCallback onSuccess,
      required Function(String) onFailure}) async {
    _setLoading(true);
    final params = UserModel(
        email: user.email,
        username: user.username,
        password: user.password,
        name: NameModel(firstname: user.firstname, lastname: user.lastname),
        address: AddressModel(
            city: 'Fake Store',
            street: 'Unknow',
            number: 123,
            zipcode: '123-456',
            geolocation: GeolocationModel(lat: '-12.123', long: '80.0000')),
        phone: user.phone);
    final request = await registerUseCase.invoke(params);
    request != null
        ? onSuccess.call()
        : onFailure.call('Ops!, ocurrio un error durante el registro');
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
