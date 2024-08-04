import 'package:flutter/material.dart';
import 'package:sneakers_app/models/shoes_item_model.dart';
import 'package:sneakers_app/pages/product_page.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int currentPage = 0;
  late Future<List<dynamic>> preFetchedSlider;

  @override
  void initState() {
    preFetchedSlider = getShoesSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: FutureBuilder(
              future: preFetchedSlider,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  onPageChanged: (pageIndex) {
                    setState(() {
                      currentPage = pageIndex;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5F5),
                              borderRadius: BorderRadius.circular(24)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Stack(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Transform.translate(
                                      offset: const Offset(-28, -8),
                                      child: Transform.scale(
                                        scale: 1.5,
                                        child: Image.network(snapshot.data?[index]['colorVariants'][0]['imgUrl'])
                                      ),
                                    )]
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${snapshot.data?[index]['discount']}% Discount", style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30
                                      )),
                                      Text(snapshot.data?[index]['title'], style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Theme.of(context).colorScheme.secondary
                                      )),
                                      const SizedBox(height: 15),
                                      TextButton(onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => ProductPage(
                                              shoesId: snapshot.data?[index]['_id'],
                                              title: snapshot.data?[index]['title']
                                            )
                                        ));
                                      }, style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
                                        foregroundColor: const WidgetStatePropertyAll(Colors.white),
                                        padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 32))
                                      ), child: const Text('Shop Now'))
                                    ],
                                  ),
                                ],
                              ),
                          ),
                      ),
                    );
                  },
                );
              }
              else { return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5F5),
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
              }
            }),
          ),
          const SizedBox(height: 8),
          Wrap(
            children: List.generate(5, (index) {
              return Container(
                height: 8,
                width: 8,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: (index == currentPage) ? const Color(0xff212121) : const Color(0xffDDDDDD),
                  borderRadius: BorderRadius.circular(8)
                ),
              );
            })
          )
        ],
      ),
    );
  }
}
