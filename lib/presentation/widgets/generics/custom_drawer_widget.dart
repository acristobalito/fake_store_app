import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const DrawerHeader(
                padding: EdgeInsets.zero,
                child: ImageAtom(
                    image:
                        'https://static.wixstatic.com/media/145da3_0e5eaa7697394d668118dd8bf29cca33~mv2.png/v1/fit/w_2500,h_1330,al_c/145da3_0e5eaa7697394d668118dd8bf29cca33~mv2.png')),
            ListTile(
              leading: const Icon(Icons.contact_support_rounded),
              title: const CustomTextAtom(
                text: 'Soporte y contacto',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () =>
                  CustomRoute.navigate(context, ScreensItemModel.supportScreen),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                    leading: const Icon(Icons.exit_to_app_rounded),
                    title: const CustomTextAtom(
                      text: 'Cerrar sesión',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () => CustomRoute.navigateAndRemoveUntil(
                        context, ScreensItemModel.splashScreen)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
