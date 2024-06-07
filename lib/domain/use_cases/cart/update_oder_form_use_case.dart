import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/infraestructure/repositories/cart_repository.dart';

class UpdateOderFormUseCase {
  final CartRepository cartRepository;

  UpdateOderFormUseCase(this.cartRepository);

  Future<void> invoke(List<CartAppModel> cart) async =>
      cartRepository.updateOrderForm(cart);
}
