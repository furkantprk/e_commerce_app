import 'package:e_commerce/feature/cart/model/cart_model.dart';
import 'package:e_commerce/product/database/hive_manager/hive_manager.dart';

class CartOperations {
  final HiveManager<CartModel> _cartManager = HiveManager<CartModel>('cartBox');

  Future<void> addToCart(CartModel cartItem) async {
    final existingItem = _cartManager.getItem(cartItem.meal.idMeal);

    if (existingItem != null) {
      existingItem.quantity += cartItem.quantity;
      if (existingItem.quantity < 1) {
        existingItem.quantity = 1;
      }
      await _cartManager.addItem(cartItem.meal.idMeal, existingItem);
    } else {
      await _cartManager.addItem(cartItem.meal.idMeal, cartItem);
    }
  }

  Future<void> removeFromCart(String mealId) async {
    await _cartManager.deleteItem(mealId);
  }

  Future<void> clearCart() async {
    await _cartManager.clearBox();
  }

  List<CartModel> getCartItems() {
    return _cartManager.getAllItems();
  }
}
