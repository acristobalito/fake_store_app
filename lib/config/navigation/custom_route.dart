import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/presentation/screens/login_screen.dart';
import 'package:fake_store_app/presentation/screens/screens.dart';
import 'package:fake_store_app/presentation/screens/sign_up_screen.dart';

import 'package:flutter/material.dart';

class CustomRoute {
  void navigate(BuildContext context, ScreensItemModel screen) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        switch (screen) {
          case ScreensItemModel.splashScreen:
            return const SplashScreen();
          case ScreensItemModel.homeScreen:
            return const HomeScreen();
          case ScreensItemModel.loginScreen:
            return const LoginScreen();
          case ScreensItemModel.signUpScreen:
            return const SignUpScreen();
          default:
            return const HomeScreen();
          /* case ScreensItemModel.catalogScreen:
            return const MoleculeScreen();
          case ScreensItemModel.checkoutScreen:
            return const OrganismScreen();
          case ScreensItemModel.detailScreen:
            return const TemplateScreen();
          case ScreensItemModel.loginScreen:
            return const PageScreen();
          case ScreensItemModel.searchScreen:
            return const PageScreen();
          case ScreensItemModel.signUpScreen:
            return const PageScreen();
          case ScreensItemModel.supportScreen:
            return const PageScreen(); */
        }
      },
    ));
  }

  void backNavigate(BuildContext context) {
    Navigator.pop(context);
  }
}
