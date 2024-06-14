import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/models/parameterization/landing_parameterization_model.dart';
import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';

import '../../mocks/mock_cart_repository.dart';
import '../../mocks/mock_parametrization_repository.dart';
import '../../mocks/mock_products_repository.dart';

void main() {
  group('Login Screen widget test', () {
    late MockProductsRepository mockProductsRepository;
    late MockCartRepository mockCartRepository;
    late MockParametrizationRepository mockParametrizationRepository;
    late LoginParamsModel loginParamsModel;

    setUpAll(() {
      mockProductsRepository = MockProductsRepository();
      mockCartRepository = MockCartRepository();
      mockParametrizationRepository = MockParametrizationRepository();
      loginParamsModel = LoginParamsModel(username: '123', password: '123');
      registerFallbackValue(loginParamsModel);
    });
    testWidgets(
      'On Submit Loggin should navigate to main screen',
      (tester) async {
        when(
          () => mockProductsRepository.loginUser(any()),
        ).thenAnswer((_) async => 'token_mockeado');

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
        when(() => mockParametrizationRepository.loadParametrization())
            .thenAnswer((_) async =>
                LandingParameterizationModel(discountEnable: true));
        await mockNetworkImages(() async =>
            await tester.pumpWidget(MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => LoginScreenProvider(
                      productsRepositoryImpl: mockProductsRepository),
                ),
                ChangeNotifierProvider(
                  create: (_) => MainScreenProvider(
                      parameterizationRepository: mockParametrizationRepository,
                      productsRepository: mockProductsRepository,
                      cartRepositoryImpl: mockCartRepository),
                )
              ],
              child: Builder(builder: (context) {
                return MaterialApp(
                  home: LoginScreen(
                    loginProvider: context.read<LoginScreenProvider>(),
                    mainScreenProvider: context.read<MainScreenProvider>(),
                  ),
                );
              }),
            )));
        final userField = find.byType(TextFormField).at(0);
        final passwordFiel = find.byType(TextFormField).at(1);
        await tester.enterText(userField, '123');
        await tester.enterText(passwordFiel, 'abc');
        await tester.runAsync(() => tester.tap(find.byType(CustomButtonAtom)));
        await tester.pumpAndSettle(const Duration(seconds: 3));
        expect(find.byType(MainScreen), findsOneWidget,
            reason: 'Find main screen after navigate');
      },
    );

    testWidgets(
      'On Submit Loggin and fail service should show toast',
      (tester) async {
        when(
          () => mockProductsRepository.loginUser(any()),
        ).thenAnswer((_) async => null);
        when(() => mockParametrizationRepository.loadParametrization())
            .thenAnswer((_) async =>
                LandingParameterizationModel(discountEnable: true));
        await mockNetworkImages(() async =>
            await tester.pumpWidget(MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => LoginScreenProvider(
                      productsRepositoryImpl: mockProductsRepository),
                ),
                ChangeNotifierProvider(
                  create: (_) => MainScreenProvider(
                      parameterizationRepository: mockParametrizationRepository,
                      productsRepository: mockProductsRepository,
                      cartRepositoryImpl: mockCartRepository),
                )
              ],
              child: Builder(builder: (context) {
                return MaterialApp(
                  home: LoginScreen(
                    loginProvider: context.read<LoginScreenProvider>(),
                    mainScreenProvider: context.read<MainScreenProvider>(),
                  ),
                );
              }),
            )));
        final userField = find.byType(TextFormField).at(0);
        final passwordFiel = find.byType(TextFormField).at(1);
        await tester.enterText(userField, '123');
        await tester.enterText(passwordFiel, 'abc');
        await tester.runAsync(() => tester.tap(find.byType(CustomButtonAtom)));
        await tester.pumpAndSettle(const Duration(seconds: 3));
        expect(find.byType(SnackBar), findsOneWidget, reason: 'Find snackbar');
        await tester.tap(find.byType(SnackBarAction));
        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsNothing,
            reason: 'Verify snackbar hide');
      },
    );
  });
}
