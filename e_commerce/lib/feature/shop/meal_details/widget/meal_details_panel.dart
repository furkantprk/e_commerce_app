import 'package:e_commerce/feature/shop/meal_details/bloc/meal_details_bloc.dart';
import 'package:e_commerce/feature/shop/meal_details/bloc/meal_details_event.dart';
import 'package:e_commerce/feature/shop/meal_details/bloc/meal_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailsBloc, MealDetailsState>(
      builder: (context, state) {
        return ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            final updatedItems = List<Item>.from(state.panelItems);
            updatedItems[index] =
                updatedItems[index].copyWith(isExpanded: !isExpanded);
            context.read<MealDetailsBloc>().add(ChangePanelState(updatedItems));
          },
          children: state.panelItems.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                  trailing: item.headerValue == 'Nutrition'
                      ? Text('100g')
                      : item.headerValue == 'Review'
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<MealDetailsBloc>()
                                        .add(SelectRating(index + 1));
                                  },
                                  child: Icon(
                                    index < state.selectedRating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: index < state.selectedRating
                                        ? Colors.orange
                                        : Colors.grey,
                                  ),
                                );
                              }),
                            )
                          : null,
                );
              },
              body: item.headerValue == "Review"
                  ? ElevatedButton(
                      onPressed: () {
                        // Review functionality here
                      },
                      child: const Text('Leave a Review'),
                    )
                  : ListTile(
                      title: Text(item.expandedValue),
                    ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        );
      },
    );
  }
}
