import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/mappers/product_app_model_mapper.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/containers/carrousel_container_widget.dart';
import 'package:fake_store_app/presentation/widgets/extensions/color_extension.dart';
import 'package:fake_store_app/presentation/widgets/generics/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final MainScreenProvider mainScreenProvider;
  const HomePage({super.key, required this.mainScreenProvider});

  @override
  Widget build(BuildContext context) {
    final params = mainScreenProvider.landingParameterizationModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Consumer<MainScreenProvider>(
          builder: (context, _, child) => Column(
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
              (params?.discountEnable ?? false)
                  ? Container(
                      width: double.infinity,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const ImageAtom(
                          boxFit: BoxFit.cover,
                          height: 120,
                          image:
                              'https://renusa.pe/wp-content/uploads/2023/10/1643759243890e2b0-1.png'),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: ColorExtension.stringToColor(
                    params?.recommendedSection?.colorSection),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomTextAtom(
                          text: params?.recommendedSection?.title ??
                              'Recomendados para ti',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: ColorExtension.stringToColor(
                                  params?.recommendedSection?.titleColor)),
                        )),
                    (mainScreenProvider.recommendedForYouProducts == null ||
                            mainScreenProvider
                                .recommendedForYouProducts!.isEmpty)
                        ? const ProgressIndicatorWidget()
                        : CarrouselContainerWidget(
                            products: ProductAppModelMapper.mapProductsModel(
                                mainScreenProvider.recommendedForYouProducts),
                            onProductClicked: (product) => CustomRoute.navigate(
                                context, ScreensItemModel.detailScreen,
                                product: product),
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: ColorExtension.stringToColor(
                    params?.newSection?.colorSection),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomTextAtom(
                          text: params?.newSection?.title ??
                              'Nueva sección Men\'s clothing',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: ColorExtension.stringToColor(
                                  params?.newSection?.titleColor)),
                        )),
                    (mainScreenProvider.newSectionsProducts == null ||
                            mainScreenProvider.newSectionsProducts!.isEmpty)
                        ? const ProgressIndicatorWidget()
                        : CarrouselContainerWidget(
                            products: ProductAppModelMapper.mapProductsModel(
                                mainScreenProvider.newSectionsProducts),
                            onProductClicked: (product) => CustomRoute.navigate(
                                context, ScreensItemModel.detailScreen,
                                product: product),
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
