import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';

class MealListState {
  final ViewStatus status;
  final List<Meal> meals;
  final List<Meal> filteredMeals;
  final String? errorMessage;

  const MealListState({
    this.status = ViewStatus.initial,
    this.meals = const [],
    this.filteredMeals = const [],
    this.errorMessage,
  });

  MealListState copyWith({
    ViewStatus? status,
    List<Meal>? meals,
    List<Meal>? filteredMeals,
    String? errorMessage,
  }) {
    return MealListState(
      status: status ?? this.status,
      meals: meals ?? this.meals,
      filteredMeals: filteredMeals ?? this.filteredMeals,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
