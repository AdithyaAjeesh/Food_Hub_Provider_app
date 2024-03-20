import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/add_product_provider.dart';
import 'package:flutter_store_app/view/pages/admin_page/add_product_page.dart';
import 'package:flutter_store_app/view/pages/admin_page/edit_product_page.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddProductPageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddProduct()));
            },
            child: Container(
              width: double.infinity,
              height: 80,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 205, 174),
              ),
              child: const Text(
                'Add Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Warning'),
                    content: const Text(
                      'Do You want to permently delete all of the apps data',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // deleteAllData();
                          provider.deleteAllDataProvider();
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              height: 80,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 205, 174),
              ),
              child: const Text(
                'Delete All Data',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const EditProductPage(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 80,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 205, 174),
              ),
              child: const Text(
                'Edit Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
