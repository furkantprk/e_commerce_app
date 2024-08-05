import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/service/manager/meal_manager.dart';

class MealService with MealManagerMixin<Meal> {
  Future<Meal> getMealDetails(String id) {
    return fetchById(
        id, 'lookup.php?i=', (data) => Meal.fromJson(data['meals'][0]));
  }

  Future<List<Meal>> getMealsByCategory(String category) {
    return fetchMealList(
        'filter.php?c=$category', (data) => Meal.fromJson(data));
  }

  Future<List<Meal>> getMealsByArea(String area) {
    return fetchMealList('filter.php?a=$area', (data) => Meal.fromJson(data));
  }

  Future<List<Meal>> getMealsByIngredient(String ingredient) {
    return fetchMealList(
        'filter.php?i=$ingredient', (data) => Meal.fromJson(data));
  }

  Future<Meal> createMeal(Map<String, dynamic> body) {
    return post('create_meal.php', body, (data) => Meal.fromJson(data));
  }

  Future<Meal> updateMeal(String id, Map<String, dynamic> body) {
    return put('update_meal.php?id=$id', body, (data) => Meal.fromJson(data));
  }

  Future<void> deleteMeal(String id) {
    return delete('delete_meal.php?id=$id');
  }
}
