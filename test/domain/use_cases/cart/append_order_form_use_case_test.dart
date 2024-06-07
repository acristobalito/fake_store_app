import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/use_cases/cart/append_order_form_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_cart_repository.dart';

void main() {
  group("AppendOrderFormUseCase tests", () {
    late CartAppModel cartAppModel;
    late MockCartRepository mockCartRepository;
    late AppendOrderFormUseCase useCase;
    setUpAll(() {
      mockCartRepository = MockCartRepository();
      useCase = AppendOrderFormUseCase(mockCartRepository);
      cartAppModel = CartAppModel(
          id: 1, image: '', nameProduct: '', price: 0, quantity: 1);
      registerFallbackValue(cartAppModel);
    });

    test(
        'When invoke AppendOrderFormUseCase shared preferences should not null',
        () {
      // Arrange
      bool isAddedOrderForm = false;
      when(() => mockCartRepository.appendOrderForm(any())).thenAnswer(
        (_) async => isAddedOrderForm = true,
      );
      // Act
      useCase.invoke(cartAppModel);
      // Assert
      expect(isAddedOrderForm, true);
    });
  });
}
