import 'package:fake_store_app/domain/controllers/toast_interface_controller.dart';
import 'package:flutter/material.dart';

class CustomToastWidget implements ToastInterfaceController {
  final BuildContext context;
  late ScaffoldMessengerState scaffold;

  CustomToastWidget({required this.context}) {
    scaffold = ScaffoldMessenger.of(context);
  }

  @override
  void closeToast() {
    scaffold.hideCurrentSnackBar();
  }

  @override
  void showToast(String message) {
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(label: 'Ok', onPressed: closeToast),
    ));
  }
}
