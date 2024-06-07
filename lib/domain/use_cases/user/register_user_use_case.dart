import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/infraestructure/repositories/products_repository.dart';

class RegisterUserUseCase {
  final ProductsRepository repository;

  RegisterUserUseCase(this.repository);

  Future<int?> invoke(UserModel userModel) async =>
      await repository.registerUser(userModel);
}
