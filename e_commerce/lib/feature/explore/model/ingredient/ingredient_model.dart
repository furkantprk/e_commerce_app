import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'ingredient_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Ingredient {
  @HiveField(0)
  final String? idIngredient;

  @HiveField(1)
  final String? strIngredient;

  @HiveField(2)
  final String? strDescription;

  Ingredient({
    required this.idIngredient,
    required this.strIngredient,
    required this.strDescription,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
