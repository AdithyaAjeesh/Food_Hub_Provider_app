// ignore_for_file: await_only_futures

import 'package:flutter_store_app/model%20/data/product_model/product_model.dart';
import 'package:flutter_store_app/model%20/data/cart_model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> deleteAllData() async {
  await Hive.box<ProductModel>('biriyani').clear();
  await Hive.box<CartItem>('cart').clear();
}
