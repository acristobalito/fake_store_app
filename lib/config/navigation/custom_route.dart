import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/sign_up_screen_provider.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';

import 'package:flutter/material.dart';

class CustomRoute {
  static void navigate(BuildContext context, ScreensItemModel screen,
          {List<ProductModel>? products,
          ProductWidgetModel? product,
          LoginScreenProvider? loginProvider,
          MainScreenProvider? mainScreenProvider,
          SignUpScreenProvider? signUpScreenProvider}) =>
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _getScreen(screen,
                products: products,
                product: product,
                loginScreenProvider: loginProvider,
                mainScreenProvider: mainScreenProvider,
                signUpScreenProvider: signUpScreenProvider),
          ));

  static void navigateAndRemoveUntil(
      BuildContext context, ScreensItemModel screen,
      {MainScreenProvider? mainScreenProvider,
      LoginScreenProvider? loginScreenProvider,
      SignUpScreenProvider? signUpScreenProvider}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => _getScreen(screen,
                mainScreenProvider: mainScreenProvider,
                loginScreenProvider: loginScreenProvider,
                signUpScreenProvider: signUpScreenProvider)),
        (_) => false);
  }

  static void backNavigate(BuildContext context) => Navigator.pop(context);

  static Widget _getScreen(ScreensItemModel screen,
          {List<ProductModel>? products,
          ProductWidgetModel? product,
          LoginScreenProvider? loginScreenProvider,
          MainScreenProvider? mainScreenProvider,
          SignUpScreenProvider? signUpScreenProvider}) =>
      switch (screen) {
        ScreensItemModel.splashScreen => SplashScreen(
            loginProvider: loginScreenProvider!,
            mainScreenProvider: mainScreenProvider!,
            signUpScreenProvider: signUpScreenProvider!,
          ),
        ScreensItemModel.mainScreen =>
          MainScreen(mainScreenProvider: mainScreenProvider!),
        ScreensItemModel.loginScreen => LoginScreen(
            loginProvider: loginScreenProvider!,
            mainScreenProvider: mainScreenProvider!,
          ),
        ScreensItemModel.signUpScreen => SignUpScreen(
            signUpScreenProvider: signUpScreenProvider!,
            mainScreenProvider: mainScreenProvider!,
          ),
        ScreensItemModel.supportScreen => const SupportScreen(),
        ScreensItemModel.detailScreen => DetailScreen(product: product!),
        ScreensItemModel.checkoutScreen => const CheckoutScreen()
      };
}
