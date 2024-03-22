import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/product_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/product_details.dart';
import 'package:provider/provider.dart';

class SoftDrinkPage extends StatelessWidget {
  const SoftDrinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.getAllProductsProvider();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Soft Drinks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 170, 59),
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, providers, child) {
                  final filteredsoftdrinkList = providers.product
                      .where((element) =>
                          element.catagory.toLowerCase() == 'softdrink')
                      .toList();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (100 / 140),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: filteredsoftdrinkList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final biriyaniProduct = filteredsoftdrinkList[index];

                      return GestureDetector(
                        child: ProductCard(biriyaniProduct: biriyaniProduct),
                        onLongPress: () {
                          // deleteBiriyaniProducts(index);
                          provider.deleteProductsProvider(index);
                        },
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                  biriyaniProduct: biriyaniProduct),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
