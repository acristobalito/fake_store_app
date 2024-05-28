import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/mappers/product_app_model_mapper.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainScreenProvider>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CatalogViewWidgetTemplate(
        isEnable: provider.categories.length > 1,
        products:
            ProductAppModelMapper.mapProductsModel(provider.categoriesProducts),
        categories: provider.categories,
        onProductClicked: (product) => CustomRoute.navigate(
            context, ScreensItemModel.detailScreen,
            product: product),
        onCategorySelected: (category) => provider.filterProduct(category),
      ),
    );
  }
}
