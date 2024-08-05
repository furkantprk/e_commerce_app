import 'package:e_commerce/feature/cart/bloc/cart_page_event.dart';
import 'package:e_commerce/feature/cart/bloc/cart_page_state.dart';
import 'package:e_commerce/feature/cart/model/cart_model.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/database/hive_operations/cart_operations.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartOperations _hiveManager = CartOperations();

  CartBloc() : super(const CartState()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
    _loadCart();
  }

  Future<void> _loadCart() async {
    final items = _hiveManager.getCartItems();
    emit(state.copyWith(status: ViewStatus.loaded, items: items));
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      final cartItem = CartModel(meal: event.meal, quantity: event.quantity);
      await _hiveManager.addToCart(cartItem);
      final updatedItems = _hiveManager.getCartItems();
      emit(state.copyWith(status: ViewStatus.loaded, items: updatedItems));
    } catch (e) {
      emit(
          state.copyWith(status: ViewStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> _onRemoveFromCart(
      RemoveFromCart event, Emitter<CartState> emit) async {
    try {
      await _hiveManager.removeFromCart(event.meal.idMeal!);
      final updatedItems = _hiveManager.getCartItems();
      emit(state.copyWith(status: ViewStatus.loaded, items: updatedItems));
    } catch (e) {
      emit(
          state.copyWith(status: ViewStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    try {
      await _hiveManager.clearCart();
      emit(state.copyWith(status: ViewStatus.loaded, items: []));
    } catch (e) {
      emit(
          state.copyWith(status: ViewStatus.error, errorMessage: e.toString()));
    }
  }
}
