import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_app/models/shoes_item_model.dart';

import '../pages/product_page.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Future<List<dynamic>> fetchedShoes = Future.value([]);
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10)
                ]),
            child: TextField(
              controller: searchController,
              onChanged: (text) {
                setState(() {
                  fetchedShoes = searchShoes(text);
                });
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search,
                      color: Theme.of(context).colorScheme.secondary),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search for "Air"',
                  contentPadding: const EdgeInsets.all(12),
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none)),
            ),
          ),
        ),
        (searchController.text != '')
            ? FutureBuilder(
                future: fetchedShoes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text('${snapshot.data?.length} Results',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 5),
                          GridView.count(
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductPage(
                                                        shoesId: snapshot
                                                                .data?[index]
                                                            ['_id'],
                                                        title: snapshot
                                                                .data?[index]
                                                            ['title'])));
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color(0xffF5F5F5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 1))
                                              ]),
                                          child: Stack(
                                              fit: StackFit.expand,
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: Image.network(
                                                        snapshot.data?[index][
                                                                'colorVariants']
                                                            [0]['imgUrl'])),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.data?[index]
                                                            ['title'],
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        "₹${snapshot.data?[index]['price']}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .secondary),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                    right: 12,
                                                    bottom: 12,
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          color: Colors.white,
                                                        ),
                                                        child: const Icon(
                                                            Icons.chevron_right,
                                                            size: 24)))
                                              ])),
                                    )),
                              ))
                        ]);
                  } else {
                    return const SizedBox(
                        height: 120,
                        child: Center(child: CircularProgressIndicator())
                    );
                  }
                })
            : SizedBox(
                height: 120,
                child: Center(
                    child: Text('Type to Search Shoes',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.secondary))))
      ],
    );
  }
}
