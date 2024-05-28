import 'package:ecommerce_widgets_package/foundations/themes/ecommerce_theme.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainScreenProvider(),
      child: MaterialApp(
        title: 'Fake Store App',
        debugShowCheckedModeBanner: false,
        theme: ecommerceTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
