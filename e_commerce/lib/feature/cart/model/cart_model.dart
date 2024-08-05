import 'package:hive/hive.dart';

import '../../shop/model/meal/meal_model.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 4)
class CartModel {
  @HiveField(0)
  final meal;

  @HiveField(1)
  int quantity;

  CartModel({required this.meal, required this.quantity});
}
