import 'package:fake_api_source_package/domain/model/product_model.dart';

abstract interface class ProductsRepository {
  Future<List<ProductModel>?> getProducts();
  Future<List<String>?> getCategories();
}
