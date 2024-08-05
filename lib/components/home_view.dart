import 'package:flutter/material.dart';
import 'package:sneakers_app/models/shoes_item_model.dart';
import 'package:sneakers_app/pages/product_page.dart';

import 'my_carousel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

int choiceIndex = 0;
List<String> categories = ['All', 'Men', 'Women', 'Kids'];

class _HomeViewState extends State<HomeView> {
  late Future<List<dynamic>> preFetchedShoes;

  @override
  void initState() {
    preFetchedShoes = getShoesByCategory(categories[choiceIndex]);
    super.initState();
  }

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
                      preFetchedShoes = getShoesByCategory(categories[choiceIndex]);
                  });
                },
              );
            })
          ),
          FutureBuilder(
            future: preFetchedShoes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  padding: const EdgeInsets.all(10),
                  primary: false,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                  children: List.generate(
                    snapshot.data!.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductPage(
                              shoesId: snapshot.data?[index]['_id'], title: snapshot.data?[index]['title'])
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xffF5F5F5),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 1))]
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(snapshot.data?[index]['colorVariants'][0]['imgUrl'])
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data?[index]['title'],
                                      maxLines: 1,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "₹${snapshot.data?[index]['price']}",
                                      style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.secondary),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 12,
                                bottom: 12,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white,
                                  ),
                                  child: const Icon(Icons.chevron_right, size: 24)
                                )
                              )
                            ],
                          )
                        ),
                      ),
                    ),
                  )
                );
              } else {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }
          )
        ]);
  }
}

