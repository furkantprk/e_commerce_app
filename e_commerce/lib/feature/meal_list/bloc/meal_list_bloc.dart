import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/service/operations/meal_service.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:e_commerce/product/service/manager/meal_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'meal_list_event.dart';
import 'meal_list_state.dart';

class MealListBloc extends Bloc<MealListEvent, MealListState> {
  final MealService mealManager = MealService();

  MealListBloc() : super(const MealListState()) {
    on<FetchMeals>(_onFetchMeals);
    on<SearchMeals>(_onSearchMeals);
    on<AddMealToFilter>(_onAddMealToFilter);
    on<RemoveMealFromFilter>(_onRemoveMealFromFilter);
    on<AddAllMealsToFilter>(_onAddAllMealsToFilter);
  }

  void _onFetchMeals(FetchMeals event, Emitter<MealListState> emit) async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      List<Meal> meals = [];
      if (event.type == 'category') {
        meals = await mealManager.getMealsByCategory(event.title);
      } else if (event.type == 'area') {
        meals = await mealManager.getMealsByArea(event.title);
      } else if (event.type == 'ingredient') {
        meals = await mealManager.getMealsByIngredient(event.title);
      } else {
        throw Exception('Invalid type');
      }

      if (meals.isEmpty) {
        throw Exception('No meals found');
      }

      emit(state.copyWith(
        status: ViewStatus.loaded,
        meals: meals,
        filteredMeals: List<Meal>.from(meals),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: 'Error fetching meals: $e',
      ));
    }
  }

  void _onSearchMeals(SearchMeals event, Emitter<MealListState> emit) {
    try {
      final filteredMeals = state.meals
          .where((meal) =>
              meal.strMeal!.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(state.copyWith(filteredMeals: filteredMeals));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: 'Error searching meals: $e',
      ));
    }
  }

  void _onAddMealToFilter(AddMealToFilter event, Emitter<MealListState> emit) {
    try {
      final filteredMeals = List<Meal>.from(state.filteredMeals);
      if (!filteredMeals.contains(event.meal)) {
        filteredMeals.add(event.meal);
      }
      emit(state.copyWith(filteredMeals: filteredMeals));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: 'Error adding meal to filter: $e',
      ));
    }
  }

  void _onRemoveMealFromFilter(
      RemoveMealFromFilter event, Emitter<MealListState> emit) {
    try {
      final filteredMeals = List<Meal>.from(state.filteredMeals);
      filteredMeals.remove(event.meal);
      emit(state.copyWith(filteredMeals: filteredMeals));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: 'Error removing meal from filter: $e',
      ));
    }
  }

  void _onAddAllMealsToFilter(
      AddAllMealsToFilter event, Emitter<MealListState> emit) {
    try {
      emit(state.copyWith(filteredMeals: List<Meal>.from(event.meals)));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: 'Error adding all meals to filter: $e',
      ));
    }
  }
}
