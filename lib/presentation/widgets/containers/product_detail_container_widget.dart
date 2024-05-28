import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/cart/cart_app_model.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/detail_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailContainerWidget extends StatelessWidget {
  final ProductWidgetModel product;
  const ProductDetailContainerWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DetailProvider>();
    final mainProvider = context.watch<MainScreenProvider>();
    provider.setProduct(product);
    return Scaffold(
      appBar: AppBar(
          title: const CustomTextAtom(
            text: 'Información del producto',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
          actions: [
            IconCartMolecule(
                onClick: () => CustomRoute.navigate(
                      context,
                      ScreensItemModel.checkoutScreen,
                    ),
                cartCount: mainProvider.cartQuantity.toString())
          ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            DetailProductWidgetTemplate(product: product),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAtom(
                onClick: () async {
                  await provider.addOrderForm(CartAppModel(
                      id: product.id,
                      image: product.image,
                      nameProduct: product.title,
                      price: product.price,
                      quantity: 1));
                  await mainProvider.updateCartQuantity();
                },
                text: provider.isAdded
                    ? 'Agregar otro producto'
                    : 'Agregar producto',
                isEnable: true,
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      )),
    );
  }
}
