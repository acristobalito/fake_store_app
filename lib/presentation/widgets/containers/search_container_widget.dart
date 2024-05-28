import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/mappers/product_app_model_mapper.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/domain/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchContainerWidget extends StatelessWidget {
  final List<ProductModel> products;
  const SearchContainerWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SearchProvider>();
    final mainProvider = context.read<MainScreenProvider>();
    provider.setProducts(products);
    return Scaffold(
      appBar: AppBar(
          title: const CustomTextAtom(
            text: 'Buscador',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
          actions: [
            Consumer<MainScreenProvider>(
              builder: (context, _, child) => IconCartMolecule(
                  onClick: () => CustomRoute.navigate(
                      context, ScreensItemModel.checkoutScreen),
                  cartCount: mainProvider.cartQuantity.toString()),
            )
          ]),
      body: SafeArea(
          child: Column(
        children: [
          CustomTextFieldAtom(
            onTapContainer: () {},
            onChangeValue: (keyWord) => provider.searchProduct(keyWord),
            hintText: 'Busca un producto',
            keyBoardType: TextInputType.text,
            prefixIcon: const Icon(Icons.search_rounded),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<SearchProvider>(
              builder: (context, _, child) => CardListWidgetOrganism(
                  products: ProductAppModelMapper.mapProductsModel(
                      provider.searchedProducts),
                  onClickItem: (product) => CustomRoute.navigate(
                      context, ScreensItemModel.detailScreen,
                      product: product)),
            ),
          )
        ],
      )),
    );
  }
}
