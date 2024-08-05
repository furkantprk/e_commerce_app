import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/feature/shop/widget/meal_item.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealList extends StatelessWidget {
  List<Meal> meals;
  double screenWidth;
  double screenHeight;

  MealList(this.meals, this.screenWidth, this.screenHeight);

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Text(
          AppString.noFood,
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return Container(
      height: screenHeight * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return MealItem(meal, screenWidth, screenHeight);
        },
      ),
    );
  }
}
