import 'dart:convert';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:http/http.dart' as http;

mixin MealManagerMixin<T> {
  Future<T> fetchById(String id, String endpoint,
      T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response =
          await http.get(Uri.parse('${AppString.baseUrl}$endpoint?id=$id'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return fromJson(data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<List<T>> fetchMealList(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response =
          await http.get(Uri.parse('${AppString.baseUrl}$endpoint'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['meals'] as List).map((item) => fromJson(item)).toList();
      } else {
        throw Exception('Failed to load list');
      }
    } catch (e) {
      throw Exception('Error fetching list: $e');
    }
  }

  Future<List<T>> fetchCategoryList(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response =
          await http.get(Uri.parse('${AppString.baseUrl}$endpoint'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['categories'] as List)
            .map((item) => fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load list');
      }
    } catch (e) {
      throw Exception('Error fetching list: $e');
    }
  }

  Future<T> post(String endpoint, Map<String, dynamic> body,
      T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.post(
        Uri.parse('${AppString.baseUrl}$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return fromJson(data);
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      throw Exception('Error posting data: $e');
    }
  }

  Future<T> put(String endpoint, Map<String, dynamic> body,
      T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.put(
        Uri.parse('${AppString.baseUrl}$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return fromJson(data);
      } else {
        throw Exception('Failed to update data');
      }
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }

  Future<void> delete(String endpoint) async {
    try {
      final response =
          await http.delete(Uri.parse('${AppString.baseUrl}$endpoint'));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete data');
      }
    } catch (e) {
      throw Exception('Error deleting data: $e');
    }
  }
}
