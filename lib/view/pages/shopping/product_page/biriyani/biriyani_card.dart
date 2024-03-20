import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';

class BiriyaniProductCard extends StatelessWidget {
  final BiriyaniProduct biriyaniProduct;
  const BiriyaniProductCard({super.key, required this.biriyaniProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 134, 128, 128).withOpacity(0.1),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            height: 130,
            width: 130,
            child: Image.asset(
              biriyaniProduct.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            biriyaniProduct.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '\$ ${biriyaniProduct.price}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.redAccent),
          )
        ],
      ),
    );
  }
}
