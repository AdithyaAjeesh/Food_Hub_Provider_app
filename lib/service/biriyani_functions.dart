// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BiriyaniService {
  Future<void> addBiriyaniProduct(BiriyaniProduct value) async {
    final biriyaniProductDB = await Hive.openBox<BiriyaniProduct>('biriyani');
    biriyaniProductDB.add(value);
  }

  Future<List<BiriyaniProduct>> getAllBiriyaniProducts() async {
    final biriyaniProductDB = await Hive.openBox<BiriyaniProduct>('biriyani');
    return biriyaniProductDB.values.toList();
  }

  Future<void> deleteBiriyaniProducts(index) async {
    final biriyaniProductDB = await Hive.openBox<BiriyaniProduct>('biriyani');
    biriyaniProductDB.deleteAt(index);
    getAllBiriyaniProducts();
  }

  Future<void> editProduct(BiriyaniProduct value) async {
    final biriyaniProductDB = await Hive.openBox<BiriyaniProduct>('biriyani');
    biriyaniProductDB.put(value.id, value);
    getAllBiriyaniProducts();
  }
}
