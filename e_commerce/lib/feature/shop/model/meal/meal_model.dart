import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Meal {
  @HiveField(0)
  final String? idMeal;

  @HiveField(1)
  final String? strMeal;

  @HiveField(2)
  final String? strDrinkAlternate;

  @HiveField(3)
  final String? strCategory;

  @HiveField(4)
  final String? strArea;

  @HiveField(5)
  final String? strInstructions;

  @HiveField(6)
  final String? strMealThumb;

  @HiveField(7)
  final String? strTags;

  @HiveField(8)
  final String? strYoutube;

  @HiveField(9)
  final String? strSource;

  @HiveField(10)
  final String? strImageSource;

  @HiveField(11)
  final List<String>? ingredients;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strSource,
    required this.strImageSource,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }

    return Meal(
      idMeal: json['idMeal'] as String?,
      strMeal: json['strMeal'] as String?,
      strDrinkAlternate: json['strDrinkAlternate'] as String?,
      strCategory: json['strCategory'] as String?,
      strArea: json['strArea'] as String?,
      strInstructions: json['strInstructions'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
      strTags: json['strTags'] as String?,
      strYoutube: json['strYoutube'] as String?,
      strSource: json['strSource'] as String?,
      strImageSource: json['strImageSource'] as String?,
      ingredients: ingredients,
    );
  }

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
