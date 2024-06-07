import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/use_cases/cart/get_order_form_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_cart_repository.dart';

void main() {
  group("GetOrderFormUseCase tests", () {
    late MockCartRepository mockCartRepository;
    late GetOrderFormUseCase useCase;
    setUpAll(() {
      mockCartRepository = MockCartRepository();
      useCase = GetOrderFormUseCase(mockCartRepository);
    });

    test(
        'When invoke GetOrderFormUseCase and shared preferences not exist return null',
        () async {
      // Arrange
      when(() => mockCartRepository.fetchOrderForm()).thenAnswer(
        (_) async => null,
      );
      // Act
      final orderForm = await useCase.invoke();
      // Assert
      expect(orderForm, isNull);
    });

    test(
        'When invoke GetOrderFormUseCase and shared preferences exist return order form',
        () async {
      // Arrange
      when(() => mockCartRepository.fetchOrderForm()).thenAnswer(
        (_) async => [
          CartAppModel(id: 1, image: '', nameProduct: '', price: 0, quantity: 1)
        ],
      );
      // Act
      final orderForm = await useCase.invoke();
      // Assert
      expect(orderForm, isNotNull);
    });
  });
}
