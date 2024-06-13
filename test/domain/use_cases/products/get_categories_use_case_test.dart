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
      when(() => mockProductsRepository.getCategories()).thenAnswer(
        (_) async => null,
      );
      final categories = await useCase.invoke();
      expect(categories, isNull, reason: 'Categories should be null');
    });

    test(
        'When invoke GetCategoriesUseCase and service response should return valid list of categories',
        () async {
      when(() => mockProductsRepository.getCategories()).thenAnswer(
        (_) async => ['1', '2', '3'],
      );
      final categories = await useCase.invoke();
      expect(categories, isNotNull, reason: 'Categories should not be null');
    });
  });
}
