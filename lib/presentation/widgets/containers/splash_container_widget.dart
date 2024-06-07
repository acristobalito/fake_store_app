import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/login_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/sign_up_screen_provider.dart';
import 'package:flutter/material.dart';

class SplashContainerWidget extends StatelessWidget {
  final LoginScreenProvider loginProvider;
  final MainScreenProvider mainScreenProvider;
  final SignUpScreenProvider signUpScreenProvider;
  const SplashContainerWidget(
      {super.key,
      required this.loginProvider,
      required this.mainScreenProvider,
      required this.signUpScreenProvider});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: CustomTextAtom(
                lines: 2,
                text: 'Bienvenido...',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: TokenColors.scale01),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: CustomTextAtom(
                lines: 2,
                text: '¿Listo para para una experiencia interesate?',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAtom(
                isEnable: true,
                onClick: () => CustomRoute.navigate(
                    context, ScreensItemModel.loginScreen,
                    loginProvider: loginProvider,
                    mainScreenProvider: mainScreenProvider),
                text: 'Iniciar sesión',
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontFamily: FoundationTypo.font,
                    fontWeight: FontWeight.bold),
                btnStyle: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(TokenColors.scale00)),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: CustomTextAtom(
                lines: 2,
                text: 'ó',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAtom(
                isEnable: true,
                onClick: () => CustomRoute.navigate(
                    context, ScreensItemModel.signUpScreen,
                    mainScreenProvider: mainScreenProvider,
                    signUpScreenProvider: signUpScreenProvider),
                text: 'Registrate',
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontFamily: FoundationTypo.font,
                    fontWeight: FontWeight.bold),
                btnStyle: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(TokenColors.scale05)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
