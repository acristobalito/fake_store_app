import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/provider/checkout_screen_provider.dart';
import 'package:fake_store_app/domain/provider/detail_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';

import '../../mocks/mock_cart_repository.dart';
import '../../mocks/mock_products_repository.dart';

void main() {
  group('Detail Screen Test Widgets', () {
    late MockProductsRepository mockProductsRepository;
    late MockCartRepository mockCartRepository;
    late CartAppModel cartAppModel;
    setUpAll(() {
      mockProductsRepository = MockProductsRepository();
      mockCartRepository = MockCartRepository();
      cartAppModel = CartAppModel(
          id: 1, image: '', nameProduct: '', price: 100, quantity: 0);
      registerFallbackValue(cartAppModel);
    });

    testWidgets(
      'On Click add products with empty order form should add product',
      (tester) async {
        bool isProductAdded = false;
        when(() => mockCartRepository.fetchOrderForm())
            .thenAnswer((_) async => null);
        when(() => mockCartRepository.appendOrderForm(any()))
            .thenAnswer((_) async => isProductAdded = true);
        final product = ProductWidgetModel(
            id: 2,
            title: 'Prueba 2',
            price: 100,
            description: 'Producto prueba',
            category: 'jewelery',
            image: '',
            rating: RatingWidgetModel(rate: 5, count: 10));
        await mockNetworkImages(() async =>
            await tester.pumpWidget(MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) =>
                      DetailScreenProvider(cartRepository: mockCartRepository),
                ),
                ChangeNotifierProvider(
                  create: (_) => MainScreenProvider(
                      productsRepository: mockProductsRepository,
                      cartRepositoryImpl: mockCartRepository),
                ),
              ],
              child: Builder(
                builder: (context) {
                  return MaterialApp(
                    home: DetailScreen(product: product),
                  );
                },
              ),
            )));
        await tester.pump(const Duration(seconds: 1));
        expect(find.text('Agregar producto'), findsOneWidget);
        await tester.tap(find.byType(CustomButtonAtom));
        await tester.pump();
        expect(isProductAdded, true, reason: 'On tap should add product');
      },
    );

    testWidgets(
      'On Click add products with product in order form should add product',
      (tester) async {
        bool isProductAdded = false;
        when(() => mockCartRepository.fetchOrderForm()).thenAnswer((_) async =>
            [
              CartAppModel(
                  id: 2,
                  image: '',
                  nameProduct: 'Prueba 2',
                  price: 100,
                  quantity: 1)
            ]);
        when(() => mockCartRepository.appendOrderForm(any()))
            .thenAnswer((_) async => isProductAdded = true);
        final product = ProductWidgetModel(
            id: 2,
            title: 'Prueba 2',
            price: 100,
            description: 'Producto prueba',
            category: 'jewelery',
            image: '',
            rating: RatingWidgetModel(rate: 5, count: 10));
        await mockNetworkImages(() async =>
            await tester.pumpWidget(MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) =>
                      DetailScreenProvider(cartRepository: mockCartRepository),
                ),
                ChangeNotifierProvider(
                  create: (_) => MainScreenProvider(
                      productsRepository: mockProductsRepository,
                      cartRepositoryImpl: mockCartRepository),
                ),
              ],
              child: Builder(
                builder: (context) {
                  return MaterialApp(
                    home: DetailScreen(product: product),
                  );
                },
              ),
            )));
        await tester.pump(const Duration(seconds: 1));
        expect(find.text('Agregar otro producto'), findsOneWidget);
        await tester.tap(find.byType(CustomButtonAtom));
        await tester.pump();
        expect(isProductAdded, true, reason: 'On tap should add product');
      },
    );

    testWidgets(
      'On Click add cart icon should show checkout Screen',
      (tester) async {
        when(() => mockCartRepository.fetchOrderForm()).thenAnswer((_) async =>
            [
              CartAppModel(
                  id: 2,
                  image: '',
                  nameProduct: 'Prueba 2',
                  price: 100,
                  quantity: 1)
            ]);
        final product = ProductWidgetModel(
            id: 2,
            title: 'Prueba 2',
            price: 100,
            description: 'Producto prueba',
            category: 'jewelery',
            image: '',
            rating: RatingWidgetModel(rate: 5, count: 10));
        await mockNetworkImages(() async =>
            await tester.pumpWidget(MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) =>
                      DetailScreenProvider(cartRepository: mockCartRepository),
                ),
                ChangeNotifierProvider(
                  create: (_) => MainScreenProvider(
                      productsRepository: mockProductsRepository,
                      cartRepositoryImpl: mockCartRepository),
                ),
                ChangeNotifierProvider(
                  create: (_) => CheckoutScreenProvider(
                      cartRepository: mockCartRepository),
                ),
              ],
              child: Builder(
                builder: (context) {
                  return MaterialApp(
                    home: DetailScreen(product: product),
                  );
                },
              ),
            )));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        await tester.tap(find.byType(IconCartMolecule));
        await tester.pumpAndSettle();
        expect(find.byType(CheckoutScreen), findsOneWidget,
            reason: 'Should show Checkout Screen');
      },
    );
  });
}
