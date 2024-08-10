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
  int sizeIndex = 0;

  late Future<Map> preFetchedShoes;
  List<String> shoeSizes = ['UK 6', 'UK 7', 'UK 8', 'UK 9'];

  @override
  void initState() {
    preFetchedShoes = getShoesById(widget.shoesId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  Stack(children:[
                    Container(
                      color: const Color(0xffF5F5F5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -50),
                            child: Image.network(
                              snapshot.data['colorVariants'][colorVariantIndex]['imgUrl'],
                              height: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 340),
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 2, offset: const Offset(0, -1))],
                          borderRadius: BorderRadius.circular(28)
                        ),
                        child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                    children: [
                                      const Text('₹', style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      const SizedBox(width: 2),
                                      Text('${snapshot.data['price']}', style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                        height: 1.15
                                      )),
                                    ],
                                  ),
                                  Text((snapshot.data['discount'] > 0)
                                      ? '${snapshot.data['discount']}% OFF' : 'No Offers',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red.shade700
                                  ))]),
                                  IconButton(
                                    color: Colors.red.shade700,
                                    onPressed: () {
                                      // add to favorites
                                    },
                                    icon: Icon(
                                      Icons.favorite_border_rounded,
                                      size: 32,
                                      color: Colors.black.withOpacity(0.6)
                                  )),
                              ]),
                              const SizedBox(height: 36),
                              const Text('Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              SizedBox(
                                height: 64,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: shoeSizes.length,
                                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                                    itemBuilder: (context, index) {
                                      return ChoiceChip(
                                        showCheckmark: false,
                                        selectedColor: Colors.white,
                                        color: const WidgetStatePropertyAll(Colors.white),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        side: BorderSide(color: (index == sizeIndex) ? Colors.black : Colors.black.withOpacity(0.1)),
                                        padding: const EdgeInsets.all(8),
                                        label: Text(shoeSizes[index], style: const TextStyle(fontSize: 15)),
                                        selected: index == sizeIndex,
                                        onSelected: (selected) {
                                          setState(() {
                                            sizeIndex = (selected) ? index : 0;
                                          });
                                        },
                                      );
                                    }),
                              ),
                              const SizedBox(height: 12),
                              InkWell(
                                onTap: () {
                                  // add to bag
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: const Text('Add To Bag',
                                    textAlign: TextAlign.center, style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.w500,
                                      fontSize: 16
                                  )),
                                ),
                              )
                            ],
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(children: [
                        const SizedBox(height: 285),
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
                                  height: 32,
                                  width: 32,
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: (index == colorVariantIndex)
                                            ? Theme.of(context).colorScheme.secondary: Colors.transparent),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                                          borderRadius: BorderRadius.circular(32),
                                          color: HexColor(snapshot.data['colorVariants'][index]['color']),
                                        )
                                    ),
                                  ),
                                ),
                              )
                          ),
                        )
                      ]),
                    ),
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

