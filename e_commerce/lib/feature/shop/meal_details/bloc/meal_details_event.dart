import 'package:e_commerce/feature/shop/meal_details/bloc/meal_details_state.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';

abstract class MealDetailsEvent extends Equatable {
  const MealDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadMealDetails extends MealDetailsEvent {
  final Meal meal;

  const LoadMealDetails(this.meal);

  @override
  List<Object> get props => [meal];
}

class ToggleFavoriteStatus extends MealDetailsEvent {
  final Meal meal;

  const ToggleFavoriteStatus(this.meal);

  @override
  List<Object> get props => [meal];
}

class ChangeServingCount extends MealDetailsEvent {
  final int servingCount;

  const ChangeServingCount(this.servingCount);

  @override
  List<Object> get props => [servingCount];
}

class SelectRating extends MealDetailsEvent {
  final int rating;

  const SelectRating(this.rating);

  @override
  List<Object> get props => [rating];
}

class ChangePanelState extends MealDetailsEvent {
  final List<Item> panelItems;

  const ChangePanelState(this.panelItems);

  @override
  List<Object> get props => [panelItems];
}
