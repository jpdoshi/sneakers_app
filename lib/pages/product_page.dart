import 'package:flutter/material.dart';
import 'package:sneakers_app/components/my_appbar.dart';
import 'package:sneakers_app/models/shoes_item_model.dart';
import 'package:sneakers_app/utils.dart';

class ProductPage extends StatefulWidget {
  final String shoesId;
  final String title;

  const ProductPage({super.key, required this.shoesId, required this.title});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int colorVariantIndex = 0;
  late Future<Map> preFetchedShoes;

  @override
  void initState() {
    preFetchedShoes = getShoesById(widget.shoesId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: MyAppbar(
        context: context,
        color: const Color(0xffF5F5F5),
        title: Text(widget.title, style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18
      ))),
      body: FutureBuilder(
        future: preFetchedShoes,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: ListView(
                children: [
                  Stack(
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, -100),
                          child: Image.network(
                            snapshot.data['colorVariants'][colorVariantIndex]['imgUrl'],
                            height: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(children: [
                        SizedBox(height: MediaQuery.of(context).size.width - 160),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            snapshot.data['colorVariants'].length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  colorVariantIndex = index;
                                });
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: (index == colorVariantIndex)
                                      ? Theme.of(context).colorScheme.primary: Colors.transparent),
                                  borderRadius: BorderRadius.circular(30),
                                  color: HexColor(snapshot.data['colorVariants'][index]['color'])
                              )),
                            )
                          ),
                        )
                      ]),
                    )
                  ]
                )]
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

