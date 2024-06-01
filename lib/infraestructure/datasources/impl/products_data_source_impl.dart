import 'package:fake_api_source_package/fake_api_source_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/product/product_repository_impl.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_api_source_package/infrastructure/repositories/user/user_repository_impl.dart';
import 'package:fake_store_app/infraestructure/datasources/products_data_source.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final catalog =
      FakeApiSourcePackage(ProductRepositoryImpl(), UserRepositoryImpl());

  @override
  Future<List<ProductModel>?> getProducts() async {
    final response = await catalog.getAllProducts();
    return response.fold(
      (onError) => null,
      (products) => products,
    );
  }

  @override
  Future<List<String>?> getCategories() async {
    final response = await catalog.getAllCategories();
    return response.fold((onError) => null,
        (responseCategories) => responseCategories.categories);
  }

  @override
  Future<String?> loginUser(LoginParamsModel loginParams) async {
    final response = await catalog.loginUser(loginParams);
    return response.fold(
      (onError) => null,
      (token) => token,
    );
  }

  @override
  Future<int?> registerUser(UserModel user) async {
    final response = await catalog.registerUser(user);
    return response.fold(
      (onError) => null,
      (idUser) => idUser,
    );
  }
}
