import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late List<dynamic> fetchedShoes = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      children: [
        Container(
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2, offset: const Offset(0, 1))]
          ),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search, color: Theme.of(context).colorScheme.secondary),
                filled: true,
                fillColor: const Color(0xffF5F5F5),
                hintText: 'Search Shoes',
                contentPadding: const EdgeInsets.all(12),
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                )
            ),
          ),
        ),
        (fetchedShoes.isNotEmpty) ?
          ListView(primary: false, shrinkWrap: true, children: [
          const SizedBox(height: 20),
          Text('${fetchedShoes.length} Results', style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            )),
            const SizedBox(height: 15),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: fetchedShoes.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                     borderRadius: BorderRadius.circular(8)
              ));
            })
          ])
        : const SizedBox(
          height: 200,
          child: Center(child: Text('No Result'))
        )
      ],
    );
  }
}

