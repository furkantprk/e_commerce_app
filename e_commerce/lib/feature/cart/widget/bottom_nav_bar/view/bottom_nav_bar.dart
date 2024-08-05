import 'package:e_commerce/feature/cart/widget/bottom_nav_bar/view_model/bottom_nav_bar_view_model.dart';
import 'package:e_commerce/product/utility/constants/icon_constants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  final Widget child;
  const BottomNavBar({required this.child, Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<BottomNavBarViewModel>(
        builder: (context, viewModel, child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: AppIcon.shop,
                label: AppString.shopLabel,
              ),
              BottomNavigationBarItem(
                icon: AppIcon.explore,
                label: AppString.exploreLabel,
              ),
              BottomNavigationBarItem(
                icon: AppIcon.cart,
                label: AppString.cartLabel,
              ),
              BottomNavigationBarItem(
                icon: AppIcon.favorite,
                label: AppString.favoriteLabel,
              ),
              BottomNavigationBarItem(
                icon: AppIcon.account,
                label: AppString.accountLabel,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: viewModel.currentIndex,
            onTap: (index) {
              viewModel.indexChange(index);
            },
            backgroundColor: Colors.white,
            selectedItemColor: Colors.green,
          );
        },
      ),
      body: widget.child,
    );
  }
}
