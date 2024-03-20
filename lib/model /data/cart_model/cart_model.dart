import 'package:hive_flutter/hive_flutter.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 4)
class CartItem {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String price;
  @HiveField(4)
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
