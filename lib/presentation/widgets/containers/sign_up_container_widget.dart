import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/controllers/toast_interface_controller.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/models/user/user_params_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/sign_up_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/generics/custom_toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpContainerWidget extends StatelessWidget {
  final SignUpScreenProvider signUpScreenProvider;
  final MainScreenProvider mainScreenProvider;
  const SignUpContainerWidget(
      {super.key,
      required this.signUpScreenProvider,
      required this.mainScreenProvider});

  @override
  Widget build(BuildContext context) {
    final ToastInterfaceController toastController =
        CustomToastWidget(context: context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  key: const Key('SignUpGoBackIconNavigation'),
                  onPressed: () => CustomRoute.backNavigate(context),
                  icon: const IconAtom(
                    icon: Icons.arrow_back_ios_rounded,
                    size: 30,
                    colorIcon: TokenColors.scale00,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextAtom(
                      lines: 2,
                      text: 'Registrate para descubrir nuestros productos.',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<SignUpScreenProvider>(
                    builder: (context, _, child) => SignUpFormWidgetTemplate(
                      colorIcon: Colors.white,
                      isLoading: signUpScreenProvider.isLoading,
                      textStyleForm: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontFamily: FoundationTypo.font,
                          fontWeight: FontWeight.bold),
                      btnStyle: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(TokenColors.scale00)),
                      onSubmit: (submit) => signUpScreenProvider.registerUser(
                          UserParamsModel(
                              email: submit.email,
                              username: submit.userName,
                              password: submit.password,
                              firstname: submit.firstName,
                              lastname: submit.lastName,
                              phone: submit.phone),
                          onSuccess: () => CustomRoute.navigateAndRemoveUntil(
                              context, ScreensItemModel.mainScreen,
                              mainScreenProvider: mainScreenProvider),
                          onFailure: (message) =>
                              toastController.showToast(message)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
