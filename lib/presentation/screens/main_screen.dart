import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/containers/main_container_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final MainScreenProvider mainScreenProvider;
  const MainScreen({super.key, required this.mainScreenProvider});

  @override
  Widget build(BuildContext context) {
    return MainContainerWidget(mainScreenProvider: mainScreenProvider);
  }
}
