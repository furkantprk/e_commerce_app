import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:equatable/equatable.dart';

class ShopState extends Equatable {
  final ViewStatus status;
  final List<Meal>? seafoodMeals;
  final List<Meal>? canadianMeals;
  final List<Meal>? chickenMeals;
  final List<Meal>? turkishMeals;
  final List<Meal>? lambMeals;
  final List<Meal>? dessertMeals;
  final String? errorMessage;

  const ShopState({
    this.status = ViewStatus.initial,
    this.seafoodMeals,
    this.canadianMeals,
    this.chickenMeals,
    this.turkishMeals,
    this.lambMeals,
    this.dessertMeals,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        seafoodMeals,
        canadianMeals,
        chickenMeals,
        turkishMeals,
        lambMeals,
        dessertMeals,
        errorMessage,
      ];

  ShopState copyWith({
    ViewStatus? status,
    List<Meal>? seafoodMeals,
    List<Meal>? canadianMeals,
    List<Meal>? chickenMeals,
    List<Meal>? turkishMeals,
    List<Meal>? lambMeals,
    List<Meal>? dessertMeals,
    String? errorMessage,
  }) {
    return ShopState(
      status: status ?? this.status,
      seafoodMeals: seafoodMeals ?? this.seafoodMeals,
      canadianMeals: canadianMeals ?? this.canadianMeals,
      chickenMeals: chickenMeals ?? this.chickenMeals,
      turkishMeals: turkishMeals ?? this.turkishMeals,
      lambMeals: lambMeals ?? this.lambMeals,
      dessertMeals: dessertMeals ?? this.dessertMeals,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
