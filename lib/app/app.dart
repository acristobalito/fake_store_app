import 'package:ecommerce_widgets_package/foundations/themes/ecommerce_theme.dart';
import 'package:fake_store_app/domain/provider/checkout_screen_provider.dart';
import 'package:fake_store_app/domain/provider/detail_screen_provider.dart';
import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/sign_up_screen_provider.dart';
import 'package:fake_store_app/infraestructure/repositories/impl/cart_repository_impl.dart';
import 'package:fake_store_app/infraestructure/repositories/impl/parameterization_repository_impl.dart';
import 'package:fake_store_app/infraestructure/repositories/impl/products_repository_impl.dart';
import 'package:fake_store_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginScreenProvider(
              productsRepositoryImpl: ProductsRepositoryImpl()),
        ),
        ChangeNotifierProvider(
          create: (_) => MainScreenProvider(
              parameterizationRepository: ParameterizationRepositoryImpl(),
              productsRepository: ProductsRepositoryImpl(),
              cartRepositoryImpl: CartRepositoryImpl()),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpScreenProvider(
              productsRepository: ProductsRepositoryImpl()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              DetailScreenProvider(cartRepository: CartRepositoryImpl()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CheckoutScreenProvider(cartRepository: CartRepositoryImpl()),
        )
      ],
      child: MaterialApp(
        title: 'Fake Store App',
        debugShowCheckedModeBanner: false,
        theme: ecommerceTheme,
        home: Builder(builder: (context) {
          return SplashScreen(
            signUpScreenProvider: context.read<SignUpScreenProvider>(),
            loginProvider: context.read<LoginScreenProvider>(),
            mainScreenProvider: context.read<MainScreenProvider>(),
          );
        }),
      ),
    );
  }
}
