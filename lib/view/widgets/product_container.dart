import 'package:flutter/material.dart';

class ProductContainerSmall extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final String route;

  const ProductContainerSmall({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    required this.route,
    required int index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(image),
      ),
    );
  }
}

class ProductContainerLarge extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final String name;
  final int price;
  const ProductContainerLarge({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(image),
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price: $price',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.redAccent),
              ),
              const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
