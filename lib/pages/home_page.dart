import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/components/favorites_view.dart';
import 'package:sneakers_app/components/home_view.dart';
import 'package:sneakers_app/components/my_appbar.dart';
import 'package:sneakers_app/components/profile_view.dart';
import 'package:sneakers_app/components/cart_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentViewIndex = 0;

  final List<Widget> viewList = [
    const HomeView(),
    const FavoritesView(),
    const CartView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(context: context),
      body: viewList[currentViewIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12)],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {
                  setState(() {
                    currentViewIndex = 0;
                  });
                },
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(CupertinoIcons.home, color: (currentViewIndex == 0) ?
                  Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary)),
              IconButton(onPressed: () {
                  setState(() {
                    currentViewIndex = 1;
                  });
                },
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(CupertinoIcons.heart, color: (currentViewIndex == 1) ?
                  Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary)),
              IconButton(onPressed: () {
                  setState(() {
                    currentViewIndex = 2;
                  });
                },
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(CupertinoIcons.bag, color: (currentViewIndex == 2) ?
                  Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary)),
              IconButton(onPressed: () {
                  setState(() {
                    currentViewIndex = 3;
                  });
                },
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(CupertinoIcons.person, color: (currentViewIndex == 3) ?
                  Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary)),
            ],
          ),
        ),
      ),
    );
  }
}

