import 'package:e_commerce/feature/cart/bloc/cart_page_bloc.dart';
import 'package:e_commerce/feature/cart/bloc/cart_page_event.dart';
import 'package:e_commerce/feature/cart/bloc/cart_page_state.dart';
import 'package:e_commerce/feature/cart/widget/checkout_bottom_sheet/checkout_bottom_sheet.dart';
import 'package:e_commerce/feature/cart/widget/unconfirmed/unconfirmed_widget.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/int_contants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.status == ViewStatus.initial) {
            return Center(
              child: Text(AppString.emptyCart),
            );
          }
          if (state.status == ViewStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == ViewStatus.error) {
            return Center(child: Text(AppString.failed));
          } else if (state.status == ViewStatus.loaded) {
            return Padding(
              padding:
                  EdgeInsets.only(top: ScreenSizeHelper.screenHeight * 0.06),
              child: Column(
                children: [
                  Text(
                    AppString.myCart,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenSizeHelper.screenHeight * 0.03,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              height: ScreenSizeHelper.screenHeight * 0.15,
                              child: Stack(
                                children: [
                                  ListTile(
                                    leading: Image.network(
                                        item.meal.strMealThumb ?? ''),
                                    title: Text(item.meal.strMeal ?? ''),
                                    subtitle: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            context
                                                .read<CartBloc>()
                                                .add(AddToCart(item.meal, -1));
                                          },
                                        ),
                                        Text('${item.quantity}'),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            context
                                                .read<CartBloc>()
                                                .add(AddToCart(item.meal, 1));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        context
                                            .read<CartBloc>()
                                            .add(RemoveFromCart(item.meal));
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Text(
                                        '\$${AppInt.price * item.quantity}'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${AppString.total} \$${state.items.fold(0, (sum, item) => sum + (item.quantity * 10)).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSizeHelper.screenHeight / 52,
                          ),
                        ),
                        SizedBox(
                          width: ScreenSizeHelper.screenWidth / 1.5,
                          height: ScreenSizeHelper.screenHeight * 0.08,
                          child: ElevatedButton(
                            onPressed: () {
                              if (state.items.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (context) => ShowAlertDialog(),
                                );
                              } else {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      CheckoutBottomSheet(state: state),
                                );
                              }
                            },
                            child: Text(
                              AppString.goToCheckout,
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
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
