import 'package:equatable/equatable.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';

abstract class FavoriteMealsEvent extends Equatable {
  const FavoriteMealsEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavoriteMeals extends FavoriteMealsEvent {}

class AddMealToFavorites extends FavoriteMealsEvent {
  final Meal meal;

  const AddMealToFavorites(this.meal);

  @override
  List<Object?> get props => [meal];
}

class RemoveMealFromFavorites extends FavoriteMealsEvent {
  final Meal meal;

  const RemoveMealFromFavorites(this.meal);

  @override
  List<Object?> get props => [meal];
}
