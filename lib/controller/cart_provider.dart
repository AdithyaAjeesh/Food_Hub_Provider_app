import 'package:flutter/material.dart';
import 'package:flutter_store_app/model%20/data/cart_model/cart_model.dart';
import 'package:flutter_store_app/service/cart_function.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> cartitem = [];
  final CartService cartService = CartService();
  Future<void> addToCartProvider(CartItem item) async {
    cartService.addToCart(item);
    notifyListeners();
  }

  Future<void> deleteCartItemProvider(index) async {
    cartService.deleteCartItem(index);
    notifyListeners();
  }

  Future<void> getAllCartItemsProvider() async {
    cartitem = await cartService.getAllCartItems();
    notifyListeners();
  }

  double cartTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartitem) {
      totalPrice += double.parse(cartItem.price);
    }
    return totalPrice;
  }
}
