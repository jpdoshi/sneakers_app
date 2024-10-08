import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/components/favorites_view.dart';
import 'package:sneakers_app/components/home_view.dart';
import 'package:sneakers_app/components/my_appbar.dart';
import 'package:sneakers_app/components/profile_view.dart';
import 'package:sneakers_app/components/cart_view.dart';
import 'package:sneakers_app/components/search_view.dart';

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
    const SearchView(),
    const CartView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(context: context),
      body: viewList[currentViewIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: (currentViewIndex == 0) ?
                    Theme.of(context).colorScheme.primary : Colors.white
                ),
                child: IconButton(onPressed: () {
                    setState(() {
                      currentViewIndex = 0;
                    });
                  },
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(CupertinoIcons.home, color: (currentViewIndex == 0) ?
                    Colors.white : Colors.black)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: (currentViewIndex == 1) ?
                    Theme.of(context).colorScheme.primary : Colors.white
                ),
                child: IconButton(onPressed: () {
                    setState(() {
                      currentViewIndex = 1;
                    });
                  },
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(CupertinoIcons.heart, color: (currentViewIndex == 1) ?
                    Colors.white : Colors.black)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: (currentViewIndex == 2) ?
                    Theme.of(context).colorScheme.primary : Colors.white
                ),
                child: IconButton(onPressed: () {
                    setState(() {
                      currentViewIndex = 2;
                    });
                  },
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(CupertinoIcons.search, color: (currentViewIndex == 2) ?
                    Colors.white : Colors.black)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: (currentViewIndex == 3) ?
                    Theme.of(context).colorScheme.primary : Colors.white
                ),
                child: IconButton(onPressed: () {
                  setState(() {
                    currentViewIndex = 3;
                  });
                },
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(CupertinoIcons.bag, color: (currentViewIndex == 3) ?
                    Colors.white : Colors.black)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: (currentViewIndex == 4) ?
                    Theme.of(context).colorScheme.primary : Colors.white
                ),
                child: IconButton(onPressed: () {
                    setState(() {
                      currentViewIndex = 4;
                    });
                  },
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(CupertinoIcons.person, color: (currentViewIndex == 4) ?
                    Colors.white : Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

