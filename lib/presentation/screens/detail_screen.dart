import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/presentation/widgets/containers/product_detail_container_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final ProductWidgetModel product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductDetailContainerWidget(product: product);
  }
}
