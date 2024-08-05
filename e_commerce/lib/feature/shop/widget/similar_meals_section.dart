import 'package:e_commerce/feature/shop/bloc/shop_page_state.dart';
import 'package:e_commerce/feature/shop/widget/category_container.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';

class SimilarMealsSection extends StatelessWidget {
  ShopState state;
  double screenWidth;
  double screenHeight;

  SimilarMealsSection(this.state, this.screenWidth, this.screenHeight);

  @override
  Widget build(BuildContext context) {
    {
      bool hasMeals = state.turkishMeals!.isNotEmpty ||
          state.lambMeals!.isNotEmpty ||
          state.dessertMeals!.isNotEmpty;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Text(
              AppString.similarFoods,
              style: TextStyle(
                  fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
            ),
          ),
          hasMeals
              ? Container(
                  height: screenHeight * 0.2,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      if (state.turkishMeals!.isNotEmpty)
                        CategoryContainer(
                            AppString.turkishFood,
                            AppString.area,
                            screenWidth,
                            screenHeight,
                            state.turkishMeals!.first.strMealThumb!),
                      if (state.lambMeals!.isNotEmpty)
                        CategoryContainer(
                            AppString.lamb,
                            'ingredient',
                            screenWidth,
                            screenHeight,
                            state.lambMeals!.first.strMealThumb!),
                      if (state.dessertMeals!.isNotEmpty)
                        CategoryContainer(
                            AppString.desserts,
                            AppString.category,
                            screenWidth,
                            screenHeight,
                            state.dessertMeals!.first.strMealThumb!),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Text(AppString.noFood),
                ),
        ],
      );
    }
  }
}
