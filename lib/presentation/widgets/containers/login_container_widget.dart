import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/controllers/toast_interface_controller.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/login_provider.dart';
import 'package:fake_store_app/presentation/widgets/generics/custom_toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginContainerWidget extends StatelessWidget {
  const LoginContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    final ToastInterfaceController toastController =
        CustomToastWidget(context: context);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () => CustomRoute.backNavigate(context),
                icon: const IconAtom(
                  icon: Icons.arrow_back_ios_rounded,
                  size: 30,
                  colorIcon: TokenColors.scale06,
                )),
            const CustomTextAtom(
              lines: 2,
              text: 'Inicia sesión',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: TokenColors.scale06),
            ),
            const SizedBox()
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: LoginFormWidgetTemplate(
              isLoading: provider.isLoading,
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontFamily: FoundationTypo.font,
                  fontWeight: FontWeight.w500),
              btnStyle: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(TokenColors.scale06)),
              onSubmit: (submit) => provider.logginUser(
                submit.userName,
                submit.pass,
                onSuccess: () => CustomRoute.navigateAndRemoveUntil(
                    context, ScreensItemModel.mainScreen),
                onFailure: (message) => toastController.showToast(message),
              ),
            ),
          )
        ],
      ),
    );
  }
}
