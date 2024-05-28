import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/controllers/toast_interface_controller.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/models/user/user_params_model.dart';
import 'package:fake_store_app/domain/provider/sign_up_provider.dart';
import 'package:fake_store_app/presentation/widgets/generics/custom_toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpContainerWidget extends StatelessWidget {
  const SignUpContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SignUpProvider>();
    final ToastInterfaceController toastController =
        CustomToastWidget(context: context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
                text: 'Regístrate',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: TokenColors.scale06),
              ),
              const SizedBox(
                width: 40,
              )
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SignUpFormWidgetTemplate(
                isLoading: provider.isLoading,
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontFamily: FoundationTypo.font,
                    fontWeight: FontWeight.w500),
                btnStyle: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(TokenColors.scale06)),
                onSubmit: (submit) => provider.registerUser(
                    UserParamsModel(
                        email: submit.email,
                        username: submit.userName,
                        password: submit.password,
                        firstname: submit.firstName,
                        lastname: submit.lastName,
                        phone: submit.phone),
                    onSuccess: () => CustomRoute.navigateAndRemoveUntil(
                        context, ScreensItemModel.mainScreen),
                    onFailure: (message) => toastController.showToast(message)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
