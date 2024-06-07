import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/controllers/toast_interface_controller.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/generics/custom_toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginContainerWidget extends StatelessWidget {
  final LoginScreenProvider loginProvider;
  final MainScreenProvider mainScreenProvider;
  const LoginContainerWidget(
      {super.key,
      required this.loginProvider,
      required this.mainScreenProvider});

  @override
  Widget build(BuildContext context) {
    final ToastInterfaceController toastController =
        CustomToastWidget(context: context);
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                key: const Key('LoginGoBackIconNavigation'),
                onPressed: () => CustomRoute.backNavigate(context),
                icon: const IconAtom(
                  icon: Icons.arrow_back_ios_rounded,
                  size: 30,
                  colorIcon: TokenColors.scale00,
                )),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextAtom(
                    lines: 2,
                    text:
                        'Para acceder debes ingresar tu usuario y contraseña.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer<LoginScreenProvider>(
                  builder: (context, _, child) => LoginFormWidgetTemplate(
                    colorIcon: Colors.white,
                    textStyleForm: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    isLoading: loginProvider.isLoading,
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: FoundationTypo.font,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    btnStyle: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(TokenColors.scale00)),
                    onSubmit: (submit) => loginProvider.logginUser(
                      submit.userName,
                      submit.pass,
                      onSuccess: () => CustomRoute.navigateAndRemoveUntil(
                          context, ScreensItemModel.mainScreen,
                          mainScreenProvider: mainScreenProvider),
                      onFailure: (message) =>
                          toastController.showToast(message),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
