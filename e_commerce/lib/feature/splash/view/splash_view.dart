import 'package:e_commerce/feature/splash/view_model/splash_view_model.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Consumer<SplashViewModel>(
        builder: (context, viewModel, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScreenSizeHelper.initialize(context);
            viewModel.goHome(context);
          });

          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppString.logoImage,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.nectar,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenSizeHelper.screenHeight / 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppString.splashMsg,
                      style: TextStyle(
                        fontSize: ScreenSizeHelper.screenHeight / 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
