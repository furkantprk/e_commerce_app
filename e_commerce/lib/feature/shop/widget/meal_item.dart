import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/router/router.dart';
import 'package:e_commerce/product/utility/constants/int_contants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final double screenWidth;
  final double screenHeight;

  MealItem(this.meal, this.screenWidth, this.screenHeight);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(screenWidth * 0.02),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          meal.strMealThumb != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    meal.strMealThumb!,
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.25,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                  ),
                  child: Center(child: Text(AppString.noImage)),
                ),
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.02,
            right: screenWidth * 0.02,
            child: Text(
              meal.strMeal ?? AppString.noName,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.02,
            left: screenWidth * 0.02,
            child: Text(
              '\$${AppInt.price}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.012,
            right: screenWidth * 0.03,
            child: SizedBox(
              height: screenHeight * 0.04,
              width: screenWidth * 0.08,
              child: ElevatedButton(
                onPressed: () {
                  goRouter.push('/meal_details', extra: meal);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: screenHeight * 0.025,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
