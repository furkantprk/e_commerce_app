import 'package:e_commerce/product/utility/constants/icon_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardE extends StatelessWidget {
  String title;
  String imageUrl;
  String type;
  Color color;

  CardE(this.title, this.imageUrl, this.type, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imageUrl, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
            return Center(child: AppIcon.error);
          }),
          Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              color: Colors.black45,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                type.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
