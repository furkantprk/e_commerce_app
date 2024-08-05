import 'package:e_commerce/feature/cart/model/cart_model.dart';
import 'package:e_commerce/feature/shop/model/meal/meal_model.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';

class CartState {
  final ViewStatus status;
  final List<CartModel> items;
  final String? errorMessage;

  const CartState({
    this.status = ViewStatus.initial,
    this.items = const [],
    this.errorMessage,
  });

  CartState copyWith({
    ViewStatus? status,
    List<CartModel>? items,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
