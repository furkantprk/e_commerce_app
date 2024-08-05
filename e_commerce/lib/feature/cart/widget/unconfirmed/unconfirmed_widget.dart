import 'package:e_commerce/product/router/router.dart';
import 'package:e_commerce/product/utility/constants/color_constants.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/unconfirmed_order.png'),
            SizedBox(height: ScreenSizeHelper.screenHeight * 0.02),
            Text(
              'Oops! Order Failed',
              style: TextStyle(
                fontSize: ScreenSizeHelper.screenHeight * 0.025,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ScreenSizeHelper.screenHeight * 0.01),
            Text(
              'Something went terribly wrong',
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
                  goRouter.pop();
                },
                child: Text(
                  "Please Try Again",
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
            SizedBox(height: ScreenSizeHelper.screenHeight * 0.01),
            TextButton(
              onPressed: () {
                goRouter.push('/home'); // Navigate to the shop page
              },
              child: Text(
                "Go to Home",
                style: TextStyle(
                  fontSize: ScreenSizeHelper.screenWidth / 25,
                  color: AppColor.mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
