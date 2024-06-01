import 'package:fake_store_app/infraestructure/repositories/impl/products_repository_impl.dart';
import 'package:fake_store_app/infraestructure/repositories/products_repository.dart';

class GetCategoriesUseCase {
  final ProductsRepository repository = ProductsRepositoryImpl();

  Future<List<String>?> invoke() async => await repository.getCategories();
}
