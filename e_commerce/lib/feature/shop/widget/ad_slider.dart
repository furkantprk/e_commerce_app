import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdSlider extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  AdSlider(this.screenWidth, this.screenHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.green, width: 2),
      ),
      child: PageView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(AppString.ad1Image, fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(AppString.ad2Image, fit: BoxFit.cover),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(AppString.ad3Image, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
