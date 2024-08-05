import 'package:e_commerce/feature/favorite/bloc/favorite_page_event.dart';
import 'package:e_commerce/feature/favorite/bloc/favorite_page_state.dart';
import 'package:e_commerce/product/database/hive_operations/favorites_operations.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';

class FavoriteMealsBloc extends Bloc<FavoriteMealsEvent, FavoriteMealsState> {
  final FavoritesHiveOperations _favoriteMealsHiveOperations =
      FavoritesHiveOperations();

  FavoriteMealsBloc() : super(const FavoriteMealsState()) {
    _loadFavoriteMeals();
    on<LoadFavoriteMeals>(_onLoadFavoriteMeals);
    on<AddMealToFavorites>(_onAddMealToFavorites);
    on<RemoveMealFromFavorites>(_onRemoveMealFromFavorites);
  }
  void _loadFavoriteMeals() async {
    try {
      emit(state.copyWith(status: ViewStatus.loading));
      final meals = _favoriteMealsHiveOperations.getAllFavoriteMeals();
      emit(state.copyWith(status: ViewStatus.loaded, favoriteMeals: meals));
    } catch (e) {
      emit(
          state.copyWith(status: ViewStatus.error, errorMessage: e.toString()));
    }
  }

  void _onLoadFavoriteMeals(
      LoadFavoriteMeals event, Emitter<FavoriteMealsState> emit) async {
    _loadFavoriteMeals(); // Handle the event to load favorite meals
  }

  void _onAddMealToFavorites(
      AddMealToFavorites event, Emitter<FavoriteMealsState> emit) async {
    try {
      await _favoriteMealsHiveOperations.addMealToFavorites(event.meal);
      final updatedList = _favoriteMealsHiveOperations.getAllFavoriteMeals();
      emit(state.copyWith(favoriteMeals: updatedList));
    } catch (e) {
      emit(
          state.copyWith(status: ViewStatus.error, errorMessage: e.toString()));
    }
  }

  void _onRemoveMealFromFavorites(
      RemoveMealFromFavorites event, Emitter<FavoriteMealsState> emit) async {
    try {
      await _favoriteMealsHiveOperations.removeMealFromFavorites(event.meal);
      final updatedList = _favoriteMealsHiveOperations.getAllFavoriteMeals();
      emit(state.copyWith(favoriteMeals: updatedList));
    } catch (e) {
      emit(
          state.copyWith(status: ViewStatus.error, errorMessage: e.toString()));
    }
  }
}
