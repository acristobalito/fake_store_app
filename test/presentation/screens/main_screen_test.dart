import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_api_source_package/domain/model/product_model.dart';
import 'package:fake_api_source_package/domain/model/rating_model.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/provider/checkout_screen_provider.dart';
import 'package:fake_store_app/domain/provider/detail_screen_provider.dart';
import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/sign_up_screen_provider.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';

import '../../mocks/mock_cart_repository.dart';
import '../../mocks/mock_products_repository.dart';

void main() {
  group('Main Screen Widget Test', () {
    late MockProductsRepository mockProductsRepository;
    late MockCartRepository mockCartRepository;
    setUpAll(() {
      mockProductsRepository = MockProductsRepository();
      mockCartRepository = MockCartRepository();
    });
    testWidgets(
        'On Click Product Detail from Recommended Section Should Show Detail Screen',
        (tester) async {
      when(
        () => mockProductsRepository.getProducts(),
      ).thenAnswer((_) async => [
            ProductModel(
                id: 0,
                title: '',
                price: 0,
                description: '',
                category: 'men\'s clothing',
                image: '',
                rating: RatingModel(rate: 0, count: 0))
          ]);
      when(
        () => mockProductsRepository.getCategories(),
      ).thenAnswer((_) async => ['123', '124']);

      when(
        () => mockCartRepository.fetchOrderForm(),
      ).thenAnswer((_) async => [
            CartAppModel(
                id: 0, image: '', nameProduct: '', price: 0, quantity: 1)
          ]);
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => SignUpScreenProvider(
                    productsRepository: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
                    productsRepository: mockProductsRepository,
                    cartRepositoryImpl: mockCartRepository),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (context) =>
                    DetailScreenProvider(cartRepository: mockCartRepository),
              )
            ],
            child: Builder(builder: (context) {
              return MaterialApp(
                home: MainScreen(
                    mainScreenProvider: context.read<MainScreenProvider>()),
              );
            }),
          )));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      final scrollableFinder = find.descendant(
          of: find.byType(SingleChildScrollView),
          matching: find.byType(Scrollable).first);
      final cardItem = find.byType(CardItemMolecule).first;
      await tester.scrollUntilVisible(cardItem, 10,
          scrollable: scrollableFinder);
      await tester.tap(cardItem);
      await tester.pumpAndSettle();
      expect(find.byType(DetailScreen), findsOneWidget,
          reason: 'Should show Detail Screen');
    });

    testWidgets(
        'On Click Product Detail from new Section Should Show Detail Screen',
        (tester) async {
      when(
        () => mockProductsRepository.getProducts(),
      ).thenAnswer((_) async => [
            ProductModel(
                id: 0,
                title: '',
                price: 0,
                description: '',
                category: 'men\'s clothing',
                image: '',
                rating: RatingModel(rate: 0, count: 0)),
            ProductModel(
                id: 1,
                title: '',
                price: 0,
                description: '',
                category: 'jewelery',
                image: '',
                rating: RatingModel(rate: 0, count: 0))
          ]);
      when(
        () => mockProductsRepository.getCategories(),
      ).thenAnswer((_) async => ['todas', 'jewelery', 'men\'s clothing']);

      when(
        () => mockCartRepository.fetchOrderForm(),
      ).thenAnswer((_) async => [
            CartAppModel(
                id: 0, image: '', nameProduct: '', price: 0, quantity: 1)
          ]);
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => SignUpScreenProvider(
                    productsRepository: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
                    productsRepository: mockProductsRepository,
                    cartRepositoryImpl: mockCartRepository),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (context) =>
                    DetailScreenProvider(cartRepository: mockCartRepository),
              )
            ],
            child: Builder(builder: (context) {
              return MaterialApp(
                home: MainScreen(
                    mainScreenProvider: context.read<MainScreenProvider>()),
              );
            }),
          )));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      final scrollableFinder = find.descendant(
          of: find.byType(SingleChildScrollView),
          matching: find.byType(Scrollable).first);
      final cardItem = find.byType(CardItemMolecule).last;
      await tester.scrollUntilVisible(cardItem, 10,
          scrollable: scrollableFinder);
      await tester.tap(cardItem);
      await tester.pumpAndSettle();
      expect(find.byType(DetailScreen), findsOneWidget,
          reason: 'Should show Detail Screen');
    });

    testWidgets(
        'On Click catalog section should show list of products, then on tap search bar should show search delegate',
        (tester) async {
      when(
        () => mockProductsRepository.getProducts(),
      ).thenAnswer((_) async => [
            ProductModel(
                id: 0,
                title: '',
                price: 0,
                description: '',
                category: 'men\'s clothing',
                image: '',
                rating: RatingModel(rate: 0, count: 0)),
            ProductModel(
                id: 1,
                title: '',
                price: 0,
                description: '',
                category: 'jewelery',
                image: '',
                rating: RatingModel(rate: 0, count: 0))
          ]);
      when(
        () => mockProductsRepository.getCategories(),
      ).thenAnswer((_) async => ['todas', 'jewelery', 'men\'s clothing']);

      when(
        () => mockCartRepository.fetchOrderForm(),
      ).thenAnswer((_) async => [
            CartAppModel(
                id: 0, image: '', nameProduct: '', price: 0, quantity: 1)
          ]);
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => SignUpScreenProvider(
                    productsRepository: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
                    productsRepository: mockProductsRepository,
                    cartRepositoryImpl: mockCartRepository),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              )
            ],
            child: Builder(
              builder: (context) {
                return MaterialApp(
                    home: MainScreen(
                        mainScreenProvider:
                            context.read<MainScreenProvider>()));
              },
            ),
          )));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      final catalogBottomIcon = find.text('Catálogo');
      await tester.tap(catalogBottomIcon);
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CustomTextFieldAtom));
      await tester.pumpAndSettle();
      final searchDelegateBar = find.text('Busca un producto');
      expect(searchDelegateBar, findsOneWidget,
          reason: 'Should show Search delegate');
    });

    testWidgets(
        'On Click catalog section should show list of products, then on tap filter bar should update list of products',
        (tester) async {
      late MainScreenProvider provider;
      when(
        () => mockProductsRepository.getProducts(),
      ).thenAnswer((_) async => [
            ProductModel(
                id: 0,
                title: '',
                price: 0,
                description: '',
                category: 'jewelery',
                image: '',
                rating: RatingModel(rate: 0, count: 0)),
            ProductModel(
                id: 1,
                title: '',
                price: 0,
                description: '',
                category: 'men\'s clothing',
                image: '',
                rating: RatingModel(rate: 0, count: 0))
          ]);
      when(
        () => mockProductsRepository.getCategories(),
      ).thenAnswer((_) async => ['todas', 'jewelery', 'men\'s clothing']);

      when(
        () => mockCartRepository.fetchOrderForm(),
      ).thenAnswer((_) async => [
            CartAppModel(
                id: 0, image: '', nameProduct: '', price: 0, quantity: 1)
          ]);
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => SignUpScreenProvider(
                    productsRepository: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
                    productsRepository: mockProductsRepository,
                    cartRepositoryImpl: mockCartRepository),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              )
            ],
            child: Builder(
              builder: (context) {
                provider = context.read<MainScreenProvider>();
                return MaterialApp(
                    home: MainScreen(mainScreenProvider: provider));
              },
            ),
          )));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      final catalogBottomIcon = find.text('Catálogo');
      await tester.tap(catalogBottomIcon);
      await tester.pumpAndSettle();
      final customDropDown = find.byType(DropdownMenu<String>);
      await tester.tap(customDropDown);
      await tester.pumpAndSettle();
      final itemDropDown = find.text('jewelery');
      await tester.tap(itemDropDown);
      await tester.pumpAndSettle();
      expect(provider.categoriesProducts?.length, 1,
          reason: 'Should show one product');
    });

    testWidgets('On Click Cart Icon should Show Checkout Screen',
        (tester) async {
      when(
        () => mockProductsRepository.getProducts(),
      ).thenAnswer((_) async => [
            ProductModel(
                id: 0,
                title: '',
                price: 0,
                description: '',
                category: 'men\'s clothing',
                image: '',
                rating: RatingModel(rate: 0, count: 0))
          ]);
      when(
        () => mockProductsRepository.getCategories(),
      ).thenAnswer((_) async => ['123', '124']);

      when(
        () => mockCartRepository.fetchOrderForm(),
      ).thenAnswer((_) async => [
            CartAppModel(
                id: 0, image: '', nameProduct: '', price: 0, quantity: 1)
          ]);
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => SignUpScreenProvider(
                    productsRepository: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
                    productsRepository: mockProductsRepository,
                    cartRepositoryImpl: mockCartRepository),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (context) =>
                    CheckoutScreenProvider(cartRepository: mockCartRepository),
              )
            ],
            child: Builder(builder: (context) {
              return MaterialApp(
                home: MainScreen(
                    mainScreenProvider: context.read<MainScreenProvider>()),
              );
            }),
          )));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.tap(find.byType(IconCartMolecule));
      await tester.pumpAndSettle();
      expect(find.byType(CheckoutScreen), findsOneWidget,
          reason: 'Should show Checkout Screen');
    });

    testWidgets('On Click Profile Icon should Show Nav Drawer', (tester) async {
      when(
        () => mockProductsRepository.getProducts(),
      ).thenAnswer((_) async => [
            ProductModel(
                id: 0,
                title: '',
                price: 0,
                description: '',
                category: 'men\'s clothing',
                image: '',
                rating: RatingModel(rate: 0, count: 0))
          ]);
      when(
        () => mockProductsRepository.getCategories(),
      ).thenAnswer((_) async => ['123', '124']);

      when(
        () => mockCartRepository.fetchOrderForm(),
      ).thenAnswer((_) async => [
            CartAppModel(
                id: 0, image: '', nameProduct: '', price: 0, quantity: 1)
          ]);
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => SignUpScreenProvider(
                    productsRepository: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
                    productsRepository: mockProductsRepository,
                    cartRepositoryImpl: mockCartRepository),
              ),
              ChangeNotifierProvider(
                create: (context) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              )
            ],
            child: Builder(builder: (context) {
              return MaterialApp(
                home: MainScreen(
                    mainScreenProvider: context.read<MainScreenProvider>()),
              );
            }),
          )));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      final profileIcon = find.ancestor(
          of: find.byType(CircleAvatar),
          matching: find.byType(GestureDetector));
      await tester.tap(profileIcon);
      await tester.pumpAndSettle();
      expect(find.byType(Drawer), findsOneWidget, reason: 'Should show Drawer');
    });
  });
}
