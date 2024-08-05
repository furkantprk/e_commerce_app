import 'package:e_commerce/product/router/router.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    goRouter.pushReplacement('/onbording');
  }
}
