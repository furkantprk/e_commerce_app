import 'package:equatable/equatable.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';

class FavoriteMealsState extends Equatable {
  final ViewStatus status;
  final List<Meal> favoriteMeals;
  final String? errorMessage;

  const FavoriteMealsState({
    this.status = ViewStatus.initial,
    this.favoriteMeals = const [],
    this.errorMessage,
  });

  FavoriteMealsState copyWith({
    ViewStatus? status,
    List<Meal>? favoriteMeals,
    String? errorMessage,
  }) {
    return FavoriteMealsState(
      status: status ?? this.status,
      favoriteMeals: favoriteMeals ?? this.favoriteMeals,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, favoriteMeals, errorMessage];
}
