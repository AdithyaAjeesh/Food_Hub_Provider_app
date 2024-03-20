import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/cart_provider.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/model%20/data/cart_model/cart_model.dart';
import 'package:provider/provider.dart';

class BiriyaniDetailsScreen extends StatelessWidget {
  final BiriyaniProduct biriyaniProduct;
  const BiriyaniDetailsScreen({super.key, required this.biriyaniProduct});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          biriyaniProduct.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 170, 59),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Image.asset(biriyaniProduct.image),
              ),
            ],
          ),
          Text(
            biriyaniProduct.name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 219, 218, 218),
            ),
            child: Column(
              children: [
                Text(
                  biriyaniProduct.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '\$ ${biriyaniProduct.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GST: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '5 %',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delevery Time: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '30 Min',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              final cartItem = CartItem(
                id: biriyaniProduct.id,
                name: biriyaniProduct.name,
                image: biriyaniProduct.image,
                price: biriyaniProduct.price,
                quantity: biriyaniProduct.quantity,
              );
              provider.addToCartProvider(cartItem);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 170, 59),
            ),
            child: const Text('Add To Cart'),
          )
        ],
      ),
    );
  }
}
