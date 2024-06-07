import 'package:fake_store_app/domain/use_cases/products/get_categories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_products_repository.dart';

void main() {
  group("GetCategoriesUseCase tests", () {
    late MockProductsRepository mockProductsRepository;
    late GetCategoriesUseCase useCase;
    setUpAll(() {
      mockProductsRepository = MockProductsRepository();
      useCase = GetCategoriesUseCase(mockProductsRepository);
    });

    test('When invoke GetCategoriesUseCase and service fail should return null',
        () async {
      // Arrange
      when(() => mockProductsRepository.getCategories()).thenAnswer(
        (_) async => null,
      );
      // Act
      final categories = await useCase.invoke();
      // Assert
      expect(categories, isNull);
    });

    test(
        'When invoke GetCategoriesUseCase and service response should return valid list of categories',
        () async {
      // Arrange
      when(() => mockProductsRepository.getCategories()).thenAnswer(
        (_) async => ['1', '2', '3'],
      );
      // Act
      final categories = await useCase.invoke();
      // Assert
      expect(categories, isNotNull);
    });
  });
}
