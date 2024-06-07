import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/sign_up_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/backgrounds/main_background_widget.dart';
import 'package:fake_store_app/presentation/widgets/containers/sign_up_container_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpScreenProvider signUpScreenProvider;
  final MainScreenProvider mainScreenProvider;
  const SignUpScreen(
      {super.key,
      required this.signUpScreenProvider,
      required this.mainScreenProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackgroundWidget(),
          SignUpContainerWidget(
            signUpScreenProvider: signUpScreenProvider,
            mainScreenProvider: mainScreenProvider,
          )
        ],
      ),
    );
  }
}
