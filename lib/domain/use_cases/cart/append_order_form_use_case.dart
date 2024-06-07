import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/infraestructure/repositories/cart_repository.dart';

class AppendOrderFormUseCase {
  final CartRepository cartRepository;

  AppendOrderFormUseCase(this.cartRepository);

  Future<void> invoke(CartAppModel cart) async =>
      cartRepository.appendOrderForm(cart);
}
