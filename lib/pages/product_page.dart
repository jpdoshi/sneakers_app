import 'package:flutter/material.dart';
import 'package:sneakers_app/components/my_appbar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(context: context, titleText: const Text(
        'Product Name',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      )),
    );
  }
}
