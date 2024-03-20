import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/cart_provider.dart';
import 'package:flutter_store_app/service/cart_function.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('cart');
    final provider = Provider.of<CartProvider>(context, listen: false);

    provider.getAllCartItemsProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Consumer<CartProvider>(builder: (context, cartpro, child) {
            cartpro.getAllCartItemsProvider();
            return Expanded(
              child: ListView.builder(
                  itemCount: cartItemListNotifier.value.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItemListNotifier.value[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 233, 224, 224),
                      ),
                      padding: const EdgeInsets.all(20),
                      height: 200,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(cartItem.image),
                          ),
                          const SizedBox(width: 50),
                          Column(
                            children: [
                              Text(
                                cartItem.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                cartItem.price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  provider.deleteCartItemProvider(index);
                                },
                                label: const Text('DELETE'),
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            );
          }),
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 170, 59),
            ),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<CartProvider>(builder: (context, cartpro, child) {
                  return Text(
                    'Total Price = ${cartpro.cartTotalPrice()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  );
                }),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Order'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
