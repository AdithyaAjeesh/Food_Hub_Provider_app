import 'package:hive_flutter/hive_flutter.dart';
part 'biriyani_model.g.dart';
@HiveType(typeId: 1)
class BiriyaniProduct {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String catagory;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String price;
  @HiveField(6)
  final int quantity;

  BiriyaniProduct({
    required this.id,
    required this.name,
    required this.catagory,
    required this.image,
    required this.description,
    required this.price,
    required this.quantity,
  });
}
