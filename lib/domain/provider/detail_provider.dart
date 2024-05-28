import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/use_cases/append_order_form_use_case.dart';
import 'package:fake_store_app/domain/use_cases/get_order_form_use_case.dart';
import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  final appendOrderFormUseCase = AppendOrderFormUseCase();
  final getOrderFormUseCase = GetOrderFormUseCase();
  ProductWidgetModel product;
  bool isAdded = true;

  DetailProvider(this.product) {
    validateProductAdded();
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
