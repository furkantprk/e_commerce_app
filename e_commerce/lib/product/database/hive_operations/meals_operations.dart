import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/feature/cart/model/cart_model.dart';
import 'package:e_commerce/product/database/hive_manager/hive_manager.dart';

// MealsHiveOperations Class
class MealsHiveOperations {
  final HiveManager<Meal> _mealManager = HiveManager<Meal>('meals');

  Future<void> addMeals(List<Meal> meals) async {
    for (var meal in meals) {
      await _mealManager.addItem(meal.idMeal!, meal);
    }
  }

  List<Meal> getMealsByCategory(String category) {
    return _mealManager
        .getAllItems()
        .where((meal) => meal.strCategory == category)
        .toList();
  }

  List<Meal> getMealsByArea(String area) {
    return _mealManager
        .getAllItems()
        .where((meal) => meal.strArea == area)
        .toList();
  }

  List<Meal> getMealsByIngredient(String ingredient) {
    return _mealManager
        .getAllItems()
        .where((meal) => meal.strMeal?.contains(ingredient) ?? false)
        .toList();
  }

  List<Meal> getAllMeals() {
    return _mealManager.getAllItems();
  }

  Future<void> clearAllMeals() async {
    await _mealManager.clearBox();
  }
}
