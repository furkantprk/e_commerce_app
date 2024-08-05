import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive_manager/hive_manager.dart';

class RatingsHiveOperations {
  final HiveManager<int> _ratingsManager = HiveManager<int>('ratingsBox');

  int getMealRating(Meal meal) {
    return _ratingsManager.getItem(meal.idMeal!) ?? 0;
  }

  Future<void> setMealRating(Meal meal, int rating) async {
    await _ratingsManager.addItem(meal.idMeal!, rating);
  }
}
