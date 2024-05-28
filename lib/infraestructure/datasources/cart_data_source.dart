import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';

abstract interface class CartDataSource {
  Future<List<CartAppModel>?> fetchOrderForm();
  void appendOrderForm(CartAppModel cart);
  void updateOrderForm(List<CartAppModel> newOrderForm);
}
