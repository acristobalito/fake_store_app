import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/mappers/product_app_model_mapper.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/widgets/backgrounds/empty_results_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProductDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Busca un producto';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      fontFamily: FoundationTypo.font);

  @override
  List<Widget>? buildActions(BuildContext context) {
    final provider = context.watch<MainScreenProvider>();
    return [
      IconCartMolecule(
          onClick: () =>
              CustomRoute.navigate(context, ScreensItemModel.checkoutScreen),
          cartCount: provider.cartQuantity.toString())
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => CustomRoute.backNavigate(context),
        icon: const Icon(Icons.arrow_back_ios_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    final provider = context.read<MainScreenProvider>();
    final productResults = provider.searchProduct(query);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: productResults.isNotEmpty
            ? CardListWidgetOrganism(
                products:
                    ProductAppModelMapper.mapProductsModel(productResults),
                onClickItem: (product) => CustomRoute.navigate(
                    context, ScreensItemModel.detailScreen,
                    product: product))
            : const EmptyResultsWidget(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = context.read<MainScreenProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CardListWidgetOrganism(
            products: ProductAppModelMapper.mapProductsModel(
                provider.searchedProducts),
            onClickItem: (product) => CustomRoute.navigate(
                context, ScreensItemModel.detailScreen,
                product: product)),
      ),
    );
  }
}
