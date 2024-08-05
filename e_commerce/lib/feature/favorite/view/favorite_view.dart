import 'package:e_commerce/feature/cart/bloc/cart_page_bloc.dart';
import 'package:e_commerce/feature/cart/bloc/cart_page_event.dart';
import 'package:e_commerce/feature/favorite/bloc/favorite_page_bloc.dart';
import 'package:e_commerce/feature/favorite/bloc/favorite_page_event.dart';
import 'package:e_commerce/feature/favorite/bloc/favorite_page_state.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoriteMealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.initialize(context);

    return Scaffold(
      body: BlocBuilder<FavoriteMealsBloc, FavoriteMealsState>(
        builder: (context, state) {
          if (state.status == ViewStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: state.favoriteMeals.length,
            itemBuilder: (context, index) {
              final meal = state.favoriteMeals[index];
              return Card(
                margin: EdgeInsets.all(ScreenSizeHelper.screenWidth * 0.03),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      ScreenSizeHelper.screenWidth * 0.04),
                ),
                elevation: 5.0,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.all(ScreenSizeHelper.screenWidth * 0.04),
                  leading: meal.strMealThumb != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(
                              ScreenSizeHelper.screenWidth * 0.02),
                          child: Image.network(
                            meal.strMealThumb!,
                            width: ScreenSizeHelper.screenWidth * 0.25,
                            height: ScreenSizeHelper.screenWidth * 0.25,
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
                  title: Text(
                    meal.strMeal ?? AppString.noName,
                    style: TextStyle(
                      fontSize: ScreenSizeHelper.screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: ScreenSizeHelper.screenWidth * 0.05,
                    ),
                    onPressed: () {
                      context.push('/meal_details', extra: meal);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(ScreenSizeHelper.screenWidth * 0.04),
        child: ElevatedButton(
          onPressed: () {
            for (var meal
                in context.read<FavoriteMealsBloc>().state.favoriteMeals) {
              context.read<CartBloc>().add(AddToCart(meal, 1));
            }
          },
          child: Text(
            AppString.addAll,
            style: TextStyle(
              fontSize: ScreenSizeHelper.screenWidth / 20,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(ScreenSizeHelper.screenWidth * 0.025),
            ),
            padding: EdgeInsets.symmetric(
                vertical: ScreenSizeHelper.screenHeight * 0.015),
          ),
        ),
      ),
    );
  }
}
