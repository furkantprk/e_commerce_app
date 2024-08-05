import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/feature/shop/widget/meal_list.dart';
import 'package:e_commerce/product/router/router.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategorySection extends StatelessWidget {
  final String type;
  final String title;
  final String titleForUsers;
  final List<Meal> meals;
  final double screenWidth;
  final double screenHeight;

  CategorySection(this.type, this.title, this.titleForUsers, this.meals,
      this.screenWidth, this.screenHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleForUsers,
                style: TextStyle(
                    fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the MealListPage
                  goRouter.push(
                    '/meal_list',
                    extra: {'type': type, 'title': title},
                  );
                },
                child: Text(
                  AppString.seeAll,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        MealList(meals, screenWidth, screenHeight),
      ],
    );
  }
}
