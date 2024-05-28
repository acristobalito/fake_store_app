import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_store_app/domain/provider/detail_provider.dart';
import 'package:fake_store_app/presentation/widgets/containers/product_detail_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final ProductWidgetModel product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => DetailProvider(product),
        child: ProductDetailContainerWidget(product: product));
  }
}
