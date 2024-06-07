import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/backgrounds/main_background_widget.dart';
import 'package:fake_store_app/presentation/widgets/containers/login_container_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenProvider loginProvider;
  final MainScreenProvider mainScreenProvider;
  const LoginScreen(
      {super.key,
      required this.loginProvider,
      required this.mainScreenProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackgroundWidget(),
          LoginContainerWidget(
              loginProvider: loginProvider,
              mainScreenProvider: mainScreenProvider)
        ],
      ),
    );
  }
}
