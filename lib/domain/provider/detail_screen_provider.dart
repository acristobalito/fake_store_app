import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/use_cases/cart/append_order_form_use_case.dart';
import 'package:fake_store_app/domain/use_cases/cart/get_order_form_use_case.dart';
import 'package:fake_store_app/infraestructure/repositories/cart_repository.dart';
import 'package:flutter/material.dart';

class DetailScreenProvider extends ChangeNotifier {
  late AppendOrderFormUseCase appendOrderFormUseCase;
  late GetOrderFormUseCase getOrderFormUseCase;
  late ProductWidgetModel product;
  final CartRepository cartRepository;
  bool isAdded = true;

  DetailScreenProvider({required this.cartRepository}) {
    appendOrderFormUseCase = AppendOrderFormUseCase(cartRepository);
    getOrderFormUseCase = GetOrderFormUseCase(cartRepository);
  }

  void setProduct(ProductWidgetModel productSend) {
    product = productSend;
    validateProductAdded();
  }

  Future<void> addOrderForm(CartAppModel cart) async {
    await appendOrderFormUseCase.invoke(cart);
    await validateProductAdded();
  }

  Future<void> validateProductAdded() async {
    final orderForm = await getOrderFormUseCase.invoke();
    isAdded = orderForm?.any((element) => element.id == product.id) ?? false;
    notifyListeners();
  }
}
