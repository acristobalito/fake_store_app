import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/pages/catalog_page.dart';
import 'package:fake_store_app/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainContainerWidget extends StatelessWidget {
  const MainContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainScreenProvider>();
    final List<Widget> pageList = [const HomePage(), const CatalogPage()];
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://c4.wallpaperflare.com/wallpaper/797/697/114/dragon-classical-light-luster-wallpaper-thumb.jpg'),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            const CustomTextAtom(
              text: 'Fake Store',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 25,
              child: CustomTextFieldAtom(
                onTapContainer: () => CustomRoute.navigate(
                    context, ScreensItemModel.searchScreen,
                    products: provider.products),
                onChangeValue: (value) {},
                hintText: 'Busca un producto',
                keyBoardType: TextInputType.text,
                readOnly: true,
                prefixIcon: const Icon(Icons.search_rounded),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: IconCartMolecule(
                onClick: () => CustomRoute.navigate(
                    context, ScreensItemModel.checkoutScreen),
                cartCount: provider.cartQuantity.toString()),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: NavigationWidgetOrganism(
            elevation: 0,
            currentIndex: provider.currentPageIndex,
            onTap: (index) => provider.setPageIndex(index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: 'Inicio'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.amp_stories_rounded), label: 'Catálogo'),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: TokenColors.scale03,
          onPressed: () =>
              CustomRoute.navigate(context, ScreensItemModel.supportScreen),
          child: const IconAtom(
            icon: Icons.contact_support_rounded,
            size: 40,
            colorIcon: Colors.white,
          )),
      body: IndexedStack(
        index: provider.currentPageIndex,
        children: pageList,
      ),
    );
  }
}
