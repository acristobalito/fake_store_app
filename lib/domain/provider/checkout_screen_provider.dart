import 'package:ecommerce_widgets_package/domain/model/cart_widget_model.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/use_cases/cart/get_order_form_use_case.dart';
import 'package:fake_store_app/domain/use_cases/cart/update_oder_form_use_case.dart';
import 'package:fake_store_app/infraestructure/repositories/cart_repository.dart';
import 'package:flutter/material.dart';

class CheckoutScreenProvider extends ChangeNotifier {
  late UpdateOderFormUseCase updateOderFormUseCase;
  late GetOrderFormUseCase getOrderFormUseCase;
  final CartRepository cartRepository;
  double total = 0;
  List<CartAppModel>? products;
  CheckoutScreenProvider({required this.cartRepository}) {
    updateOderFormUseCase = UpdateOderFormUseCase(cartRepository);
    getOrderFormUseCase = GetOrderFormUseCase(cartRepository);
  }

  void getOrderForm() async {
    products = await getOrderFormUseCase.invoke();
    _verifyTotal();
    notifyListeners();
  }

  void addUnitsProduct(CartWidgetModel product) {
    final filteredProduct =
        products?.firstWhere((element) => element.id == product.id);
    filteredProduct?.quantity++;
    _verifyTotal();
    notifyListeners();
  }

  void substractUnitsProducts(CartWidgetModel product) {
    final filteredProduct =
        products?.firstWhere((element) => element.id == product.id);

    if ((filteredProduct?.quantity ?? 1) > 1) {
      filteredProduct?.quantity--;
      _verifyTotal();
      notifyListeners();
    } else {
      removeProduct(product);
    }
  }

  void removeProduct(CartWidgetModel product) {
    products?.removeWhere((element) => element.id == product.id);
    _verifyTotal();
    notifyListeners();
  }

  void removeOrderForm() {
    products?.clear();
    _verifyTotal();
    notifyListeners();
  }

  void _verifyTotal() {
    total = 0;
    products?.forEach(
      (element) {
        total += (element.price * element.quantity);
      },
    );
  }

  void updateOrderForm() {
    updateOderFormUseCase.invoke(products ?? []);
  }
}
