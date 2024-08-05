import 'package:e_commerce/product/router/router.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(ScreenSizeHelper.screenWidth * 0.05),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/confirmed_order.png'),
              SizedBox(height: ScreenSizeHelper.screenHeight * 0.02),
              Text(
                'Your order has been accepted',
                style: TextStyle(
                  fontSize: ScreenSizeHelper.screenHeight * 0.03,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenSizeHelper.screenHeight * 0.01),
              Text(
                "Your items have been placed and are on their way to being processed.",
                style: TextStyle(
                  fontSize: ScreenSizeHelper.screenHeight * 0.02,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenSizeHelper.screenHeight * 0.02),
              SizedBox(
                height: ScreenSizeHelper.screenHeight * 0.075,
                child: ElevatedButton(
                  onPressed: () {
                    goRouter.push('/home');
                  },
                  child: Text(
                    "Track Order",
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
              SizedBox(height: ScreenSizeHelper.screenHeight * 0.02),
              TextButton(
                onPressed: () {
                  goRouter.push('/home');
                },
                child: Text(
                  "Back to Home",
                  style: TextStyle(
                    fontSize: ScreenSizeHelper.screenWidth / 25,
                    color: AppColor.mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
