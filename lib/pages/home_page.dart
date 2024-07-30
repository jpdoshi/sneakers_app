import 'package:flutter/material.dart';
import 'package:sneakers_app/components/my_appbar.dart';
import 'package:sneakers_app/components/my_carousel.dart';
import 'package:sneakers_app/pages/product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(context: context, leading: Transform.translate(
        offset: const Offset(16, 0),
        child: Image.asset('assets/icon.png'),
      ),
        titleText: const Text('Sneakers App', style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ))
      ),
      body: ListView(
        children: [
          const MyCarousel(),

        ]
      )
    );
  }
}
