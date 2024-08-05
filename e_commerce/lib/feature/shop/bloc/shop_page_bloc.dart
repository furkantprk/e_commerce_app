import 'package:e_commerce/feature/shop/meal_details/bloc/meal_details_state.dart';
import 'package:e_commerce/product/database/hive_operations/meals_operations.dart';
import 'package:e_commerce/product/service/operations/meal_service.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/feature/shop/bloc/shop_page_event.dart';
import 'package:e_commerce/feature/shop/bloc/shop_page_state.dart';
import 'package:e_commerce/product/service/manager/meal_manager.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final MealService mealManager = MealService();
  final MealsHiveOperations hiveManager = MealsHiveOperations();

  List<Meal>? _initialSeafoodMeals;
  List<Meal>? _initialCanadianMeals;
  List<Meal>? _initialChickenMeals;
  List<Meal>? _initialTurkishMeals;
  List<Meal>? _initialLambMeals;
  List<Meal>? _initialDessertMeals;

  ShopBloc() : super(const ShopState()) {
    on<FetchMeals>(_onFetchMeals);
    on<SearchMeals>(_onSearchMeals);
  }

  Future<void> _onFetchMeals(FetchMeals event, Emitter<ShopState> emit) async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      _initialSeafoodMeals = hiveManager.getMealsByCategory('Seafood');
      _initialCanadianMeals = hiveManager.getMealsByArea('Canadian');
      _initialChickenMeals = hiveManager.getMealsByIngredient('chicken_breast');
      _initialTurkishMeals = hiveManager.getMealsByArea('Turkish');
      _initialLambMeals = hiveManager.getMealsByIngredient('lamb');
      _initialDessertMeals = hiveManager.getMealsByCategory('Dessert');

      if (_initialSeafoodMeals!.isNotEmpty) {
        emit(state.copyWith(
          status: ViewStatus.loaded,
          seafoodMeals: _initialSeafoodMeals,
          canadianMeals: _initialCanadianMeals,
          chickenMeals: _initialChickenMeals,
          turkishMeals: _initialTurkishMeals,
          lambMeals: _initialLambMeals,
          dessertMeals: _initialDessertMeals,
        ));
      } else {
        await _fetchFromNetwork(emit);
      }
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _fetchFromNetwork(Emitter<ShopState> emit) async {
    try {
      final seafoodMeals =
          (await mealManager.getMealsByCategory('Seafood')).take(7).toList();
      final canadianMeals =
          (await mealManager.getMealsByArea('Canadian')).take(7).toList();
      final chickenMeals =
          (await mealManager.getMealsByIngredient('chicken_breast'))
              .take(7)
              .toList();
      final turkishMeals =
          (await mealManager.getMealsByArea('Turkish')).take(1).toList();
      final lambMeals =
          (await mealManager.getMealsByIngredient('lamb')).take(1).toList();
      final dessertMeals =
          (await mealManager.getMealsByCategory('Dessert')).take(1).toList();

      _initialSeafoodMeals = seafoodMeals;
      _initialCanadianMeals = canadianMeals;
      _initialChickenMeals = chickenMeals;
      _initialTurkishMeals = turkishMeals;
      _initialLambMeals = lambMeals;
      _initialDessertMeals = dessertMeals;

      await hiveManager.addMeals([
        ...seafoodMeals,
        ...canadianMeals,
        ...chickenMeals,
        ...turkishMeals,
        ...lambMeals,
        ...dessertMeals
      ]);

      emit(state.copyWith(
        status: ViewStatus.loaded,
        seafoodMeals: seafoodMeals,
        canadianMeals: canadianMeals,
        chickenMeals: chickenMeals,
        turkishMeals: turkishMeals,
        lambMeals: lambMeals,
        dessertMeals: dessertMeals,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onSearchMeals(SearchMeals event, Emitter<ShopState> emit) {
    final searchQuery = event.query.toLowerCase();

    final filteredSeafoodMeals = _initialSeafoodMeals
        ?.where((meal) =>
            meal.strMeal?.toLowerCase().contains(searchQuery) ?? false)
        .toList();
    final filteredCanadianMeals = _initialCanadianMeals
        ?.where((meal) =>
            meal.strMeal?.toLowerCase().contains(searchQuery) ?? false)
        .toList();
    final filteredChickenMeals = _initialChickenMeals
        ?.where((meal) =>
            meal.strMeal?.toLowerCase().contains(searchQuery) ?? false)
        .toList();
    final filteredTurkishMeals = _initialTurkishMeals
        ?.where((meal) =>
            meal.strMeal?.toLowerCase().contains(searchQuery) ?? false)
        .toList();
    final filteredLambMeals = _initialLambMeals
        ?.where((meal) =>
            meal.strMeal?.toLowerCase().contains(searchQuery) ?? false)
        .toList();
    final filteredDessertMeals = _initialDessertMeals
        ?.where((meal) =>
            meal.strMeal?.toLowerCase().contains(searchQuery) ?? false)
        .toList();

    emit(state.copyWith(
      seafoodMeals: filteredSeafoodMeals,
      canadianMeals: filteredCanadianMeals,
      chickenMeals: filteredChickenMeals,
      turkishMeals: filteredTurkishMeals,
      lambMeals: filteredLambMeals,
      dessertMeals: filteredDessertMeals,
    ));
  }
}
