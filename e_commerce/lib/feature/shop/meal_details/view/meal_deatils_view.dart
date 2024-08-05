import 'package:e_commerce/feature/cart/bloc/cart_page_bloc.dart';
import 'package:e_commerce/feature/cart/bloc/cart_page_event.dart';
import 'package:e_commerce/feature/favorite/bloc/favorite_page_event.dart';
import 'package:e_commerce/feature/shop/meal_details/bloc/meal_details_bloc.dart';
import 'package:e_commerce/feature/shop/meal_details/bloc/meal_details_event.dart';
import 'package:e_commerce/feature/shop/meal_details/bloc/meal_details_state.dart';
import 'package:e_commerce/feature/shop/meal_details/widget/meal_details_panel.dart';
import 'package:e_commerce/feature/favorite/bloc/favorite_page_bloc.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/router/router.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/int_contants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPage extends StatelessWidget {
  final Meal meal;

  MealDetailsPage({required this.meal});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealDetailsBloc(meal),
      child: BlocListener<MealDetailsBloc, MealDetailsState>(
        listener: (context, state) {
          final favoriteMealsBloc = context.read<FavoriteMealsBloc>();
          if (state.isFavorite) {
            favoriteMealsBloc.add(AddMealToFavorites(state.meal));
          } else {
            favoriteMealsBloc.add(RemoveMealFromFavorites(state.meal));
          }
        },
        child: MealDetailsView(),
      ),
    );
  }
}

class MealDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.initialize(context);
    return Scaffold(
      body: BlocBuilder<MealDetailsBloc, MealDetailsState>(
        builder: (context, state) {
          if (state.status == ViewStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == ViewStatus.error) {
            return Center(child: Text('Failed to load meal details'));
          }

          return SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: ScreenSizeHelper.screenHeight * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          goRouter.pop();
                          AppInt.price = 10;
                        },
                      ),
                      IconButton(
                        icon:
                            Icon(Icons.ios_share_outlined, color: Colors.black),
                        onPressed: () {
                          // Share functionality here
                        },
                      ),
                    ],
                  ),
                  if (state.meal.strMealThumb != null)
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenSizeHelper.screenHeight * 0.01),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          state.meal.strMealThumb!,
                          width: ScreenSizeHelper.screenWidth,
                          height: ScreenSizeHelper.screenHeight / 3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenSizeHelper.screenWidth / 25,
                      top: ScreenSizeHelper.screenHeight * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.meal.strMeal ?? '',
                          style: TextStyle(
                            fontSize: ScreenSizeHelper.screenHeight * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        IconButton(
                          icon: Icon(
                            state.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: state.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            context
                                .read<MealDetailsBloc>()
                                .add(ToggleFavoriteStatus(state.meal));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: ScreenSizeHelper.screenWidth / 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppString.oneServingPrice),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenSizeHelper.screenHeight * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  final currentCount = state.servingCount;
                                  if (currentCount > 1) {
                                    context.read<MealDetailsBloc>().add(
                                        ChangeServingCount(currentCount - 1));
                                  }
                                },
                                child: Icon(Icons.remove),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder()),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenSizeHelper.screenWidth * 0.02),
                                child: Text(
                                  '${state.servingCount}',
                                  style: TextStyle(
                                    fontSize:
                                        ScreenSizeHelper.screenHeight * 0.02,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final currentCount = state.servingCount;
                                  context.read<MealDetailsBloc>().add(
                                      ChangeServingCount(currentCount + 1));
                                },
                                child: Icon(Icons.add),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder()),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: ScreenSizeHelper.screenWidth * 0.05),
                                child: Text(
                                  '\$${AppInt.price * state.servingCount}',
                                  style: TextStyle(
                                    fontSize:
                                        ScreenSizeHelper.screenHeight * 0.02,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: ScreenSizeHelper.screenHeight * 0.02),
                      ],
                    ),
                  ),
                  MealDetailsPanel(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: ScreenSizeHelper.screenHeight * 0.02,
                      left: ScreenSizeHelper.screenWidth / 10,
                      right: ScreenSizeHelper.screenWidth / 10,
                    ),
                    child: SizedBox(
                      height: ScreenSizeHelper.screenHeight * 0.075,
                      child: ElevatedButton(
                        onPressed: () {
                          goRouter.push('/cart');
                          AppInt.price = 10;
                          context
                              .read<CartBloc>()
                              .add(AddToCart(state.meal, state.servingCount));
                        },
                        child: Text(
                          AppString.addToBasket,
                          style: TextStyle(
                            fontSize: ScreenSizeHelper.screenWidth / 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
