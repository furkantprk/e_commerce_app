import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';

import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';

class MealDetailsState {
  final Meal meal;
  final bool isFavorite;
  final int servingCount;
  final int selectedRating; // Yeni rating alanı
  final ViewStatus status;
  final List<Item> panelItems;

  MealDetailsState({
    required this.meal,
    this.isFavorite = false,
    this.servingCount = 1,
    this.selectedRating = 0, // Varsayılan rating değeri
    this.status = ViewStatus.initial,
    this.panelItems = const [],
  });

  MealDetailsState copyWith({
    Meal? meal,
    bool? isFavorite,
    int? servingCount,
    int? selectedRating,
    ViewStatus? status,
    List<Item>? panelItems,
  }) {
    return MealDetailsState(
      meal: meal ?? this.meal,
      isFavorite: isFavorite ?? this.isFavorite,
      servingCount: servingCount ?? this.servingCount,
      selectedRating: selectedRating ?? this.selectedRating,
      status: status ?? this.status,
      panelItems: panelItems ?? this.panelItems,
    );
  }
}

class Item {
  final String expandedValue;
  final String headerValue;
  final bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  Item copyWith({
    String? expandedValue,
    String? headerValue,
    bool? isExpanded,
  }) {
    return Item(
      expandedValue: expandedValue ?? this.expandedValue,
      headerValue: headerValue ?? this.headerValue,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  @override
  List<Object> get props => [expandedValue, headerValue, isExpanded];
}
