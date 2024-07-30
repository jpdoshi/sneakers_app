import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/components/favorites_view.dart';
import 'package:sneakers_app/components/home_view.dart';
import 'package:sneakers_app/components/my_appbar.dart';
import 'package:sneakers_app/components/my_carousel.dart';
import 'package:sneakers_app/components/profile_view.dart';
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
    const SearchView(),
    const FavoritesView(),
    const ProfileView()
  ];

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
      body: viewList[currentViewIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 10)],
          borderRadius: BorderRadius.circular(24)
        ),
        child: SafeArea(
          child: Row(
            children: [
              const Spacer(),
              IconButton(onPressed: () {
                setState(() {
                  currentViewIndex = 0;
                });
              }, icon: Icon(CupertinoIcons.home, color: (currentViewIndex == 0) ?
                Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary)),
              const Spacer(),
              IconButton(onPressed: () {
                setState(() {
                  currentViewIndex = 1;
                });
              }, icon: Icon(CupertinoIcons.search, color: (currentViewIndex == 1) ?
                Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary)),
              const Spacer(),
              IconButton(onPressed: () {
                setState(() {
                  currentViewIndex = 2;
                });
              }, icon: Icon(CupertinoIcons.heart, color: (currentViewIndex == 2) ?
                Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary)),
              const Spacer(),
              IconButton(onPressed: () {
                setState(() {
                  currentViewIndex = 3;
                });
              }, icon: Icon(CupertinoIcons.profile_circled, color: (currentViewIndex == 3) ?
                Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary)),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

