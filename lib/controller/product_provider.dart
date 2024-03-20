import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:flutter_store_app/service/biriyani_functions.dart';

class ProductProvider extends ChangeNotifier {
  List<BiriyaniProduct> biriyani = [];

  final BiriyaniService biriyaniService = BiriyaniService();
  Future<void> addBiriyaniProductProvider(BiriyaniProduct value) async {
    await biriyaniService.addBiriyaniProduct(value);
    await getAllBiriyaniProductsProvider();
  }

  Future<void> deleteBiriyaniProductsProvider(index) async {
    await biriyaniService.deleteBiriyaniProducts(index);
    await getAllBiriyaniProductsProvider();
  }

  Future<void> getAllBiriyaniProductsProvider() async {
    biriyani = await biriyaniService.getAllBiriyaniProducts();
    notifyListeners();
  }

  Future<void> editFoodProvider( BiriyaniProduct value) async {
    await biriyaniService.editProduct( value);
    notifyListeners();
    await getAllBiriyaniProductsProvider();
  }

  double biriyaniTotalPrice() {
    double total = 0;
    for (var item in biriyani) {
      total += double.parse(item.price);
    }
    return total;
  }

  double biriyaniTotalCount() {
    double count = 0;
    for (var item in biriyani) {
      count += item.quantity;
    }
    return count;
  }
}
