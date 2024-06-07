import 'package:fake_store_app/infraestructure/repositories/products_repository.dart';

class GetCategoriesUseCase {
  final ProductsRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<String>?> invoke() async => await repository.getCategories();
}
