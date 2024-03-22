import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/product_model/product_model.dart';
import 'package:flutter_store_app/view/pages/admin_page/edit_product_page.dart';

class EditProductProvider extends ChangeNotifier {
  final ProductProvider productProvider = ProductProvider();
  Widget buildProductCard(dynamic product) {
    if (product is ProductModel) {
      return ProductEditCard(biriyaniProduct: product);
    }
    return const SizedBox();
  }

  deleteAnyProductProvider(dynamic product, index) {
    if (product is ProductModel) {
      productProvider.deleteProductsProvider(index);
      notifyListeners();
    }
  }
}
