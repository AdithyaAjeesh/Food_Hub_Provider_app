import 'package:flutter/material.dart';

class CarouselSliderWidgetProvider extends ChangeNotifier {
  int activeIndex = 0;
  final List<String> carouseImage1 = [
    'assets/fast-food-menu-ads-design-template-2cb6155ec23e1e0b9417e7f75ba5c4ad_screen.jpg',
    'assets/15b08d3d8b411079a8b3a8a2b8a2b23e.jpg',
    'assets/fast-food-design-template-0dac6ce85afc9a58c0d3c7ff865076bc_screen.jpg',
    'assets/85217101a2da2f7cd0c1e97c854a0ce1.jpg',
    'assets/restaurant-menu-ads-design-template-414ec905fe00564199dac8708c47dd5d_screen.jpg'
  ];
  changePages(index) {
    activeIndex = index;
    notifyListeners();
  }
}
