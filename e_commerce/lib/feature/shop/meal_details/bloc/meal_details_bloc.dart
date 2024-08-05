import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive_operations/favorites_operations.dart';
import 'package:e_commerce/product/database/hive_operations/ratings_operations.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'meal_details_event.dart';
import 'meal_details_state.dart';
import 'package:bloc/bloc.dart';

class MealDetailsBloc extends Bloc<MealDetailsEvent, MealDetailsState> {
  MealDetailsBloc(Meal meal)
      : super(MealDetailsState(
            meal: meal,
            isFavorite: FavoritesHiveOperations().isMealFavorite(meal),
            selectedRating: RatingsHiveOperations().getMealRating(meal),
            panelItems: _generateItems())) {
    on<LoadMealDetails>((event, emit) async {
      emit(state.copyWith(status: ViewStatus.loading));
      try {
        emit(state.copyWith(meal: event.meal, status: ViewStatus.loaded));
      } catch (error) {
        emit(state.copyWith(status: ViewStatus.error));
      }
    });

    on<ToggleFavoriteStatus>((event, emit) async {
      emit(state.copyWith(status: ViewStatus.loading));
      try {
        FavoritesHiveOperations().toggleMealFavoriteStatus(state.meal);
        final updatedIsFavorite =
            FavoritesHiveOperations().isMealFavorite(state.meal);
        emit(state.copyWith(
            isFavorite: updatedIsFavorite, status: ViewStatus.loaded));
      } catch (error) {
        emit(state.copyWith(status: ViewStatus.error));
      }
    });

    on<ChangeServingCount>((event, emit) async {
      emit(state.copyWith(status: ViewStatus.loading));
      try {
        emit(state.copyWith(
            servingCount: event.servingCount, status: ViewStatus.loaded));
      } catch (error) {
        emit(state.copyWith(status: ViewStatus.error));
      }
    });

    on<SelectRating>((event, emit) async {
      emit(state.copyWith(status: ViewStatus.loading));
      try {
        RatingsHiveOperations().setMealRating(state.meal, event.rating);
        emit(state.copyWith(
            selectedRating: event.rating, status: ViewStatus.loaded));
      } catch (error) {
        emit(state.copyWith(status: ViewStatus.error));
      }
    });

    on<ChangePanelState>((event, emit) async {
      emit(state.copyWith(status: ViewStatus.loading));
      try {
        emit(state.copyWith(
            panelItems: event.panelItems, status: ViewStatus.loaded));
      } catch (error) {
        emit(state.copyWith(status: ViewStatus.error));
      }
    });
  }

  static List<Item> _generateItems() {
    return List<Item>.generate(3, (int index) {
      switch (index) {
        case 0:
          return Item(
              headerValue: 'Ingredients',
              expandedValue: 'List of ingredients here');
        case 1:
          return Item(
              headerValue: 'Nutrition',
              expandedValue: 'Nutrition details here');
        case 2:
          return Item(headerValue: 'Review', expandedValue: 'Reviews here');
        default:
          return Item(
              headerValue: 'Item $index',
              expandedValue: 'Details for Item $index');
      }
    });
  }
}
