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
      when(() => mockProductsRepository.getProducts()).thenAnswer(
        (_) async => null,
      );
      final products = await useCase.invoke();
      expect(products, isNull, reason: 'Products should be null');
    });

    test(
        'When invoke GetProductsUseCase and service response should return valid list of categories',
        () async {
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
      final products = await useCase.invoke();
      expect(products, isA<List<ProductModel>>(),
          reason: 'Products should be a valid list of products');
    });

    test('When call getRecommendedForYou with out products return empty list',
        () {
      const products = null;
      final productsFiltered = useCase.getRecommendedForYou(products);
      expect(productsFiltered, isEmpty,
          reason: 'Filtered products list should be empty');
    });

    test('When call getRecommendedForYou with products return list filtered',
        () {
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
      final productsFiltered = useCase.getRecommendedForYou(products);
      expect(productsFiltered, isNotEmpty,
          reason: 'Filtered products should not be empty');
    });

    test('When call getNewSection with out products return empty list', () {
      const products = null;
      final productsFiltered = useCase.getNewSection(products, '');
      expect(productsFiltered, isEmpty,
          reason: 'Filtered products should be empty');
    });

    test('When call getNewSection with products return list filtered', () {
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
      final productsFiltered = useCase.getNewSection(products, 'abc');
      expect(productsFiltered, isNotEmpty,
          reason: 'Filtered products should not be empty');
    });

    test(
        'When call filterProductFromCategory with out products return empty list',
        () {
      const products = null;
      final productsFiltered =
          useCase.filterProductFromCategory(products, 'electronics');
      expect(productsFiltered, isEmpty,
          reason: 'Filtered products should be empty');
    });

    test(
        'When call filterProductFromCategory with two products return list filtered with one product',
        () {
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
      final productsFiltered =
          useCase.filterProductFromCategory(products, 'electronics');
      expect(productsFiltered.length, 1,
          reason: 'Filtered products should containt at least one element');
    });

    test(
        'When call filterProductFromCategory with two products and unknow category return same list',
        () {
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
      final productsFiltered =
          useCase.filterProductFromCategory(products, 'abc');
      expect(productsFiltered.length, 2,
          reason: 'Filtered products should containt two elements');
    });

    test('When call searchProduct with out products return empty list', () {
      const products = null;
      final productsFiltered = useCase.searchProduct(products, '');
      expect(productsFiltered, isEmpty,
          reason: 'Products filtered should be empty');
    });

    test(
        'When call searchProduct with products and null keyword return same products',
        () {
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
      final productsFiltered = useCase.searchProduct(products, null);
      expect(productsFiltered.length, 2,
          reason: 'Filtered products should containt two elements');
    });

    test(
        'When call filterProductFromCategory with two products and valid keywordreturn filtered list',
        () {
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
      final productsFiltered = useCase.searchProduct(products, 'An');
      expect(productsFiltered.length, 1,
          reason: 'Filtered products should containt one element');
    });
  });
}
