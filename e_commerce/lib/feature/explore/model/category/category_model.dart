import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Category {
  @HiveField(0)
  final String? idCategory;

  @HiveField(1)
  final String? strCategory;

  @HiveField(2)
  final String? strCategoryThumb;

  @HiveField(3)
  final String? strCategoryDescription;

  Category({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
