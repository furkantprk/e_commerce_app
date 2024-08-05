import 'package:equatable/equatable.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class FetchCategoriesAndAreas extends ExploreEvent {}

class FilterItems extends ExploreEvent {
  final String query;

  const FilterItems(this.query);

  @override
  List<Object> get props => [query];
}

class FetchMealImage extends ExploreEvent {
  final String name;
  final String type;

  const FetchMealImage(this.name, this.type);

  @override
  List<Object> get props => [name, type];
}
