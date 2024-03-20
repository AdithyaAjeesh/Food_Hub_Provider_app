import 'package:flutter/material.dart';
import 'package:flutter_store_app/view/widgets/product_container.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ProductContainerLarge(
            height: 250,
            width: 170,
            image: 'assets/test-1200x1200 Pepsi 750 ml.jpg',
            name: 'Pepsi',
            price: 40,
          ),
          ProductContainerLarge(
            height: 250,
            width: 170,
            image: 'assets/istockphoto-840902892-612x612.jpg',
            name: 'Burger',
            price: 100,
          ),
          ProductContainerLarge(
            height: 250,
            width: 170,
            image:
                'assets/pngtree-chicken-biryani-front-view-png-image_9167532.png',
            name: 'Biriyani',
            price: 140,
          ),
        ],
      ),
    );
  }
}
