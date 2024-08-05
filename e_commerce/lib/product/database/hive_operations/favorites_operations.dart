import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive_manager/hive_manager.dart';

class FavoritesHiveOperations {
  final HiveManager<Meal> _favoriteMealsManager =
      HiveManager<Meal>('favoriteMealsBox');
  final HiveManager<bool> _favoritesManager = HiveManager<bool>('favoritesBox');

  bool isMealFavorite(Meal meal) {
    return _favoritesManager.getItem(meal.idMeal!) ?? false;
  }

  Future<void> toggleMealFavoriteStatus(Meal meal) async {
    final currentStatus = isMealFavorite(meal);
    await _favoritesManager.addItem(meal.idMeal!, !currentStatus);
    if (currentStatus) {
      await _favoriteMealsManager.deleteItem(meal.idMeal!);
    } else {
      await _favoriteMealsManager.addItem(meal.idMeal!, meal);
    }
  }

  Future<void> addMealToFavorites(Meal meal) async {
    await _favoriteMealsManager.addItem(meal.idMeal!, meal);
  }

  Future<void> removeMealFromFavorites(Meal meal) async {
    await _favoriteMealsManager.deleteItem(meal.idMeal!);
    await _favoritesManager.deleteItem(meal.idMeal!);
  }

  List<Meal> getAllFavoriteMeals() {
    return _favoriteMealsManager.getAllItems();
  }
}
