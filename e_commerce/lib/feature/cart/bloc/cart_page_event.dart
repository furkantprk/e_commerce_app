import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Meal meal;
  final int quantity;

  AddToCart(this.meal, this.quantity);
}

class RemoveFromCart extends CartEvent {
  final Meal meal;

  RemoveFromCart(this.meal);
}

class ClearCart extends CartEvent {}
