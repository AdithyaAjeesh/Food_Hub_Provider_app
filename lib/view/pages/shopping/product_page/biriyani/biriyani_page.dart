import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_details.dart';
import 'package:provider/provider.dart';

class BiriyaniPage extends StatelessWidget {
  const BiriyaniPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.getAllBiriyaniProductsProvider();
    // getAllBiriyaniProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Biriyani',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, providers, child) {
                final filteredbiriyaniList = providers.biriyani
                    .where((element) =>
                        element.catagory.toLowerCase() == 'biriyani')
                    .toList();
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (100 / 140),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: filteredbiriyaniList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final biriyaniProduct = filteredbiriyaniList[index];

                    return GestureDetector(
                      child:
                          BiriyaniProductCard(biriyaniProduct: biriyaniProduct),
                      onLongPress: () {
                        // deleteBiriyaniProducts(index);
                        provider.deleteBiriyaniProductsProvider(index);
                      },
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BiriyaniDetailsScreen(
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
          //   );
          // })
        ],
      ),
    );
  }
}
