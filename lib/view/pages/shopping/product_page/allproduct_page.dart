// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/all_products_provider.dart';
import 'package:provider/provider.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({super.key});

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllProductProvider>(context);
    provider.getAllProducts();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'Search products...',
            ),
            onChanged: (value) {
              provider.searchQuery = value;
              provider.getAllProducts(query: value);
            },
          ),
          const SizedBox(height: 20),
          Expanded(
            child: provider.allProducts.isEmpty
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
                    itemCount: provider.allProducts.length,
                    itemBuilder: (context, index) {
                      final product = provider.allProducts[index];
                      return GestureDetector(
                        onTap: () {
                          provider.navigateToProductDetails(product, context);
                        },
                        child: provider.buildProductCard(product),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
