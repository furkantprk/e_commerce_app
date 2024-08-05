import 'package:e_commerce/feature/account/view/account_view.dart';
import 'package:e_commerce/feature/cart/view/cart_view.dart';
import 'package:e_commerce/feature/cart/widget/bottom_nav_bar/view/bottom_nav_bar.dart';
import 'package:e_commerce/feature/shop/meal_details/view/meal_deatils_view.dart';
import 'package:e_commerce/feature/explore/view/explore_view.dart';
import 'package:e_commerce/feature/favorite/view/favorite_view.dart';
import 'package:e_commerce/feature/meal_list/view/meal_list_view.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/feature/onboarding/view/onboarding_view.dart';
import 'package:e_commerce/feature/shop/view/shop_view.dart';
import 'package:e_commerce/feature/splash/view/splash_view.dart';
import 'package:e_commerce/feature/cart/widget/order_confrimation/order_confrimation_widget.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashScreen()),
    ),
    GoRoute(
      path: '/onbording',
      name: 'onbording',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: OnbordingScreen()),
    ),
    GoRoute(
      path: '/meal_details',
      name: 'meal_details',
      pageBuilder: (context, state) {
        final meal = state.extra as Meal;
        return NoTransitionPage(child: MealDetailsPage(meal: meal));
      },
    ),
    GoRoute(
      path: '/meal_list',
      name: 'meal_list',
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final type = extra['type'] as String;
        final title = extra['title'] as String;
        return NoTransitionPage(
          child: MealListPage(type, title),
        );
      },
    ),
    GoRoute(
      path: '/order_confirm',
      name: 'order_confirm',
      pageBuilder: (context, state) =>
          NoTransitionPage(child: OrderConfirmationPage()),
    ),
    ShellRoute(
      builder: (context, state, child) => BottomNavBar(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => NoTransitionPage(
              child: BottomNavBar(
            child: ShopPage(), // Default page
          )),
        ),
        GoRoute(
          path: '/shop',
          name: 'shop',
          pageBuilder: (context, state) => NoTransitionPage(child: ShopPage()),
        ),
        GoRoute(
          path: '/explore',
          name: 'explore',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ExplorePage()),
        ),
        GoRoute(
          path: '/cart',
          name: 'cart',
          pageBuilder: (context, state) => NoTransitionPage(child: CartPage()),
        ),
        GoRoute(
          path: '/favorite',
          name: 'favorite',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: FavoriteMealsPage()),
        ),
        GoRoute(
          path: '/account',
          name: 'account',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: AccountPage()),
        ),
      ],
    ),
  ],
);
