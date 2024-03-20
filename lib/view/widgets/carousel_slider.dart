// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/carousel_slider_provider.dart';
import 'package:provider/provider.dart';

class CarouselSliderWidget extends StatelessWidget {
  final int scrollDelay;
  const CarouselSliderWidget({
    super.key,
    required this.scrollDelay,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CarouselSliderWidgetProvider>(context);
    return CarouselSlider.builder(
      itemCount: provider.carouseImage1.length,
      itemBuilder: (BuildContext, index, realIndex) {
        final String imagePath = provider.carouseImage1[index];
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: AssetImage(imagePath),
          ),
        );
      },
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: scrollDelay),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          provider.changePages(index);
        },
      ),
    );
  }
}
