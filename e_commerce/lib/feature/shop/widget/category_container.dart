import 'package:e_commerce/product/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  String title;
  String type;
  double screenWidth;
  double screenHeight;
  String imageUrl;

  CategoryContainer(this.title, this.type, this.screenWidth, this.screenHeight,
      this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goRouter.push('/meal_list', extra: {'type': type, 'title': title});
      },
      child: Container(
        width: screenWidth * 0.45,
        margin: EdgeInsets.only(right: screenWidth * 0.04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: screenWidth * 0.45,
                height: screenHeight * 0.2,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
