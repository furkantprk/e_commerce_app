import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/feature/meal_list/bloc/meal_list_bloc.dart';
import 'package:e_commerce/feature/meal_list/bloc/meal_list_event.dart';
import 'package:e_commerce/feature/meal_list/bloc/meal_list_state.dart';

class FilterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealListBloc, MealListState>(
      builder: (context, state) {
        final meals = state.meals;
        if (meals.isEmpty) {
          return Center(child: Text('No meals available for filtering'));
        }

        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Filter Meals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.select_all),
                    onPressed: () {
                      context
                          .read<MealListBloc>()
                          .add(AddAllMealsToFilter(meals));
                    },
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: meals.map((meal) {
                    return CheckboxListTile(
                      title: Text(meal.strMeal!),
                      value: state.filteredMeals.contains(meal),
                      onChanged: (bool? selected) {
                        if (selected == true) {
                          context
                              .read<MealListBloc>()
                              .add(AddMealToFilter(meal));
                        } else {
                          context
                              .read<MealListBloc>()
                              .add(RemoveMealFromFilter(meal));
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
