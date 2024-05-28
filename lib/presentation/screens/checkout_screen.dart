import 'package:fake_store_app/domain/provider/checkout_provider.dart';
import 'package:fake_store_app/presentation/widgets/containers/checkout_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CheckoutProvider(),
        child: const CheckoutContainerWidget());
  }
}
