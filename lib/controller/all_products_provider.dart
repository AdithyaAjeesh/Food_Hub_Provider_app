import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/product_model/product_model.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/product_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/product_details.dart';

class AllProductProvider extends ChangeNotifier {
  List<dynamic> allProducts = [];
  String searchQuery = '';
  final ProductProvider productProvider = ProductProvider();

  Future<void> getAllProductsPro({String? query}) async {
    await Future.wait([
      productProvider.getAllProductsProvider(),
    ]);

    allProducts = [
      ...productProvider.product,
    ];

    if (query != null && query.isNotEmpty) {
      allProducts = productProvider.product.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void searchFunction(String value) {
    searchQuery = value;
    notifyListeners();
  }

  Widget buildProductCard(dynamic product) {
    if (product is ProductModel) {
      return ProductCard(biriyaniProduct: product);
    }
    return const SizedBox();
  }

  void navigateToProductDetails(dynamic product, context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (product is ProductModel) {
            return ProductDetailsScreen(biriyaniProduct: product);
          }
          return const Scaffold();
        },
      ),
    );
  }

  int isSelected = 0;
  changePage(index) {
    isSelected = index;
    notifyListeners();
  }
}
