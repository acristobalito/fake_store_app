import 'dart:convert';

import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';

class CartAppModelMapper {
  static CartAppModel _cartFromJson(Map<String, dynamic> json) => CartAppModel(
      id: json["id"],
      image: json["image"],
      nameProduct: json["nameProduct"],
      price: json["price"],
      quantity: json["quantity"]);

  static List<CartAppModel>? orderFormFromJson(String? json) => (json != null)
      ? List<CartAppModel>.from(
          jsonDecode(json).map((jsonCart) => _cartFromJson(jsonCart)))
      : null;

  static Map<String, dynamic> _cartToJson(CartAppModel cart) => {
        "id": cart.id,
        "image": cart.image,
        "nameProduct": cart.nameProduct,
        "price": cart.price,
        "quantity": cart.quantity,
      };

  static String orderFormToJson(List<CartAppModel> carts) {
    final converted = carts.map((cart) => _cartToJson(cart)).toList();
    return jsonEncode(converted);
  }
}
