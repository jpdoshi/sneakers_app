class ShoesItem {
  final double price;
  final int discount;
  final String title;
  final List<Map<String, String>> colorVariants;

  ShoesItem({
    required this.price,
    required this.discount,
    required this.title,
    required this.colorVariants
  });

  List<ShoesItem> getAllShoes() {
    // fetch List of shoesItem as JSON
    // map JSON to List of shoesItem objects
    // return List of shoesItem(s)
    return [
      ShoesItem(
        price: 9200, discount: 10, title: 'Air 1\'07',
        colorVariants: [
          {'color': 'Green', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/29a93e9c-0279-47c8-abc3-9f7a2f475c88/AIR+FORCE+1+%2707.png'},
          {'color': 'Blue', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c487cd81-5bfe-4be1-983f-6c0af3ecaf7e/AIR+FORCE+1+%2707.png'},
        ]),
      ShoesItem(
          price: 9200, discount: 10, title: 'Air 1\'07',
          colorVariants: [
            {'color': 'Green', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/29a93e9c-0279-47c8-abc3-9f7a2f475c88/AIR+FORCE+1+%2707.png'},
            {'color': 'Blue', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c487cd81-5bfe-4be1-983f-6c0af3ecaf7e/AIR+FORCE+1+%2707.png'},
          ]),
    ];
  }

  ShoesItem getShoesById(int shoesId) {
    // fetch shoes from id
    // map JSON to shoesItem object
    // return shoesItem object
    return ShoesItem(
      price: 9200, discount: 10, title: 'Air 1\'07',
      colorVariants: [
        {'color': 'Green', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/29a93e9c-0279-47c8-abc3-9f7a2f475c88/AIR+FORCE+1+%2707.png'},
        {'color': 'Blue', 'imgUrl': 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/c487cd81-5bfe-4be1-983f-6c0af3ecaf7e/AIR+FORCE+1+%2707.png'},
      ]
    );
  }
}
