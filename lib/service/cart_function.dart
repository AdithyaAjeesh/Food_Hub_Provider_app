// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter_store_app/model%20/data/cart_model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartService {
  void addToCart(CartItem item) async {
    final cartBox = await Hive.openBox<CartItem>('cart');
    cartBox.add(item);
  }

  Future<List<CartItem>> getAllCartItems() async {
    final cartBox = await Hive.openBox<CartItem>('cart');
    return cartBox.values.toList();
  }

  Future<void> deleteCartItem(int index) async {
    final cartBox = await Hive.openBox<CartItem>('cart');
    await cartBox.deleteAt(index);
    getAllCartItems();
  }
}
