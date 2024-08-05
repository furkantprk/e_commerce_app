import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/feature/cart/model/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInitialize {
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MealAdapter());
    Hive.registerAdapter(CartModelAdapter());
    await Hive.openBox<Meal>('meals');
    await Hive.openBox<Meal>('favoriteMealsBox');
    await Hive.openBox<bool>('favoritesBox');
    await Hive.openBox<int>('ratingsBox');
    await Hive.openBox<CartModel>('cartBox');
  }
}
