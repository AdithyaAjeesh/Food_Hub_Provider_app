import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/product_model/product_model.dart';
import 'package:flutter_store_app/service/product_functions.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> product = [];

  final ProductService productService = ProductService();
  Future<void> addProductProvider(ProductModel value) async {
    await productService.addProduct(value);
    await getAllProductsProvider();
  }

  Future<void> deleteProductsProvider(index) async {
    await productService.deleteProducts(index);
    await getAllProductsProvider();
  }

  Future<void> getAllProductsProvider() async {
    product = await productService.getAllProducts();
    notifyListeners();
  }

  Future<void> editFoodProvider(ProductModel value) async {
    await productService.editProduct(value);
    notifyListeners();
    await getAllProductsProvider();
  }

  void filteredSearch(List<ProductModel> value) async {
    product = value;
    notifyListeners();
  }

  double productTotalPrice() {
    double total = 0;
    for (var item in product) {
      total += double.parse(item.price);
    }
    return total;
  }

  double productTotalCount() {
    double count = 0;
    for (var item in product) {
      count += item.quantity;
    }
    return count;
  }
}
