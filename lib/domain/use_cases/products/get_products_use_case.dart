import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/infraestructure/repositories/products_repository.dart';

class GetProductsUseCase {
  final ProductsRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductModel>?> invoke() async => await repository.getProducts();

  List<ProductModel> getRecommendedForYou(List<ProductModel>? products) {
    if (products != null) {
      products.shuffle();
      return products.take(5).toList();
    } else {
      return [];
    }
  }

  List<ProductModel> getNewSection(
      List<ProductModel>? products, String category) {
    if (products != null) {
      return products
          .where((product) => product.category == category)
          .take(5)
          .toList();
    } else {
      return [];
    }
  }

  List<ProductModel> filterProductFromCategory(
      List<ProductModel>? products, String? category) {
    if (products != null) {
      return switch (category) {
        'electronics' ||
        'jewelery' ||
        'men\'s clothing' ||
        'women\'s clothing' =>
          products
              .where(
                (product) => product.category == category,
              )
              .toList(),
        _ => products
      };
    } else {
      return [];
    }
  }

  List<ProductModel> searchProduct(
      List<ProductModel>? products, String? keyWord) {
    if (products != null) {
      if (keyWord == null) {
        return products;
      }
      return products
          .where((product) =>
              product.title.toLowerCase().contains(keyWord.toLowerCase()))
          .toList();
    } else {
      return [];
    }
  }
}
