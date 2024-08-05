import 'package:e_commerce/feature/explore/model/category/category_model.dart';
import 'package:e_commerce/product/service/manager/meal_manager.dart';

class CategoryService with MealManagerMixin<Category> {
  Future<List<Category>> getCategories() {
    return fetchCategoryList(
        'categories.php', (data) => Category.fromJson(data));
  }

  Future<Category> createCategory(Map<String, dynamic> body) {
    return post('create_category.php', body, (data) => Category.fromJson(data));
  }

  Future<Category> updateCategory(String id, Map<String, dynamic> body) {
    return put(
        'update_category.php?id=$id', body, (data) => Category.fromJson(data));
  }

  Future<void> deleteCategory(String id) {
    return delete('delete_category.php?id=$id');
  }
}
