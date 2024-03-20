import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/cart_model/cart_model.dart';
import 'package:flutter_store_app/service/cart_function.dart';

class CartProvider extends ChangeNotifier {
  addToCartProvider(CartItem item) {
    addToCart(item);
    notifyListeners();
  }

  deleteCartItemProvider(index) {
    deleteCartItem(index);
    notifyListeners();
  }

  getAllCartItemsProvider() {
    getAllCartItems();
  }

  double cartTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItemListNotifier.value) {
      totalPrice += double.parse(cartItem.price);
    }
    return totalPrice;
  }
}
