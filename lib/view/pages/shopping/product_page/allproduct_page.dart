// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/all_products_provider.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:provider/provider.dart';

class AllProductPage extends StatelessWidget {
  const AllProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    final providers = Provider.of<AllProductProvider>(context, listen: false);
    providers.getAllProductsPro();
    provider.getAllProductsProvider();
    return Scaffold(
      body: Consumer<AllProductProvider>(
        builder: (context, providers, child) {
          return Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Search products...',
                ),
                onChanged: (value) {
                  providers.searchFunction(value);
                  // providers.searchQuery = value;

                  providers.getAllProductsPro(query: value);
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: providers.allProducts.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 100 / 140,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: providers.allProducts.length,
                        itemBuilder: (context, index) {
                          final product = providers.allProducts[index];
                          return GestureDetector(
                            onTap: () {
                              providers.navigateToProductDetails(
                                  product, context);
                            },
                            child: providers.buildProductCard(product),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
