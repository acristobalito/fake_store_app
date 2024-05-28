import 'package:fake_api_source_package/fake_api_source_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/infraestructure/datasources/products_data_source.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final catalog = FakeApiSourcePackage();

  @override
  Future<List<ProductModel>?> getProducts() async {
    final response = await catalog.getAllProducts();
    return response.fold(
      (l) => null,
      (r) => r,
    );
  }

  @override
  Future<List<String>?> getCategories() async {
    final response = await catalog.getAllCategories();
    return response.fold((l) => null, (r) => r.categories);
  }
}
