import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';

abstract interface class ProductsDataSource {
  Future<List<ProductModel>?> getProducts();
  Future<List<String>?> getCategories();
  Future<int?> registerUser(UserModel user);
  Future<String?> loginUser(LoginParamsModel loginParams);
}
