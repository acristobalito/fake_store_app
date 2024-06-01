import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/infraestructure/repositories/impl/products_repository_impl.dart';
import 'package:fake_store_app/infraestructure/repositories/products_repository.dart';

class RegisterUserUseCase {
  final ProductsRepository repository = ProductsRepositoryImpl();

  Future<int?> invoke(UserModel userModel) async =>
      await repository.registerUser(userModel);
}
