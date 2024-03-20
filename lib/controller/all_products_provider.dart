import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_card.dart';
import 'package:flutter_store_app/view/pages/shopping/product_page/biriyani/biriyani_details.dart';

class AllProductProvider extends ChangeNotifier {
  List<dynamic> allProducts = [];
  String searchQuery = '';
  final ProductProvider productProvider = ProductProvider();

  Future<void> getAllProducts({String? query}) async {
    await Future.wait([
      productProvider.getAllBiriyaniProductsProvider(),
    ]);

    allProducts = [
      ...productProvider.biriyani,
    ];

    if (query != null && query.isNotEmpty) {
      allProducts = allProducts.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  Widget buildProductCard(dynamic product) {
    if (product is BiriyaniProduct) {
      return BiriyaniProductCard(biriyaniProduct: product);
    }
    return const SizedBox();
  }

  void navigateToProductDetails(dynamic product, context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (product is BiriyaniProduct) {
            return BiriyaniDetailsScreen(biriyaniProduct: product);
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
