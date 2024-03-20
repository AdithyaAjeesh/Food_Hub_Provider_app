import 'package:flutter/material.dart';
import 'package:flutter_store_app/view/pages/cart/cart.dart';
import 'package:flutter_store_app/view/pages/home_page/home_page.dart';
import 'package:flutter_store_app/view/pages/setting_page/setting_page.dart';
import 'package:flutter_store_app/view/pages/shopping/shopping_page.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    const ShoppingPage(),
    const CartPage(),
    const SettingPage(),
  ];
  navigateTOnextPage(value) {
    currentIndex = value;
    notifyListeners();
  }
}
