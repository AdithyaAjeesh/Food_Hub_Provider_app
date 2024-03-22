// ignore_for_file: must_be_immutable

import 'package:fine_bar_chart/fine_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/cart_provider.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:provider/provider.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final cartpro = Provider.of<CartProvider>(context);
    List<double> barValue1 = [
      provider.productTotalPrice(),
      cartpro.cartTotalPrice(),
    ];
    List<double> barValue2 = [
      provider.productTotalCount(),
      cartpro.cartTotalCount(),
    ];

    List<Color> barColors = [
      Colors.red,
      Colors.yellow,
    ];

    List<String> bottomBarName1 = [
      "Total Price",
      "Cart Total Price",
    ];
    List<String> bottomBarName2 = [
      "Total Price",
      "Cart Total Price",
    ];
    provider.getAllProductsProvider();
    cartpro.getAllCartItemsProvider();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  const Text(
                    'Price of Items Added by admin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  FineBarChart(
                    barWidth: 30,
                    barHeight: 300,
                    backgroundColors: Colors.white,
                    isBottomNameDisable: false,
                    isValueDisable: false,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    barBackgroundColors: Colors.grey,
                    barValue: barValue1,
                    barColors: barColors,
                    barBottomName: bottomBarName1,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  const Text(
                    'Price of Items in Cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  FineBarChart(
                    barWidth: 30,
                    barHeight: 300,
                    backgroundColors: Colors.white,
                    isBottomNameDisable: false,
                    isValueDisable: false,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    barBackgroundColors: Colors.grey,
                    barValue: barValue2,
                    barColors: barColors,
                    barBottomName: bottomBarName2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
