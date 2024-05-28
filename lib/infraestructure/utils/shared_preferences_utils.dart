import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/models/mappers/cart_app_model_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static const orderFormKey = "OF";
  static final SharedPreferencesUtils _instance =
      SharedPreferencesUtils._internal();
  factory SharedPreferencesUtils() {
    return _instance;
  }
  SharedPreferencesUtils._internal();

  Future<SharedPreferences> _getSharedPreferences() async =>
      await SharedPreferences.getInstance();

  void setOrderForm(List<CartAppModel> orderForm) async {
    final pref = await _getSharedPreferences();
    pref.setString(orderFormKey, CartAppModelMapper.orderFormToJson(orderForm));
  }

  void removeOrderForm() async {
    final pref = await _getSharedPreferences();
    pref.remove(orderFormKey);
  }

  Future<List<CartAppModel>?> getOrderForm() async {
    final pref = await _getSharedPreferences();
    return CartAppModelMapper.orderFormFromJson(pref.getString(orderFormKey));
  }
}
