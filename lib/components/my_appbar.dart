import 'package:flutter/material.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  final Text titleText;
  final Widget? leading;

  const MyAppbar({super.key, required this.context, required this.titleText, this.leading});

  @override
  State<MyAppbar> createState() => _MyAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(MediaQuery.of(context).size.width, 52);
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (widget.leading != null) ? widget.leading : null,
      title: widget.titleText,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffDDDDDD)),
              borderRadius: BorderRadius.circular(10)
            ),
          )
        )
      ],
    );
  }
}

