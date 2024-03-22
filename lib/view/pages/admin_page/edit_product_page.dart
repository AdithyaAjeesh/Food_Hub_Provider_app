import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/edit_product_provider.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/product_model/product_model.dart';
import 'package:flutter_store_app/view/pages/admin_page/edit_screen.dart';
import 'package:provider/provider.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final editProvider = Provider.of<EditProductProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.getAllProductsProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Products'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Consumer2<EditProductProvider, ProductProvider>(
              builder: (context, provider, provider2, child) {
                // valueListenable: biriyaniProductListNotifier,
                // builder:
                //     (BuildContext ctx, List<BiriyaniProduct> productList, _) {
                return ListView.builder(
                  itemCount: provider2.product.length,
                  itemBuilder: (context, index) {
                    final product = provider2.product[index];
                    return GestureDetector(
                      onLongPress: () {
                        productProvider.deleteProductsProvider(index);
                      },
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditScreen(
                              name: product.name,
                              price: product.price,
                              image: product.image,
                              catogery: '',
                              disceription: product.description,
                            ),
                          ),
                        );
                      },
                      child: ProductEditCard(
                        biriyaniProduct: product,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductEditCard extends StatelessWidget {
  final ProductModel biriyaniProduct;

  const ProductEditCard({super.key, required this.biriyaniProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 100, 98, 98).withOpacity(0.1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Image.file(
              File(biriyaniProduct.image),
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
          const SizedBox(height: 5),
          Text(
            '\$ ${biriyaniProduct.price}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 10),
          const Text('tap to edit'),
          const SizedBox(height: 10),
          const Text('Long press to delete'),
        ],
      ),
    );
  }
}
