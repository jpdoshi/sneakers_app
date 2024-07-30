import 'package:sneakers_app/models/shoes_item_model.dart';

class CartItem {
  final ShoesItem shoesItem;
  final String shoesSize;
  final int colorVariant;

  CartItem({
    required this.shoesItem,
    required this.shoesSize,
    required this.colorVariant
  });

  void addItemToCart(ShoesItem shoesItem) {
    // add shoesItem to cart model
  }
}
