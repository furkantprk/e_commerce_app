import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/onbording_view_model.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScreenSizeHelper.initialize(context);
    });

    return Scaffold(
      body: Consumer<OnbordingViewModel>(
        builder: (context, viewModel, child) {
          return Stack(
            children: [
              SizedBox(
                width: ScreenSizeHelper.screenWidth,
                height: ScreenSizeHelper.screenHeight,
                child: Image.asset(
                  AppString.onbordingImage,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenSizeHelper.screenHeight / 3),
                      child: Image.asset(AppString.logoImage),
                    ),
                    Text(
                      AppString.welcome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenSizeHelper.screenHeight / 12,
                      ),
                    ),
                    Text(
                      AppString.onbordingMsg,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenSizeHelper.screenHeight / 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: ScreenSizeHelper.screenHeight / 25,
                        left: ScreenSizeHelper.screenWidth / 10,
                        right: ScreenSizeHelper.screenWidth / 10,
                      ),
                      child: SizedBox(
                        width: ScreenSizeHelper.screenWidth,
                        height: ScreenSizeHelper.screenHeight / 15,
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.navigateToHome(context);
                          },
                          child: Text(
                            AppString.getStarted,
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
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
