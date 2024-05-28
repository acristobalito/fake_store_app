import 'package:fake_store_app/domain/provider/sign_up_provider.dart';
import 'package:fake_store_app/presentation/widgets/backgrounds/main_background_widget.dart';
import 'package:fake_store_app/presentation/widgets/containers/sign_up_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackgroundWidget(),
          ChangeNotifierProvider(
              create: (_) => SignUpProvider(),
              child: const SignUpContainerWidget())
        ],
      ),
    );
  }
}
