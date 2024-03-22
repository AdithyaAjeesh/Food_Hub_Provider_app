// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter_store_app/model%20/data/product_model/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductService {
  Future<void> addProduct(ProductModel value) async {
    final biriyaniProductDB = await Hive.openBox<ProductModel>('biriyani');
    biriyaniProductDB.add(value);
  }

  Future<List<ProductModel>> getAllProducts() async {
    final biriyaniProductDB = await Hive.openBox<ProductModel>('biriyani');
    return biriyaniProductDB.values.toList();
  }

  Future<void> deleteProducts(index) async {
    final biriyaniProductDB = await Hive.openBox<ProductModel>('biriyani');
    biriyaniProductDB.deleteAt(index);
    getAllProducts();
  }

  Future<void> editProduct(ProductModel value) async {
    final biriyaniProductDB = await Hive.openBox<ProductModel>('biriyani');
    biriyaniProductDB.put(value.id, value);
    getAllProducts();
  }
}
