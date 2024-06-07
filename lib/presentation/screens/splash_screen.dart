import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/sign_up_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/backgrounds/main_background_widget.dart';
import 'package:fake_store_app/presentation/widgets/containers/splash_container_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final LoginScreenProvider loginProvider;
  final MainScreenProvider mainScreenProvider;
  final SignUpScreenProvider signUpScreenProvider;
  const SplashScreen(
      {super.key,
      required this.loginProvider,
      required this.mainScreenProvider,
      required this.signUpScreenProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const MainBackgroundWidget(),
        SplashContainerWidget(
          loginProvider: loginProvider,
          mainScreenProvider: mainScreenProvider,
          signUpScreenProvider: signUpScreenProvider,
        )
      ]),
    );
  }
}
