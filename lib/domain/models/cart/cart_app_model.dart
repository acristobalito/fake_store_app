class CartAppModel {
  final int id;
  final String image;
  final String nameProduct;
  final double price;
  int quantity;

  CartAppModel(
      {required this.id,
      required this.image,
      required this.nameProduct,
      required this.price,
      required this.quantity});
}
