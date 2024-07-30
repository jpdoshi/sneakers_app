import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/pages/cart_page.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  final Text titleText;
  final Widget? leading;

  const MyAppbar({super.key, required this.context, required this.titleText, this.leading});

  @override
  State<MyAppbar> createState() => _MyAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(MediaQuery.of(context).size.width, 56);
}

class _MyAppbarState extends State<MyAppbar> {
  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (widget.leading != null) ? widget.leading : null,
      title: widget.titleText,
      centerTitle: true,
      actions: [
          Stack(
            clipBehavior: Clip.none,
            children:[
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color(0xffDDDDDD)),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Transform.translate(
                  offset: const Offset(0, -2),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
                    },
                    icon: const Icon(CupertinoIcons.bag),
                  ),
                ),
            ),
            Positioned(
              top: -5,
              left: -5,
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  border: Border.all(color: Colors.white, width: 2, strokeAlign: BorderSide.strokeAlignOutside),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Transform.translate(
                  offset: const Offset(5.5, 0),
                  child: Text(cartCount.toString(), style: const TextStyle(
                      color: Colors.white, fontSize: 12)),
                ),
              )
            )
          ]
        )
      ],
    );
  }
}

