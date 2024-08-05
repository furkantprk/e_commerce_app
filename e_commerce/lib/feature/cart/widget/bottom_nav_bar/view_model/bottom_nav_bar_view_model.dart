import 'package:e_commerce/product/router/router.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBarViewModel extends ChangeNotifier {
  int currentIndex = 0;

  void indexChange(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        goRouter.go('/shop');
        break;
      case 1:
        goRouter.go('/explore');
        break;
      case 2:
        goRouter.go('/cart');
        break;
      case 3:
        goRouter.go('/favorite');
        break;
      case 4:
        goRouter.go('/account');
        break;
      default:
        goRouter.go('/shop');
    }
    notifyListeners();
  }
}
