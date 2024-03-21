import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/add_product_provider.dart';
import 'package:flutter_store_app/view/pages/shopping/chart.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<AddProductPageProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Products'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChartPage(),
                ),
              );
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextField(
                controller: provider.nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter product name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: provider.priceController,
                decoration: const InputDecoration(
                  hintText: 'Enter product Price',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: provider.disceriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter product Discription',
                ),
              ),
              const SizedBox(height: 20),
              Consumer<AddProductPageProvider>(
                  builder: (context, providers, child) {
                return DropdownButton(
                  value: providers.dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: provider.items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    provider.dropdownvalue = newValue!;
                  },
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                        border: const Border(
                            bottom: BorderSide(style: BorderStyle.solid))),
                    height: 1,
                  ),
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  provider.pickImageFromGallery();
                },
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  provider.addProduct(context);
                },
                child: const Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
