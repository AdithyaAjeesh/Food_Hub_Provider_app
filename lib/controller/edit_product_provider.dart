import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/view/pages/admin_page/edit_product_page.dart';

class EditProductProvider extends ChangeNotifier {
  final ProductProvider productProvider = ProductProvider();
  Widget buildProductCard(dynamic product) {
    if (product is BiriyaniProduct) {
      return ProductEditCard(biriyaniProduct: product);
    }
    return const SizedBox();
  }

  deleteAnyProductProvider(dynamic product, index) {
    if (product is BiriyaniProduct) {
      productProvider.deleteBiriyaniProductsProvider(index);
      notifyListeners();
    }
  }
}
