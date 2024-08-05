import 'package:e_commerce/feature/shop/bloc/shop_page_bloc.dart';
import 'package:e_commerce/feature/shop/bloc/shop_page_event.dart';
import 'package:e_commerce/feature/shop/bloc/shop_page_state.dart';
import 'package:e_commerce/feature/shop/widget/ad_slider.dart';
import 'package:e_commerce/feature/shop/widget/category_section.dart';
import 'package:e_commerce/feature/shop/widget/similar_meals_section.dart';
import 'package:e_commerce/product/common_widgets/search_bar/search_bar.dart';
import 'package:e_commerce/product/utility/constants/icon_constants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.initialize(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenSizeHelper.screenHeight * 0.04),
            child: Image.asset(AppString.colorodLogoImage),
          ),
          SizedBox(
            height: ScreenSizeHelper.screenHeight * 0.02,
          ),
          SearchBar(
            controller: TextEditingController(),
            onChanged: (value) {
              context.read<ShopBloc>().add(SearchMeals(value));
            },
            labelText: AppString.labelSearch,
            prefixIcon: AppIcon.search,
          ),
          SizedBox(
            height: ScreenSizeHelper.screenHeight * 0.02,
          ),
          Expanded(
            child: BlocBuilder<ShopBloc, ShopState>(
              builder: (context, state) {
                if (state.status == ViewStatus.initial) {
                  context.read<ShopBloc>().add(FetchMeals());
                }
                switch (state.status) {
                  case ViewStatus.loading:
                    return Center(child: CircularProgressIndicator());
                  case ViewStatus.loaded:
                    return ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenSizeHelper.screenWidth * 0.02),
                          child: AdSlider(ScreenSizeHelper.screenWidth,
                              ScreenSizeHelper.screenHeight),
                        ),
                        SizedBox(
                          height: ScreenSizeHelper.screenHeight * 0.02,
                        ),
                        CategorySection(
                          AppString.category,
                          AppString.seafood,
                          AppString.seafood,
                          state.seafoodMeals ?? [],
                          ScreenSizeHelper.screenWidth,
                          ScreenSizeHelper.screenHeight,
                        ),
                        CategorySection(
                          AppString.area,
                          'Canadian',
                          AppString.canadianFood,
                          state.canadianMeals ?? [],
                          ScreenSizeHelper.screenWidth,
                          ScreenSizeHelper.screenHeight,
                        ),
                        SimilarMealsSection(
                          state,
                          ScreenSizeHelper.screenWidth,
                          ScreenSizeHelper.screenHeight,
                        ),
                        CategorySection(
                          'ingredient',
                          'chicken_breast',
                          AppString.chickenMeals,
                          state.chickenMeals ?? [],
                          ScreenSizeHelper.screenWidth,
                          ScreenSizeHelper.screenHeight,
                        ),
                      ],
                    );
                  case ViewStatus.error:
                    return Center(child: Text('Error: ${state.errorMessage}'));
                  default:
                    return Center(child: Text(AppString.defaultmsg));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
