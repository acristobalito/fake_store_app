import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/config/navigation/custom_route.dart';
import 'package:fake_store_app/domain/models/navigation/screens_item_model.dart';
import 'package:fake_store_app/domain/provider/main_screen_provider.dart';
import 'package:fake_store_app/presentation/pages/catalog_page.dart';
import 'package:fake_store_app/presentation/pages/home_page.dart';
import 'package:fake_store_app/presentation/widgets/generics/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainContainerWidget extends StatelessWidget {
  const MainContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainScreenProvider>();
    final List<Widget> pageList = [const HomePage(), const CatalogPage()];
    return Scaffold(
        drawer: const CustomDrawerWidget(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.nicepng.com/png/detail/136-1366211_group-of-10-guys-login-user-icon-png.png'),
                ),
              ),
            );
          }),
          centerTitle: true,
          title: const CustomTextAtom(
            text: 'Fake Store',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          actions: [
            IconCartMolecule(
                onClick: () => CustomRoute.navigate(
                    context, ScreensItemModel.checkoutScreen),
                cartCount: provider.cartQuantity.toString())
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
        body: IndexedStack(
          index: provider.currentPageIndex,
          children: pageList,
        ));
  }
}
