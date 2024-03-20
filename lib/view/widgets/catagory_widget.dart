import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_store_app/view/widgets/product_container.dart';

class CatagoryWidget extends StatelessWidget {
  const CatagoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductContainerSmall(
            height: 120,
            width: 120,
            image: 'assets/71YBmiSj-cL.jpg',
            index: 1,
            route: '/drink',
          ),
          ProductContainerSmall(
            height: 120,
            width: 120,
            image: 'assets/istockphoto-840902892-612x612.jpg',
            index: 2,
            route: '/burger',
          ),
          ProductContainerSmall(
            height: 120,
            width: 120,
            image:
                'assets/pngtree-chicken-biryani-front-view-png-image_9167532.png',
            index: 3,
            route: '/biriyani',
          ),
          ProductContainerSmall(
            height: 120,
            width: 120,
            image:
                'assets/png-transparent-pizza-slice-pizza-italian-cuisine-sicilian-pizza-pizza-margherita-garlic-bread-takeout-pizza-by-the-slice-thumbnail.png',
            index: 4,
            route: '',
          ),
        ],
      ),
    );
  }
}
