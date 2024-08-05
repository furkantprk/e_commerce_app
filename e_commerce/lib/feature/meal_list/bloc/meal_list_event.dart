import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';

abstract class MealListEvent {}

class FetchMeals extends MealListEvent {
  final String type;
  final String title;

  FetchMeals(this.type, this.title);
}

class SearchMeals extends MealListEvent {
  final String query;

  SearchMeals(this.query);
}

class AddMealToFilter extends MealListEvent {
  final Meal meal;

  AddMealToFilter(this.meal);
}

class RemoveMealFromFilter extends MealListEvent {
  final Meal meal;

  RemoveMealFromFilter(this.meal);
}

class AddAllMealsToFilter extends MealListEvent {
  final List<Meal> meals;

  AddAllMealsToFilter(this.meals);
}
