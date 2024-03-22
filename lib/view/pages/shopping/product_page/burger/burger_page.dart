import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/service/chart_functions.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/product_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/product_details.dart';
import 'package:provider/provider.dart';

class BurgerPage extends StatelessWidget {
  const BurgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    List<int> sum = [];
    provider.getAllProductsProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Burger',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      body: Column(
        children: [
          Expanded(
              child: Consumer<ProductProvider>(
                builder: (context, provider, child) {
              final filteredburgerList = provider.product
                  .where(
                      (element) => element.catagory.toLowerCase() == 'burger')
                  .toList();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (100 / 140),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredburgerList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final biriyaniProduct = filteredburgerList[index];
                  sum.add(int.tryParse(biriyaniProduct.price)!.toInt());
                  double totalBurger = sum
                      .reduce((value, element) => value + element)
                      .toDouble();
                  ChartFunctions.totalBurger = totalBurger;
          
                  return GestureDetector(
                    child:
                        ProductCard(biriyaniProduct: biriyaniProduct),
                    onLongPress: () {
                      // deleteBurgerProduct(index);
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
          ))
        ],
      ),
    );
  }
}
