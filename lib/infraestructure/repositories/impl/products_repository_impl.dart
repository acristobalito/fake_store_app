import 'package:fake_api_source_package/domain/model/login_params_model.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/domain/model/user_model.dart';
import 'package:fake_store_app/infraestructure/datasources/impl/products_data_source_impl.dart';
import 'package:fake_store_app/infraestructure/datasources/products_data_source.dart';
import 'package:fake_store_app/infraestructure/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsDataSource productsDataSource = ProductsDataSourceImpl();
  @override
  Future<List<ProductModel>?> getProducts() => productsDataSource.getProducts();

  @override
  Future<List<String>?> getCategories() => productsDataSource.getCategories();

  @override
  Future<String?> loginUser(LoginParamsModel loginParams) =>
      productsDataSource.loginUser(loginParams);

  @override
  Future<int?> registerUser(UserModel user) =>
      productsDataSource.registerUser(user);
}
