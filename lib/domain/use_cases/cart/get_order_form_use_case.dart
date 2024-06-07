import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/infraestructure/repositories/cart_repository.dart';

class GetOrderFormUseCase {
  final CartRepository cartRepository;

  GetOrderFormUseCase(this.cartRepository);
  Future<List<CartAppModel>?> invoke() => cartRepository.fetchOrderForm();
}
