import 'package:fake_store_app/domain/provider/login_provider.dart';
import 'package:fake_store_app/presentation/widgets/backgrounds/main_background_widget.dart';
import 'package:fake_store_app/presentation/widgets/containers/login_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackgroundWidget(),
          ChangeNotifierProvider(
              create: (_) => LoginProvider(),
              child: const LoginContainerWidget())
        ],
      ),
    );
  }
}
