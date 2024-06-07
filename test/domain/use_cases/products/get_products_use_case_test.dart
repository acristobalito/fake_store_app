import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/use_cases/products/get_products_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mock_products_repository.dart';

void main() {
  group("GetProductsUseCase tests", () {
    late MockProductsRepository mockProductsRepository;
    late GetProductsUseCase useCase;
    setUpAll(() {
      mockProductsRepository = MockProductsRepository();
      useCase = GetProductsUseCase(mockProductsRepository);
    });

    test('When invoke GetProductsUseCase and service fail should return null',
        () async {
      // Arrange
      when(() => mockProductsRepository.getProducts()).thenAnswer(
        (_) async => null,
      );
      // Act
      final products = await useCase.invoke();
      // Assert
      expect(products, isNull);
    });

    test(
        'When invoke GetProductsUseCase and service response should return valid list of categories',
        () async {
      // Arrange
      when(() => mockProductsRepository.getProducts()).thenAnswer(
        (_) async => [
          ProductModel(
              id: 1,
              title: '',
              price: 0,
              description: '',
              category: '',
              image: '',
              rating: RatingModel(rate: 0, count: 0))
        ],
      );
      // Act
      final products = await useCase.invoke();
      // Assert
      expect(products, isA<List<ProductModel>>());
    });

    test('When call getRecommendedForYou with out products return empty list',
        () {
      // Arrange
      const products = null;
      // Act
      final productsFiltered = useCase.getRecommendedForYou(products);
      // Assert
      expect(productsFiltered, isEmpty);
    });

    test('When call getRecommendedForYou with products return list filtered',
        () {
      // Arrange
      final products = [
        ProductModel(
            id: 1,
            title: '',
            price: 0,
            description: '',
            category: '',
            image: '',
            rating: RatingModel(rate: 0, count: 0))
      ];
      // Act
      final productsFiltered = useCase.getRecommendedForYou(products);
      // Assert
      expect(productsFiltered, isNotEmpty);
    });

    test('When call getNewSection with out products return empty list', () {
      // Arrange
      const products = null;
      // Act
      final productsFiltered = useCase.getNewSection(products, '');
      // Assert
      expect(productsFiltered, isEmpty);
    });

    test('When call getNewSection with products return list filtered', () {
      // Arrange
      final products = [
        ProductModel(
            id: 1,
            title: '',
            price: 0,
            description: '',
            category: 'abc',
            image: '',
            rating: RatingModel(rate: 0, count: 0))
      ];
      // Act
      final productsFiltered = useCase.getNewSection(products, 'abc');
      // Assert
      expect(productsFiltered, isNotEmpty);
    });

    test(
        'When call filterProductFromCategory with out products return empty list',
        () {
      // Arrange
      const products = null;
      // Act
      final productsFiltered =
          useCase.filterProductFromCategory(products, 'electronics');
      // Assert
      expect(productsFiltered, isEmpty);
    });

    test(
        'When call filterProductFromCategory with two products return list filtered with one product',
        () {
      // Arrange
      final products = [
        ProductModel(
            id: 1,
            title: '',
            price: 0,
            description: '',
            category: 'abc',
            image: '',
            rating: RatingModel(rate: 0, count: 0)),
        ProductModel(
            id: 1,
            title: '',
            price: 0,
            description: '',
            category: 'electronics',
            image: '',
            rating: RatingModel(rate: 0, count: 0))
      ];
      // Act
      final productsFiltered =
          useCase.filterProductFromCategory(products, 'electronics');
      // Assert
      expect(productsFiltered.length, 1);
    });

    test(
        'When call filterProductFromCategory with two products and unknow category return same list',
        () {
      // Arrange
      final products = [
        ProductModel(
            id: 1,
            title: '',
            price: 0,
            description: '',
            category: 'abc',
            image: '',
            rating: RatingModel(rate: 0, count: 0)),
        ProductModel(
            id: 1,
            title: '',
            price: 0,
            description: '',
            category: 'electronics',
            image: '',
            rating: RatingModel(rate: 0, count: 0))
      ];
      // Act
      final productsFiltered =
          useCase.filterProductFromCategory(products, 'abc');
      // Assert
      expect(productsFiltered.length, 2);
    });

    test('When call searchProduct with out products return empty list', () {
      // Arrange
      const products = null;
      // Act
      final productsFiltered = useCase.searchProduct(products, '');
      // Assert
      expect(productsFiltered, isEmpty);
    });

    test(
        'When call searchProduct with products and null keyword return same products',
        () {
      // Arrange
      final products = [
        ProductModel(
            id: 1,
            title: '',
            price: 0,
            description: '',
            category: 'abc',
            image: '',
            rating: RatingModel(rate: 0, count: 0)),
        ProductModel(
            id: 1,
            title: '',
            price: 0,
            description: '',
            category: 'electronics',
            image: '',
            rating: RatingModel(rate: 0, count: 0))
      ];
      // Act
      final productsFiltered = useCase.searchProduct(products, null);
      // Assert
      expect(productsFiltered.length, 2);
    });

    test(
        'When call filterProductFromCategory with two products and valid keywordreturn filtered list',
        () {
      // Arrange
      final products = [
        ProductModel(
            id: 1,
            title: 'Antorcha',
            price: 0,
            description: '',
            category: 'abc',
            image: '',
            rating: RatingModel(rate: 0, count: 0)),
        ProductModel(
            id: 2,
            title: 'Beicon',
            price: 0,
            description: '',
            category: 'electronics',
            image: '',
            rating: RatingModel(rate: 0, count: 0))
      ];
      // Act
      final productsFiltered = useCase.searchProduct(products, 'An');
      // Assert
      expect(productsFiltered.length, 1);
    });
  });
}
