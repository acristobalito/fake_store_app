import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/mappers/product_app_model_mapper.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/delegates/search_product_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatelessWidget {
  final MainScreenProvider mainScreenProvider;
  const CatalogPage({super.key, required this.mainScreenProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CustomTextFieldAtom(
            /* onTapContainer: () => CustomRoute.navigate(
                context, ScreensItemModel.searchScreen,
                products: provider.products), */
            onTapContainer: () =>
                showSearch(context: context, delegate: SearchProductDelegate()),
            onChangeValue: (value) => null,
            hintText: 'Busca un producto',
            keyBoardType: TextInputType.text,
            readOnly: true,
            prefixIcon: const Icon(Icons.search_rounded),
          ),
          Expanded(
            child: Consumer<MainScreenProvider>(
              builder: (context, _, child) => CatalogViewWidgetTemplate(
                isEnable: mainScreenProvider.categories.length > 1,
                products: ProductAppModelMapper.mapProductsModel(
                    mainScreenProvider.categoriesProducts),
                categories: mainScreenProvider.categories,
                onProductClicked: (product) => CustomRoute.navigate(
                    context, ScreensItemModel.detailScreen,
                    product: product),
                onCategorySelected: (category) =>
                    mainScreenProvider.filterProduct(category),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
