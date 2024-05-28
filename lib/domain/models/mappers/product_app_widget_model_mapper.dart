import 'package:ecommerce_widgets_package/domain/model/cart_widget_model.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';

class ProductAppWidgetModelMapper {
  static List<CartWidgetModel> mapProductsModel(List<CartAppModel>? products) =>
      (products != null)
          ? products
              .map(
                (product) => CartWidgetModel(
                    id: product.id,
                    quantity: product.quantity,
                    image: product.image,
                    nameProduct: product.nameProduct,
                    price: product.price),
              )
              .toList()
          : [];
}
