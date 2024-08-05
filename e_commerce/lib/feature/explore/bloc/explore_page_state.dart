import 'package:e_commerce/feature/explore/model/area/area_model.dart';
import 'package:e_commerce/feature/explore/model/category/category_model.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';

class ExploreState {
  final ViewStatus status;
  final List<Category> categories;
  final List<Category> filteredCategories;
  final List<Area> areas;
  final List<Area> filteredAreas;
  final String searchText;
  final Map<String, String> imageUrls;
  final String? errorMessage;

  const ExploreState({
    this.status = ViewStatus.initial,
    this.categories = const [],
    this.filteredCategories = const [],
    this.areas = const [],
    this.filteredAreas = const [],
    this.searchText = '',
    this.imageUrls = const {},
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        categories,
        filteredCategories,
        areas,
        filteredAreas,
        searchText,
        imageUrls,
        errorMessage,
      ];

  ExploreState copyWith({
    ViewStatus? status,
    List<Category>? categories,
    List<Category>? filteredCategories,
    List<Area>? areas,
    List<Area>? filteredAreas,
    String? searchText,
    Map<String, String>? imageUrls,
    String? errorMessage,
  }) {
    return ExploreState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      filteredCategories: filteredCategories ?? this.filteredCategories,
      areas: areas ?? this.areas,
      filteredAreas: filteredAreas ?? this.filteredAreas,
      searchText: searchText ?? this.searchText,
      imageUrls: imageUrls ?? this.imageUrls,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
