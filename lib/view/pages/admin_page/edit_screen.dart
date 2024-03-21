import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/product_provider.dart';
import 'package:flutter_store_app/model%20/data/biriyani_model/biriyani_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  final String catogery;
  final String disceription;

  const EditScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.catogery,
    required this.disceription,
  });

  @override
  State<EditScreen> createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  File? _selectImage;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    priceController = TextEditingController(text: widget.price);
    _selectImage = widget.image.isNotEmpty ? File(widget.image) : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Center(
          child: Text(
            "Edit Product",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundImage: _selectImage != null
                          ? FileImage(_selectImage!)
                          : const AssetImage("assets/images/default_image.jpg")
                              as ImageProvider,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _pickImgGallery,
                    child: const Text('select Image'),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      updateAll();
                    },
                    child: const Text('Update Product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateAll() async {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    final newName = nameController.text.trim();
    final newPrice = priceController.text.trim();
    final newImagePath =
        _selectImage != null ? _selectImage!.path : widget.image;
    if (newName.isEmpty || newPrice.isEmpty || newImagePath.isEmpty) {
      return;
    }
    final update = BiriyaniProduct(
      id: 1,
      name: newName,
      catagory: '',
      image: newImagePath,
      description: '',
      price: newPrice,
      quantity: 1,
    );
    provider.editFoodProvider(update);
    Navigator.pop(context);
  }

  Future<void> _pickImgGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      _selectImage = File(returnImage.path);
    });
  }
}
