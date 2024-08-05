import 'package:e_commerce/feature/meal_list/view/meal_list_view.dart';
import 'package:e_commerce/feature/explore/model/area/area_model.dart';
import 'package:e_commerce/feature/explore/model/category/category_model.dart';
import 'package:e_commerce/feature/explore/widget/card.dart';
import 'package:e_commerce/product/router/router.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/material.dart';

class GridE extends StatelessWidget {
  final List items;
  final String type;
  final Map<String, String> imageUrls;

  GridE(this.items, this.type, this.imageUrls);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (ScreenSizeHelper.screenWidth / 2) /
            (ScreenSizeHelper.screenHeight / 3),
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final title = type == 'category'
            ? (item as Category).strCategory
            : (item as Area).strArea;
        final imageUrl = imageUrls[title] ?? '';
        final colors = [
          Colors.red.shade300,
          Colors.blue.shade300,
          Colors.green.shade300,
          Colors.yellow.shade300,
          Colors.purple.shade300,
          Colors.orange.shade300,
        ];
        final color = colors[index % colors.length];

        return GestureDetector(
          onTap: () {
            goRouter.push(
              '/meal_list',
              extra: {'type': type, 'title': title},
            );
          },
          child: CardE(
            title!,
            imageUrl,
            type,
            color,
          ),
        );
      },
    );
  }
}
