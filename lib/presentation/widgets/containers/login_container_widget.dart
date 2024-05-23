import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:flutter/material.dart';

class LoginContainerWidget extends StatelessWidget {
  const LoginContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () {
                    CustomRoute().backNavigate(context);
                  },
                  icon: const IconAtom(
                    icon: Icons.arrow_back_ios_rounded,
                    size: 30,
                    colorIcon: TokenColors.scale06,
                  ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomTextAtom(
                lines: 2,
                text: 'Inicia sesión',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: TokenColors.scale06),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: LoginFormWidgetTemplate(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: FoundationTypo.font,
                      fontWeight: FontWeight.w500),
                  btnStyle: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(TokenColors.scale06)),
                  onSubmit: () {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
