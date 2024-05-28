import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:flutter/material.dart';

class SplashContainerWidget extends StatelessWidget {
  const SplashContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomTextAtom(
            lines: 2,
            text: 'Bienvenido a Fake Store',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: TokenColors.scale06),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
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
                            WidgetStatePropertyAll(TokenColors.scale03)),
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
                        context, ScreensItemModel.signUpScreen),
                    text: 'Registrate',
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: FoundationTypo.font,
                        fontWeight: FontWeight.bold),
                    btnStyle: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(TokenColors.scale06)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
