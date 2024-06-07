import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
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
  group('Sign up Screen Widget Test', () {
    late MockProductsRepository mockProductsRepository;
    late MockCartRepository mockCartRepository;
    late UserModel userModel;

    setUpAll(
      () {
        mockProductsRepository = MockProductsRepository();
        mockCartRepository = MockCartRepository();
        userModel = UserModel(
            email: '',
            username: '',
            password: '',
            name: NameModel(firstname: '', lastname: ''),
            address: AddressModel(
                city: '',
                street: '',
                number: 0,
                zipcode: '',
                geolocation: GeolocationModel(lat: '', long: '')),
            phone: '');
        registerFallbackValue(userModel);
      },
    );
    testWidgets(
      'On Submit register form and service response success should show Main Screen',
      (tester) async {
        when(
          () => mockProductsRepository.registerUser(any()),
        ).thenAnswer((_) async => 1);
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
        await mockNetworkImages(() async =>
            await tester.pumpWidget(MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => SignUpScreenProvider(
                      productsRepository: mockProductsRepository),
                ),
                ChangeNotifierProvider(
                  create: (_) => MainScreenProvider(
                      productsRepository: mockProductsRepository,
                      cartRepositoryImpl: mockCartRepository),
                )
              ],
              child: Builder(builder: (context) {
                return MaterialApp(
                  home: SignUpScreen(
                      signUpScreenProvider:
                          context.read<SignUpScreenProvider>(),
                      mainScreenProvider: context.read<MainScreenProvider>()),
                );
              }),
            )));
        final firstNameField = find.byType(TextFormField).at(0);
        final lastNameField = find.byType(TextFormField).at(1);
        final emailField = find.byType(TextFormField).at(2);
        final phoneField = find.byType(TextFormField).at(3);
        final userNameField = find.byType(TextFormField).at(4);
        final passwordField = find.byType(TextFormField).at(5);
        final button = find.byType(FilledButton);
        final scrollableFinder = find.descendant(
            of: find.byType(SingleChildScrollView),
            matching: find.byType(Scrollable).first);
        await tester.enterText(firstNameField, '123');
        await tester.enterText(lastNameField, 'abc');
        await tester.enterText(emailField, 'abc@gmail.com');
        await tester.enterText(phoneField, '123');
        await tester.enterText(userNameField, 'abc');
        await tester.enterText(passwordField, 'abc');
        await tester.scrollUntilVisible(button, 10,
            scrollable: scrollableFinder);
        await tester.pumpAndSettle();
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(find.byType(MainScreen), findsOneWidget,
            reason: 'Encuentra main screen despues de navegar');
      },
    );

    testWidgets(
      'On Submit register form and service response fail should show toast',
      (tester) async {
        when(
          () => mockProductsRepository.registerUser(any()),
        ).thenAnswer((_) async => null);
        await mockNetworkImages(() async =>
            await tester.pumpWidget(MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => SignUpScreenProvider(
                      productsRepository: mockProductsRepository),
                ),
                ChangeNotifierProvider(
                  create: (_) => MainScreenProvider(
                      productsRepository: mockProductsRepository,
                      cartRepositoryImpl: mockCartRepository),
                )
              ],
              child: Builder(builder: (context) {
                return MaterialApp(
                  home: SignUpScreen(
                      signUpScreenProvider:
                          context.read<SignUpScreenProvider>(),
                      mainScreenProvider: context.read<MainScreenProvider>()),
                );
              }),
            )));
        final firstNameField = find.byType(TextFormField).at(0);
        final lastNameField = find.byType(TextFormField).at(1);
        final emailField = find.byType(TextFormField).at(2);
        final phoneField = find.byType(TextFormField).at(3);
        final userNameField = find.byType(TextFormField).at(4);
        final passwordField = find.byType(TextFormField).at(5);
        final button = find.byType(FilledButton);
        final scrollableFinder = find.descendant(
            of: find.byType(SingleChildScrollView),
            matching: find.byType(Scrollable).first);
        await tester.enterText(firstNameField, '123');
        await tester.enterText(lastNameField, 'abc');
        await tester.enterText(emailField, 'abc@gmail.com');
        await tester.enterText(phoneField, '123');
        await tester.enterText(userNameField, 'abc');
        await tester.enterText(passwordField, 'abc');
        await tester.scrollUntilVisible(button, 10,
            scrollable: scrollableFinder);
        await tester.pumpAndSettle();
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget,
            reason: 'Encuentra el snackbar');
        await tester.tap(find.byType(SnackBarAction));
        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsNothing,
            reason: 'Verifica que el snackbar desaparece');
      },
    );
  });
}
