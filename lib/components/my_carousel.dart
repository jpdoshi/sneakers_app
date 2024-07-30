import 'package:flutter/material.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
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
                        color: const Color(0xffEEEEEE),
                        borderRadius: BorderRadius.circular(24)
                    ),
                  ),
                );
              },
            ),
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
