import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/router/router.dart';
import 'package:e_commerce/feature/cart/widget/unconfirmed/unconfirmed_widget.dart';
import 'package:e_commerce/feature/cart/bloc/cart_page_state.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final CartState state;

  CheckoutBottomSheet({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppString.checkout,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Card(
            child: ListTile(
              title: Text(AppString.delivery),
              trailing: Text(AppString.selectMethod),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(AppString.payment),
              trailing: Text(AppString.cash),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(AppString.promoCode),
              trailing: Text(AppString.pickDiscount),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(AppString.totalCost),
              trailing: Text(
                '\$${state.items.fold(0, (sum, item) => sum + (item.quantity * 10)).toStringAsFixed(2)}',
              ),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (state.items.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => ShowAlertDialog(),
                  );
                } else {
                  goRouter.push('/order_confirm');
                }
              },
              child: Text(AppString.placeOrder),
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
    );
  }
}
