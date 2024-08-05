import 'package:equatable/equatable.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class FetchMeals extends ShopEvent {}

class SearchMeals extends ShopEvent {
  final String query;

  const SearchMeals(this.query);

  @override
  List<Object> get props => [query];
}
