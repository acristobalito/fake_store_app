import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/infraestructure/datasources/cart_data_source.dart';
import 'package:fake_store_app/infraestructure/datasources/impl/cart_data_source_impl.dart';
import 'package:fake_store_app/infraestructure/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDataSource dataSource = CartDataSourceImpl();
  @override
  Future<List<CartAppModel>?> fetchOrderForm() => dataSource.fetchOrderForm();

  @override
  void appendOrderForm(CartAppModel cart) => dataSource.appendOrderForm(cart);

  @override
  void updateOrderForm(List<CartAppModel> newOrderForm) =>
      dataSource.updateOrderForm(newOrderForm);
}
