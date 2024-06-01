import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_store_app/domain/use_cases/products/get_products_use_case.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  final getProductsUseCase = GetProductsUseCase();
  List<ProductModel>? products;
  List<ProductModel>? searchedProducts;
  bool isProductsSetted = false;
  void setProducts(List<ProductModel>? productsRecieve) {
    if (!isProductsSetted) {
      products = productsRecieve;
      searchedProducts = products;
      isProductsSetted = true;
    }
  }

  void searchProduct(String? keyWord) {
    searchedProducts = getProductsUseCase.searchProduct(products, keyWord);
    notifyListeners();
  }
}
