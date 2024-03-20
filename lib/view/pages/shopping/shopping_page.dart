import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/all_products_provider.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/allproduct_page.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_page.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/burger/burger_page.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/softDrink/soft_drink_page.dart';
import 'package:provider/provider.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AllProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'Our Porducts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProductCatagory(
                    index: 0,
                    name: 'All Products',
                  ),
                  _buildProductCatagory(
                    index: 1,
                    name: 'Biriyani',
                  ),
                  _buildProductCatagory(
                    index: 2,
                    name: 'Burger',
                  ),
                  _buildProductCatagory(
                    index: 3,
                    name: 'Soft Drinks',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: provider.isSelected == 0
                  ? const AllProductPage()
                  : provider.isSelected == 1
                      ? const BiriyaniPage()
                      : provider.isSelected == 2
                          ? const BurgerPage()
                          : const SoftDrinkPage(),
            )
          ],
        ),
      ),
    );
  }
}

_buildProductCatagory({
  required int index,
  required String name,
}) =>
    Consumer<AllProductProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.changePage(index);
          },
          child: Container(
            width: 100,
            height: 40,
            margin: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  provider.isSelected == index ? Colors.red : Colors.redAccent,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
