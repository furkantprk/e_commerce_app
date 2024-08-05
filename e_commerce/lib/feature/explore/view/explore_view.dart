import 'package:e_commerce/feature/explore/bloc/explore_page_bloc.dart';
import 'package:e_commerce/feature/explore/bloc/explore_page_event.dart';
import 'package:e_commerce/feature/explore/bloc/explore_page_state.dart';
import 'package:e_commerce/feature/explore/widget/grid.dart';
import 'package:e_commerce/product/common_widgets/search_bar/search_bar.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.initialize(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenSizeHelper.screenHeight * 0.035,
                  bottom: ScreenSizeHelper.screenHeight * 0.01),
              child: Text(
                AppString.findMeals,
                style: TextStyle(
                  fontSize: ScreenSizeHelper.screenHeight / 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SearchBar(
              controller: TextEditingController(),
              onChanged: (value) {
                context.read<ExploreBloc>().add(FilterItems(value));
              },
              labelText: AppString.search,
              prefixIcon: Icon(Icons.search),
            ),
            BlocBuilder<ExploreBloc, ExploreState>(
              builder: (context, state) {
                if (state.status == ViewStatus.initial) {
                  context.read<ExploreBloc>().add(FetchCategoriesAndAreas());
                }
                if (state.status == ViewStatus.loading) {
                  return CircularProgressIndicator();
                } else if (state.status == ViewStatus.error) {
                  return Text(state.errorMessage ?? AppString.unknownError);
                }
                return Column(
                  children: [
                    GridE(state.filteredCategories, AppString.category,
                        state.imageUrls),
                    GridE(state.filteredAreas, AppString.area, state.imageUrls),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
