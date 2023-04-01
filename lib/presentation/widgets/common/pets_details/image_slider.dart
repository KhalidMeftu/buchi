import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../const/ui_helper.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imagesList;

  const ImageSlider({Key? key, required this.imagesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imagesList.isEmpty
        ? Image.asset('')
        : CarouselSlider(
            options: CarouselOptions(
              height: halfScreenHeight(context),
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: imagesList
                .map((item) => Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: NetworkImage("url"),
                        fit: BoxFit.cover,
                      ),
                    )))
                .toList(),
          );
  }
}
