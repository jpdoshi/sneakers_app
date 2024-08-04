import 'package:flutter/material.dart';

import 'my_carousel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

int choiceIndex = 0;
List<String> categories = ['Featured', 'Men', 'Women', 'Kids'];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          const MyCarousel(),
          SizedBox(
            height: 40,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ChoiceChip(
                  showCheckmark: false,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  side: BorderSide.none,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  label: Text(categories[index], style: TextStyle(
                    color: (choiceIndex == index) ? Colors.white : Theme.of(context).colorScheme.secondary)),
                  selected: index == choiceIndex,
                  onSelected: (selected) {
                    setState(() {
                      choiceIndex = (selected) ? index : 0;
                    });
                  },
                );
              })
            ),
        ]);
  }
}

