import 'package:sneakers_app/models/cart_item_model.dart';
import 'package:sneakers_app/models/shoes_item_model.dart';

class Cart {
  final List<CartItem> cartItems;

  Cart({required this.cartItems});

  List<CartItem> getAllCartItems(int userToken) {
    // fetch cart items with userToken as JSON
    // map JSON values to CartItem object
    // return List of CartItem objects
    return [
      CartItem(
        shoesItem: ShoesItem(
          price: 9200, discount: 10, title: 'Air 1\'07',
          colorVariants: [
            {'color': 'Green', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/29a93e9c-0279-47c8-abc3-9f7a2f475c88/AIR+FORCE+1+%2707.png'},
            {'color': 'Blue', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c487cd81-5bfe-4be1-983f-6c0af3ecaf7e/AIR+FORCE+1+%2707.png'},
          ]
        ),
        shoesSize: 'UK 7', colorVariant: 0,
      ),
      CartItem(
        shoesItem: ShoesItem(
            price: 9200, discount: 10, title: 'Air 1\'07',
            colorVariants: [
              {'color': 'Green', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/29a93e9c-0279-47c8-abc3-9f7a2f475c88/AIR+FORCE+1+%2707.png'},
              {'color': 'Blue', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c487cd81-5bfe-4be1-983f-6c0af3ecaf7e/AIR+FORCE+1+%2707.png'},
            ]
        ),
        shoesSize: 'UK 7', colorVariant: 0,
      ),
    ];
  }

  int getCartItemsLength(int userToken) {
    // fetch length of cartItem(s) with userToken as JSON
    // convert JSON to int
    // return it :-)
    return 10;
  }
}
