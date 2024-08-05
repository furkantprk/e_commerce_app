import 'package:e_commerce/feature/meal_list/widget/filter_bottom_sheet.dart';
import 'package:e_commerce/product/common_widgets/search_bar/search_bar.dart';
import 'package:e_commerce/product/utility/constants/icon_constants.dart';
import 'package:e_commerce/product/utility/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/feature/meal_list/bloc/meal_list_bloc.dart';
import 'package:e_commerce/feature/meal_list/bloc/meal_list_event.dart';
import 'package:e_commerce/feature/meal_list/bloc/meal_list_state.dart';
import 'package:e_commerce/product/utility/screen_size/screen_size.dart';
import 'package:e_commerce/feature/shop/widget/meal_item.dart';
import 'package:e_commerce/product/utility/enum/view_status_enum.dart';

class MealListPage extends StatefulWidget {
  final String type;
  final String title;

  MealListPage(this.type, this.title);

  @override
  _MealListPageState createState() => _MealListPageState();
}

class _MealListPageState extends State<MealListPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MealListBloc>().add(FetchMeals(widget.type, widget.title));
    _searchController.addListener(() {
      context.read<MealListBloc>().add(SearchMeals(_searchController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeHelper.initialize(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenSizeHelper.screenHeight * 0.05),
            child: Row(
              children: [
                Expanded(
                  child: SearchBar(
                    controller: TextEditingController(),
                    onChanged: (value) {
                      context.read<MealListBloc>().add(SearchMeals(value));
                    },
                    labelText: AppString.labelSearch,
                    prefixIcon: AppIcon.search,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => FilterBottomSheet(),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<MealListBloc, MealListState>(
              builder: (context, state) {
                if (state.status == ViewStatus.loading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.status == ViewStatus.error) {
                  return Center(
                      child:
                          Text(state.errorMessage ?? AppString.unknownError));
                } else if (state.status == ViewStatus.loaded) {
                  if (state.filteredMeals.isEmpty) {
                    return Center(child: Text(AppString.noMeals));
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (ScreenSizeHelper.screenWidth / 2) /
                          (ScreenSizeHelper.screenHeight / 3),
                    ),
                    itemCount: state.filteredMeals.length,
                    itemBuilder: (context, index) {
                      return MealItem(
                        state.filteredMeals[index],
                        ScreenSizeHelper.screenWidth,
                        ScreenSizeHelper.screenHeight,
                      );
                    },
                  );
                }

                return Center(child: Text(AppString.slctTypeTitle));
              },
            ),
          ),
        ],
      ),
    );
  }
}
