import 'package:flutter/material.dart';

import 'my_carousel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const [
        MyCarousel(),

    ]);
  }
}
