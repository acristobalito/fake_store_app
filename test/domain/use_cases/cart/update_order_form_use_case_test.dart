import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/use_cases/cart/update_oder_form_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_cart_repository.dart';

void main() {
  group("UpdateOrderFormUseCase tests", () {
    late List<CartAppModel> cartAppModel;
    late MockCartRepository mockCartRepository;
    late UpdateOderFormUseCase useCase;
    setUpAll(() {
      mockCartRepository = MockCartRepository();
      useCase = UpdateOderFormUseCase(mockCartRepository);
      cartAppModel = [
        CartAppModel(id: 1, image: '', nameProduct: '', price: 0, quantity: 1)
      ];
      registerFallbackValue(cartAppModel);
    });

    test(
        'When invoke UpdateOrderFormUseCase shared preferences should not null',
        () {
      // Arrange
      bool isUpdatedOrderForm = false;
      when(() => mockCartRepository.updateOrderForm(any())).thenAnswer(
        (_) async => isUpdatedOrderForm = true,
      );
      // Act
      useCase.invoke(cartAppModel);
      // Assert
      expect(isUpdatedOrderForm, true);
    });
  });
}
