import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/product_model/product_model.dart';
import 'package:flutter_store_app/service/admin_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductPageProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final catagoryController = TextEditingController();
  final disceriptionController = TextEditingController();
  final priceController = TextEditingController();
  File? image;
  String dropdownvalue = 'biriyani';
  var items = ['biriyani', 'burger', 'softdrink'];

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return;
    } else {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> addProduct(BuildContext context) async {
    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final description = disceriptionController.text.trim();

    if (name.isEmpty || price.isEmpty || description.isEmpty || image == null) {
      return;
    }

    final provider = Provider.of<ProductProvider>(context, listen: false);

    final product = ProductModel(
      id: 1,
      name: name,
      image: image!.path,
      description: description,
      price: price,
      quantity: 1,
      catagory: dropdownvalue,
    );
    provider.addProductProvider(product);
    notifyListeners();

    Navigator.of(context).pop();
  }

  deleteAllDataProvider() {
    deleteAllData();
    notifyListeners();
  }
}
