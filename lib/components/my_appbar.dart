import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final Text? title;
  final Color? color;

  const MyAppbar({super.key, required this.context, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (title != null)
        ? title
        : Image.asset('assets/logo.png', height: 36),
      centerTitle: true,
      backgroundColor: (color != null) ? color : Colors.white,
      surfaceTintColor: (color != null) ? color : Colors.white,
    );
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(context).size.width, 56);
}


