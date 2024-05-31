import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:flutter/material.dart';

class SplashContainerWidget extends StatelessWidget {
  const SplashContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
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
                      context, ScreensItemModel.loginScreen),
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
                      context, ScreensItemModel.signUpScreen),
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
      ),
    );
  }
}
