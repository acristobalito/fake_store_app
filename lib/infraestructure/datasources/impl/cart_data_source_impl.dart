import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/infraestructure/datasources/cart_data_source.dart';
import 'package:fake_store_app/infraestructure/utils/shared_preferences_utils.dart';

class CartDataSourceImpl implements CartDataSource {
  final sharedPreferences = SharedPreferencesUtils();
  @override
  Future<List<CartAppModel>?> fetchOrderForm() async =>
      await sharedPreferences.getOrderForm();
  @override
  void appendOrderForm(CartAppModel cart) async {
    final orderForm = await sharedPreferences.getOrderForm();
    if (orderForm != null) {
      final order = orderForm.firstWhere(
        (element) => element.id == cart.id,
        orElse: () => cart,
      );

      (order != cart) ? order.quantity++ : orderForm.add(order);
      sharedPreferences.setOrderForm(orderForm);
    } else {
      sharedPreferences.setOrderForm([cart]);
    }
  }

  @override
  void updateOrderForm(List<CartAppModel> newOrderForm) =>
      (newOrderForm.isNotEmpty)
          ? sharedPreferences.setOrderForm(newOrderForm)
          : sharedPreferences.removeOrderForm();
}
