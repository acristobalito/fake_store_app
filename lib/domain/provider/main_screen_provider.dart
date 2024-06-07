import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/use_cases/products/get_categories_use_case.dart';
import 'package:fake_store_app/domain/use_cases/cart/get_order_form_use_case.dart';
import 'package:fake_store_app/domain/use_cases/products/get_products_use_case.dart';
import 'package:fake_store_app/infraestructure/repositories/cart_repository.dart';
import 'package:fake_store_app/infraestructure/repositories/products_repository.dart';
import 'package:flutter/material.dart';

class MainScreenProvider extends ChangeNotifier {
  MainScreenProvider(
      {required this.productsRepository, required this.cartRepositoryImpl}) {
    getProductsUseCase = GetProductsUseCase(productsRepository);
    getCategoriesUseCase = GetCategoriesUseCase(productsRepository);
    getOrderFormUseCase = GetOrderFormUseCase(cartRepositoryImpl);
  }
  final ProductsRepository productsRepository;
  final CartRepository cartRepositoryImpl;
  late GetProductsUseCase getProductsUseCase;
  late GetCategoriesUseCase getCategoriesUseCase;
  late GetOrderFormUseCase getOrderFormUseCase;
  List<ProductModel>? products;
  List<ProductModel>? categoriesProducts;
  List<ProductModel>? searchedProducts;
  List<ProductModel>? recommendedForYouProducts;
  List<ProductModel>? newSectionsProducts;
  List<String> categories = ['Todas'];
  int currentPageIndex = 0;
  int cartQuantity = 0;
  bool isAdded = false;

  void setPageIndex(int newIndex) {
    if (newIndex != currentPageIndex) {
      currentPageIndex = newIndex;
      notifyListeners();
    }
  }

  void getData() async {
    _getProducts();
    _getCategories();
    updateCartQuantity();
  }

  void _getProducts() async {
    products = await getProductsUseCase.invoke();
    categoriesProducts = products;
    searchedProducts = products;
    notifyListeners();
    _getRecommendedForYouProducts(products);
    _getNewSectionProducts(products);
  }

  void _getCategories() async {
    final response = await getCategoriesUseCase.invoke();
    if (response != null) {
      categories.addAll(response);
      notifyListeners();
    }
  }

  void _getRecommendedForYouProducts(List<ProductModel>? products) {
    recommendedForYouProducts =
        getProductsUseCase.getRecommendedForYou(products);
    notifyListeners();
  }

  void _getNewSectionProducts(List<ProductModel>? products) {
    newSectionsProducts =
        getProductsUseCase.getNewSection(products, 'men\'s clothing');
    notifyListeners();
  }

  Future<void> updateCartQuantity() async {
    final orderForm = await getOrderFormUseCase.invoke();
    cartQuantity = 0;
    orderForm?.forEach(
      (element) {
        cartQuantity += element.quantity;
      },
    );
    notifyListeners();
  }

  void filterProduct(String category) {
    categoriesProducts =
        getProductsUseCase.filterProductFromCategory(products, category);
    notifyListeners();
  }

  List<ProductModel> searchProduct(String? keyWord) {
    return getProductsUseCase.searchProduct(products, keyWord);
  }
}
