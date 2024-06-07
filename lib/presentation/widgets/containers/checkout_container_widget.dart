import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/domain/controllers/toast_interface_controller.dart';
import 'package:fake_store_app/domain/models/mappers/product_app_widget_model_mapper.dart';
import 'package:fake_store_app/domain/provider/checkout_screen_provider.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/backgrounds/empty_background_widget.dart';
import 'package:fake_store_app/presentation/widgets/generics/custom_toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutContainerWidget extends StatelessWidget {
  const CheckoutContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ToastInterfaceController toastController =
        CustomToastWidget(context: context);
    final provider = context.read<CheckoutScreenProvider>();
    final mainProvider = context.read<MainScreenProvider>();
    provider.getOrderForm();
    return PopScope(
      onPopInvoked: (_) {
        provider.updateOrderForm();
        mainProvider.updateCartQuantity();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const CustomTextAtom(
            text: 'Carrito',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Consumer<CheckoutScreenProvider>(
          builder: (context, _, child) => SafeArea(
            child: ((provider.products ?? []).isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CartViewWidgetTemplate(
                      cartList: ProductAppWidgetModelMapper.mapProductsModel(
                          provider.products),
                      onAddQuantity: (product) =>
                          provider.addUnitsProduct(product),
                      onSubstractQuantity: (product) =>
                          provider.substractUnitsProducts(product),
                      onClickBuyNow: () {
                        provider.removeOrderForm();
                        toastController.showToast('Gracias por tu compra');
                      },
                      onRemove: (product) => provider.removeProduct(product),
                      priceTotal: provider.total,
                      txtStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                : const EmptyBackgroundWidget(),
          ),
        ),
      ),
    );
  }
}
