import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/service/chart_functions.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_details.dart';
import 'package:provider/provider.dart';

class BurgerPage extends StatelessWidget {
  const BurgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    List<int> sum = [];
    provider.getAllBiriyaniProductsProvider();
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
                  
                
            // valueListenable: biriyaniProductListNotifier,
            // builder:
            //     (context, List<BiriyaniProduct> biriyaniproductList, child) {
              final filteredburgerList = provider.biriyani
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
                        BiriyaniProductCard(biriyaniProduct: biriyaniProduct),
                    onLongPress: () {
                      // deleteBurgerProduct(index);
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
          ))
        ],
      ),
    );
  }
}
