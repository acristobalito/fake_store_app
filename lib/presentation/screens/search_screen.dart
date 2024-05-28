import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';
import 'package:fake_store_app/domain/provider/search_provider.dart';
import 'package:fake_store_app/presentation/widgets/containers/search_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  final List<ProductModel> products;
  const SearchScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SearchProvider(),
        child: SearchContainerWidget(
          products: products,
        ));
  }
}
