import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/domain/models/parameterization/landing_parameterization_model.dart';
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
import '../../mocks/mock_parametrization_repository.dart';
import '../../mocks/mock_products_repository.dart';

void main() {
  group('Splash widgets test', () {
    late MockProductsRepository mockProductsRepository;
    late MockCartRepository mockCartRepository;
    late MockParametrizationRepository mockParametrizationRepository;

    setUpAll(
      () {
        mockProductsRepository = MockProductsRepository();
        mockCartRepository = MockCartRepository();
        mockParametrizationRepository = MockParametrizationRepository();
      },
    );
    testWidgets('Splash Screen should show a two buttons', (tester) async {
      when(() => mockParametrizationRepository.loadParametrization())
          .thenAnswer(
              (_) async => LandingParameterizationModel(discountEnable: true));
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
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
              ),
              ChangeNotifierProvider(
                  create: (_) => SignUpScreenProvider(
                      productsRepository: mockProductsRepository))
            ],
            child: MaterialApp(home: Builder(builder: (context) {
              return SplashScreen(
                loginProvider: context.read<LoginScreenProvider>(),
                mainScreenProvider: context.read<MainScreenProvider>(),
                signUpScreenProvider: context.read<SignUpScreenProvider>(),
              );
            })),
          )));
      final logginButon = find.byType(CustomButtonAtom).first;
      expect(logginButon, findsOneWidget, reason: 'Loggin button should show');
      final signUpButton = find.byType(CustomButtonAtom).last;
      expect(signUpButton, findsOneWidget,
          reason: 'Sign Up button should show');
    });

    testWidgets('On tap login button should show Loggin Screen',
        (tester) async {
      when(() => mockParametrizationRepository.loadParametrization())
          .thenAnswer(
              (_) async => LandingParameterizationModel(discountEnable: true));
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
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
              ),
              ChangeNotifierProvider(
                  create: (_) => SignUpScreenProvider(
                      productsRepository: mockProductsRepository))
            ],
            child: MaterialApp(home: Builder(builder: (context) {
              return SplashScreen(
                loginProvider: context.read<LoginScreenProvider>(),
                mainScreenProvider: context.read<MainScreenProvider>(),
                signUpScreenProvider: context.read<SignUpScreenProvider>(),
              );
            })),
          )));
      final logginButon = find.byType(CustomButtonAtom).first;
      await tester.tap(logginButon);
      await tester.pumpAndSettle();
      expect(find.byType(LoginScreen), findsOneWidget,
          reason: 'Login Screen should show');
    });

    testWidgets('On tap register button should show Sign Up Screen',
        (tester) async {
      when(() => mockParametrizationRepository.loadParametrization())
          .thenAnswer(
              (_) async => LandingParameterizationModel(discountEnable: true));
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
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
              ),
              ChangeNotifierProvider(
                  create: (_) => SignUpScreenProvider(
                      productsRepository: mockProductsRepository))
            ],
            child: MaterialApp(home: Builder(builder: (context) {
              return SplashScreen(
                loginProvider: context.read<LoginScreenProvider>(),
                mainScreenProvider: context.read<MainScreenProvider>(),
                signUpScreenProvider: context.read<SignUpScreenProvider>(),
              );
            })),
          )));
      final signUpButton = find.byType(CustomButtonAtom).last;
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      expect(find.byType(SignUpScreen), findsOneWidget);
    });

    testWidgets(
        'On tap back button after show Login Screen should show Splash Screen',
        (tester) async {
      when(() => mockParametrizationRepository.loadParametrization())
          .thenAnswer(
              (_) async => LandingParameterizationModel(discountEnable: true));
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
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
              ),
              ChangeNotifierProvider(
                  create: (_) => SignUpScreenProvider(
                      productsRepository: mockProductsRepository))
            ],
            child: MaterialApp(home: Builder(builder: (context) {
              return SplashScreen(
                loginProvider: context.read<LoginScreenProvider>(),
                mainScreenProvider: context.read<MainScreenProvider>(),
                signUpScreenProvider: context.read<SignUpScreenProvider>(),
              );
            })),
          )));
      final logginButon = find.byType(CustomButtonAtom).first;
      await tester.tap(logginButon);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('LoginGoBackIconNavigation')));
      await tester.pumpAndSettle();
      expect(find.text('Bienvenido...'), findsOneWidget,
          reason: 'Text should show');
    });

    testWidgets(
        'On tap back button after show SignUp Screen should show Splash Screen',
        (tester) async {
      when(() => mockParametrizationRepository.loadParametrization())
          .thenAnswer(
              (_) async => LandingParameterizationModel(discountEnable: true));
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
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
              ),
              ChangeNotifierProvider(
                  create: (_) => SignUpScreenProvider(
                      productsRepository: mockProductsRepository))
            ],
            child: MaterialApp(home: Builder(builder: (context) {
              return SplashScreen(
                loginProvider: context.read<LoginScreenProvider>(),
                mainScreenProvider: context.read<MainScreenProvider>(),
                signUpScreenProvider: context.read<SignUpScreenProvider>(),
              );
            })),
          )));
      final signUpButton = find.byType(CustomButtonAtom).last;
      await tester.tap(signUpButton);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('SignUpGoBackIconNavigation')));
      await tester.pumpAndSettle();
      expect(find.text('Bienvenido...'), findsOneWidget,
          reason: 'Text should show');
    });
  });
}
