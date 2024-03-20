import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/bottom_navbar_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: provider.screens[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        showSelectedLabels: true,
        elevation: 1,
        currentIndex: provider.currentIndex,
        onTap: (value) {
          provider.navigateTOnextPage(value);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
