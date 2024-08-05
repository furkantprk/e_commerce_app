import 'package:e_commerce/product/router/router.dart';
import 'package:flutter/material.dart';

class OnbordingViewModel with ChangeNotifier {
  void navigateToHome(BuildContext context) {
    goRouter.pushReplacement('/home');
  }
}
