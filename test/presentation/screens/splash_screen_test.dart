import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/sign_up_screen_provider.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';

import '../../mocks/mock_cart_repository.dart';
import '../../mocks/mock_products_repository.dart';

void main() {
  group('Splash widgets test', () {
    late MockProductsRepository mockProductsRepository;
    late MockCartRepository mockCartRepository;

    setUpAll(
      () {
        mockProductsRepository = MockProductsRepository();
        mockCartRepository = MockCartRepository();
      },
    );
    testWidgets('Splash Screen should show a two buttons', (tester) async {
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
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
      expect(logginButon, findsOneWidget);
      final signUpButton = find.byType(CustomButtonAtom).last;
      expect(signUpButton, findsOneWidget);
    });

    testWidgets('On tap login button should show Loggin Screen',
        (tester) async {
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
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
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('On tap register button should show Sign Up Screen',
        (tester) async {
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
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
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
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
      expect(find.text('Bienvenido...'), findsOneWidget);
    });

    testWidgets(
        'On tap back button after show SignUp Screen should show Splash Screen',
        (tester) async {
      await mockNetworkImages(() async => await tester.pumpWidget(MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => LoginScreenProvider(
                    productsRepositoryImpl: mockProductsRepository),
              ),
              ChangeNotifierProvider(
                create: (_) => MainScreenProvider(
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
      expect(find.text('Bienvenido...'), findsOneWidget);
    });
  });
}