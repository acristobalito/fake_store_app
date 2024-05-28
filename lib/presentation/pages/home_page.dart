import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/mappers/product_app_model_mapper.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/containers/carrousel_container_widget.dart';
import 'package:fake_store_app/presentation/widgets/generics/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainScreenProvider>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const ImageAtom(
                  boxFit: BoxFit.cover,
                  height: 200,
                  image:
                      'https://media.istockphoto.com/id/584236050/es/vector/ilustraci%C3%B3n-vectorial-de-gran-apertura-fondo.jpg?s=612x612&w=0&k=20&c=vTRCXwaV1plr0Mk5sUg01M_6XTFgpYRcUKOtjp184kc='),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const ImageAtom(
                  boxFit: BoxFit.cover,
                  height: 120,
                  image:
                      'https://renusa.pe/wp-content/uploads/2023/10/1643759243890e2b0-1.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: CustomTextAtom(
                  text: 'Recomendados para ti',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            (provider.recommendedForYouProducts == null ||
                    provider.recommendedForYouProducts!.isEmpty)
                ? const ProgressIndicatorWidget()
                : CarrouselContainerWidget(
                    products: ProductAppModelMapper.mapProductsModel(
                        provider.recommendedForYouProducts),
                    onProductClicked: (product) => CustomRoute.navigate(
                        context, ScreensItemModel.detailScreen,
                        product: product),
                  ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: CustomTextAtom(
                  text: 'Nueva sección Men\'s clothing',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            (provider.newSectionsProducts == null ||
                    provider.newSectionsProducts!.isEmpty)
                ? const ProgressIndicatorWidget()
                : CarrouselContainerWidget(
                    products: ProductAppModelMapper.mapProductsModel(
                        provider.newSectionsProducts),
                    onProductClicked: (product) => CustomRoute.navigate(
                        context, ScreensItemModel.detailScreen,
                        product: product),
                  )
          ],
        ),
      ),
    );
  }
}