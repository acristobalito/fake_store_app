import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/provider/checkout_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';
import 'package:fake_store_app/presentation/widgets/backgrounds/empty_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';

import '../../mocks/mock_cart_repository.dart';
import '../../mocks/mock_products_repository.dart';

void main() {
  group(
    'Checkout screen widget test',
    () {
      late MockCartRepository mockCartRepository;
      late MockProductsRepository mockProductsRepository;
      setUpAll(() {
        mockCartRepository = MockCartRepository();
        mockProductsRepository = MockProductsRepository();
      });

      testWidgets('Test on empty order form should show empty screen',
          (tester) async {
        when(() => mockCartRepository.fetchOrderForm())
            .thenAnswer((_) async => null);
        await mockNetworkImages(
          () async => await tester.pumpWidget(MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (_) =>
                  CheckoutScreenProvider(cartRepository: mockCartRepository),
            ),
            ChangeNotifierProvider(
              create: (_) => MainScreenProvider(
                  productsRepository: mockProductsRepository,
                  cartRepositoryImpl: mockCartRepository),
            ),
          ], child: const MaterialApp(home: CheckoutScreen()))),
        );
        expect(find.byType(EmptyBackgroundWidget), findsOneWidget);
      });

      testWidgets('Test add button', (tester) async {
        when(() => mockCartRepository.fetchOrderForm()).thenAnswer((_) async =>
            [
              CartAppModel(
                  id: 1, image: '', nameProduct: '', price: 0, quantity: 1)
            ]);
        await mockNetworkImages(
          () async => await tester.pumpWidget(MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (_) =>
                  CheckoutScreenProvider(cartRepository: mockCartRepository),
            ),
            ChangeNotifierProvider(
              create: (_) => MainScreenProvider(
                  productsRepository: mockProductsRepository,
                  cartRepositoryImpl: mockCartRepository),
            ),
          ], child: const MaterialApp(home: CheckoutScreen()))),
        );
        await tester.pump();
        await tester
            .tap(find.byKey(const Key('AddProductCartQuantityButton')).first);
        await tester.pump();
        final textQuantity = find.descendant(
            of: find.byKey(const Key('QuantityProductCartText')).first,
            matching: find.byType(Text));
        final text = textQuantity.evaluate().single.widget as Text;
        expect(text.data, '2');
      });

      testWidgets('Test substract button', (tester) async {
        when(() => mockCartRepository.fetchOrderForm()).thenAnswer((_) async =>
            [
              CartAppModel(
                  id: 1, image: '', nameProduct: '', price: 0, quantity: 2)
            ]);
        await mockNetworkImages(
          () async => await tester.pumpWidget(MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (_) =>
                  CheckoutScreenProvider(cartRepository: mockCartRepository),
            ),
            ChangeNotifierProvider(
              create: (_) => MainScreenProvider(
                  productsRepository: mockProductsRepository,
                  cartRepositoryImpl: mockCartRepository),
            ),
          ], child: const MaterialApp(home: CheckoutScreen()))),
        );
        await tester.pump();
        await tester.tap(
            find.byKey(const Key('SubstractProductCartQuantityButton')).first);
        await tester.pump();
        final textQuantity = find.descendant(
            of: find.byKey(const Key('QuantityProductCartText')).first,
            matching: find.byType(Text));
        final text = textQuantity.evaluate().single.widget as Text;
        expect(text.data, '1');
      });

      testWidgets('Test remove button', (tester) async {
        when(() => mockCartRepository.fetchOrderForm()).thenAnswer((_) async =>
            [
              CartAppModel(
                  id: 1, image: '', nameProduct: '', price: 0, quantity: 2)
            ]);
        await mockNetworkImages(
          () async => await tester.pumpWidget(MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (_) =>
                  CheckoutScreenProvider(cartRepository: mockCartRepository),
            ),
            ChangeNotifierProvider(
              create: (_) => MainScreenProvider(
                  productsRepository: mockProductsRepository,
                  cartRepositoryImpl: mockCartRepository),
            ),
          ], child: const MaterialApp(home: CheckoutScreen()))),
        );
        await tester.pump();
        await tester
            .tap(find.byKey(const Key('RemoveProductCartButton')).first);
        await tester.pump();
        expect(find.byType(EmptyBackgroundWidget), findsOneWidget);
      });
    },
  );
}
