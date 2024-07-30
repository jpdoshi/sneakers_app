import 'package:flutter/material.dart';
import 'package:sneakers_app/components/my_appbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(context: context, titleText: const Text(
          'Shopping Bag', style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      )),
      body: const Text('Cart Data'),
    );
  }
}
