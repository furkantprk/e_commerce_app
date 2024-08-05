import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce/feature/cart/bloc/cart_page_bloc.dart';
import 'package:e_commerce/feature/explore/bloc/explore_page_bloc.dart';
import 'package:e_commerce/feature/favorite/bloc/favorite_page_bloc.dart';
import 'package:e_commerce/feature/meal_list/bloc/meal_list_bloc.dart';
import 'package:e_commerce/feature/shop/bloc/shop_page_bloc.dart';
import 'package:e_commerce/feature/cart/widget/bottom_nav_bar/view_model/bottom_nav_bar_view_model.dart';
import 'package:e_commerce/feature/onboarding/view_model/onbording_view_model.dart';
import 'package:e_commerce/feature/splash/view_model/splash_view_model.dart';

class BlocProviders extends StatelessWidget {
  final Widget child;

  const BlocProviders({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopBloc>(create: (context) => ShopBloc()),
        BlocProvider<ExploreBloc>(create: (context) => ExploreBloc()),
        BlocProvider<MealListBloc>(create: (context) => MealListBloc()),
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
        BlocProvider<FavoriteMealsBloc>(
            create: (context) => FavoriteMealsBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomNavBarViewModel()),
          ChangeNotifierProvider(create: (context) => SplashViewModel()),
          ChangeNotifierProvider(create: (context) => OnbordingViewModel()),
        ],
        child: child,
      ),
    );
  }
}
