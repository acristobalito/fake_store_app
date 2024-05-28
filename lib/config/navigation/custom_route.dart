import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';

import 'package:flutter/material.dart';

class CustomRoute {
  static void navigate(BuildContext context, ScreensItemModel screen,
          {List<ProductModel>? products, ProductWidgetModel? product}) =>
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                _getScreen(screen, products: products, product: product),
          ));

  static void navigateAndRemoveUntil(
      BuildContext context, ScreensItemModel screen) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => _getScreen(screen)),
        (_) => false);
  }

  static void backNavigate(BuildContext context) => Navigator.pop(context);

  static Widget _getScreen(ScreensItemModel screen,
          {List<ProductModel>? products, ProductWidgetModel? product}) =>
      switch (screen) {
        ScreensItemModel.splashScreen => const SplashScreen(),
        ScreensItemModel.mainScreen => const MainScreen(),
        ScreensItemModel.loginScreen => const LoginScreen(),
        ScreensItemModel.signUpScreen => const SignUpScreen(),
        ScreensItemModel.supportScreen => const SupportScreen(),
        ScreensItemModel.searchScreen => SearchScreen(products: products!),
        ScreensItemModel.detailScreen => DetailScreen(product: product!),
        ScreensItemModel.checkoutScreen => const CheckoutScreen()
      };
}
