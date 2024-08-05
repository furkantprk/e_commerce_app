import 'package:e_commerce/feature/explore/model/area/area_model.dart';
import 'package:e_commerce/product/service/manager/meal_manager.dart';

class AreaService with MealManagerMixin<Area> {
  Future<List<Area>> getAreas() {
    return fetchMealList('list.php?a=list', (data) => Area.fromJson(data));
  }

  Future<Area> createArea(Map<String, dynamic> body) {
    return post('create_area.php', body, (data) => Area.fromJson(data));
  }

  Future<Area> updateArea(String id, Map<String, dynamic> body) {
    return put('update_area.php?id=$id', body, (data) => Area.fromJson(data));
  }

  Future<void> deleteArea(String id) {
    return delete('delete_area.php?id=$id');
  }
}
