import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const AccountMenuItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: ScreenSizeHelper.screenHeight * 0.02,
          horizontal: ScreenSizeHelper.screenWidth * 0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon,
                    color: Colors.black,
                    size: ScreenSizeHelper.screenHeight * 0.03),
                SizedBox(width: ScreenSizeHelper.screenWidth * 0.04),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: ScreenSizeHelper.screenHeight * 0.025,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios,
                color: Colors.grey,
                size: ScreenSizeHelper.screenHeight * 0.025),
          ],
        ),
      ),
    );
  }
}
