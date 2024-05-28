import 'package:ecommerce_widgets_package/ecommerce_widgets_package.dart';
import 'package:fake_api_source_package/infrastructure/repositories/repositories.dart';

class ProductAppModelMapper {
  static List<ProductWidgetModel> mapProductsModel(
          List<ProductModel>? products) =>
      (products != null)
          ? products
              .map(
                (product) => ProductWidgetModel(
                    id: product.id,
                    title: product.title,
                    price: product.price,
                    description: product.description,
                    category: product.category,
                    image: product.image,
                    rating: RatingWidgetModel(
                        rate: product.rating.rate,
                        count: product.rating.count)),
              )
              .toList()
          : [];
}
