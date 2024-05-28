import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:flutter/material.dart';

class CarrouselContainerWidget extends StatelessWidget {
  final List<ProductWidgetModel> products;
  final Function(ProductWidgetModel) onProductClicked;
  const CarrouselContainerWidget(
      {super.key, required this.products, required this.onProductClicked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) => CardItemMolecule(
            product: products[index],
            onClick: () => onProductClicked.call(products[index])),
      ),
    );
  }
}
