import 'package:e_commerce/feature/explore/model/area/area_model.dart';
import 'package:e_commerce/feature/explore/model/category/category_model.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/service/operations/area_service.dart';
import 'package:e_commerce/product/service/operations/category_service.dart';
import 'package:e_commerce/product/service/operations/meal_service.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/feature/explore/bloc/explore_page_event.dart';
import 'package:e_commerce/feature/explore/bloc/explore_page_state.dart';
import 'package:e_commerce/product/service/manager/meal_manager.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final MealService _mealManager = MealService();
  final CategoryService _categoryService = CategoryService();
  final AreaService _areaService = AreaService();

  ExploreBloc() : super(const ExploreState()) {
    on<FetchCategoriesAndAreas>(_onFetchCategoriesAndAreas);
    on<FilterItems>(_onFilterItems);
  }

  Future<void> _onFetchCategoriesAndAreas(
      FetchCategoriesAndAreas event, Emitter<ExploreState> emit) async {
    emit(state.copyWith(status: ViewStatus.loading));
    try {
      final categories = await _categoryService.getCategories();
      final areas = await _areaService.getAreas();
      final imageUrls = await _fetchAllMealImages(categories, areas);

      emit(state.copyWith(
        status: ViewStatus.loaded,
        categories: categories,
        filteredCategories: categories,
        areas: areas,
        filteredAreas: areas,
        imageUrls: imageUrls,
      ));
    } catch (e, stackTrace) {
      // Log the full error and stack trace
      print('Error fetching data: $e');
      print('Stack trace: $stackTrace');

      emit(state.copyWith(
        status: ViewStatus.error,
        errorMessage: 'Error fetching data: $e',
      ));
    }
  }

  void _onFilterItems(FilterItems event, Emitter<ExploreState> emit) {
    final query = event.query.toLowerCase();
    final filteredCategories = state.categories
        .where(
            (category) => category.strCategory!.toLowerCase().contains(query))
        .toList();
    final filteredAreas = state.areas
        .where((area) => area.strArea!.toLowerCase().contains(query))
        .toList();
    emit(state.copyWith(
      filteredCategories: filteredCategories,
      filteredAreas: filteredAreas,
      searchText: query,
    ));
  }

  Future<Map<String, String>> _fetchAllMealImages(
      List<Category> categories, List<Area> areas) async {
    final imageUrls = <String, String>{};

    try {
      final categoryImageUrls =
          await Future.wait(categories.map((category) async {
        try {
          final name = category.strCategory!;
          final imageUrl = await _fetchMealImage(name, 'category');
          return MapEntry(name, imageUrl);
        } catch (e) {
          return MapEntry(category.strCategory!, '');
        }
      }));
      imageUrls.addEntries(categoryImageUrls);
    } catch (e) {
      throw Exception('Error fetching category images');
    }

    try {
      final areaImageUrls = await Future.wait(areas.map((area) async {
        try {
          final name = area.strArea!;
          final imageUrl = await _fetchMealImage(name, 'area');
          return MapEntry(name, imageUrl);
        } catch (e) {
          return MapEntry(area.strArea!, '');
        }
      }));
      imageUrls.addEntries(areaImageUrls);
    } catch (e) {
      throw Exception('Error fetching area images');
    }

    return imageUrls;
  }

  Future<String> _fetchMealImage(String name, String type) async {
    try {
      List<Meal> meals;
      switch (type) {
        case 'category':
          meals = await _mealManager.getMealsByCategory(name);
          return meals.isNotEmpty ? meals.first.strMealThumb ?? '' : '';
        case 'area':
          meals = await _mealManager.getMealsByArea(name);
          return meals.isNotEmpty ? meals.first.strMealThumb ?? '' : '';
        default:
          return '';
      }
    } catch (e) {
      return '';
    }
  }
}
