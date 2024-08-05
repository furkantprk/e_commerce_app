import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'area_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Area {
  @HiveField(0)
  final String? strArea;

  Area({required this.strArea});

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  Map<String, dynamic> toJson() => _$AreaToJson(this);
}
