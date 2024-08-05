import 'package:e_commerce/feature/explore/model/ingredient/ingredient_model.dart';
import 'package:e_commerce/product/service/manager/meal_manager.dart';

class IngredientService with MealManagerMixin<Ingredient> {
  Future<List<Ingredient>> getIngredients() {
    return fetchMealList(
        'list.php?i=list', (data) => Ingredient.fromJson(data));
  }

  Future<Ingredient> createIngredient(Map<String, dynamic> body) {
    return post(
        'create_ingredient.php', body, (data) => Ingredient.fromJson(data));
  }

  Future<Ingredient> updateIngredient(String id, Map<String, dynamic> body) {
    return put('update_ingredient.php?id=$id', body,
        (data) => Ingredient.fromJson(data));
  }

  Future<void> deleteIngredient(String id) {
    return delete('delete_ingredient.php?id=$id');
  }
}
