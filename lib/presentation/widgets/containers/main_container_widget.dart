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
  final MainScreenProvider mainScreenProvider;
  const MainContainerWidget({super.key, required this.mainScreenProvider});

  @override
  Widget build(BuildContext context) {
    mainScreenProvider.getData();
    final List<Widget> pageList = [
      HomePage(
        mainScreenProvider: mainScreenProvider,
      ),
      CatalogPage(
        mainScreenProvider: mainScreenProvider,
      )
    ];
    return Consumer<MainScreenProvider>(
      builder: (context, _, child) => Scaffold(
          drawer: const CustomDrawerWidget(),
          appBar: AppBar(
            leading: Builder(builder: (context) {
              return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: const CircleAvatar(
                      backgroundColor: FoundationColors.primaryColor,
                      child: IconAtom(
                        icon: Icons.person_rounded,
                        size: 35,
                        colorIcon: Colors.white,
                      ),
                    ),
                  ));
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
                  cartCount: mainScreenProvider.cartQuantity.toString())
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: NavigationWidgetOrganism(
                elevation: 0,
                currentIndex: mainScreenProvider.currentPageIndex,
                onTap: (index) => mainScreenProvider.setPageIndex(index),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded), label: 'Inicio'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.amp_stories_rounded), label: 'Catálogo'),
                ]),
          ),
          body: IndexedStack(
            index: mainScreenProvider.currentPageIndex,
            children: pageList,
          )),
    );
  }
}
