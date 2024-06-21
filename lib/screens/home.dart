import 'package:blocproject/widgets/scrollitems.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('GoTV'),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: CarouselSlider.builder(
                itemCount: 20,
                itemBuilder: (context, index, indexpage) {
                  return Container(
                    color: Colors.brown,
                  );
                },
                options: CarouselOptions(
                  padEnds: false,
                  aspectRatio: 9 / 16,
                  enlargeCenterPage: false,
                  pageSnapping: true,
                  height: 450,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ScrollItems(),
            const SizedBox(
              height: 20,
            ),
            const ScrollItems(),
            const SizedBox(
              height: 20,
            ),
            const ScrollItems()
          ],
        ),
      ),
    );
  }
}
