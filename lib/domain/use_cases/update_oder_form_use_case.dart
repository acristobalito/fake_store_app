import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/infraestructure/repositories/cart_repository.dart';
import 'package:fake_store_app/infraestructure/repositories/impl/cart_repository_impl.dart';

class UpdateOderFormUseCase {
  final CartRepository cartRepository = CartRepositoryImpl();

  Future<void> invoke(List<CartAppModel> cart) async =>
      cartRepository.updateOrderForm(cart);
}
