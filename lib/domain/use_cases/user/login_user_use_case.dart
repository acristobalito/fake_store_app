import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/infraestructure/repositories/products_repository.dart';

class LoginUserUseCase {
  final ProductsRepository repository;

  LoginUserUseCase(this.repository);

  Future<String?> invoke(LoginParamsModel params) async =>
      await repository.loginUser(params);
}
