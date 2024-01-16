import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times/core/filter_helper.dart';

import '../../../../application/filter_page_bloc/filter_page_bloc.dart';
import '../../../../core/constants.dart';
import '../../../../domain/models/models.dart';
import '../../../custom_widgets/custom_radio_tile.dart';

class FilterListWidget extends StatelessWidget {
  final FilterPageLoaded state;
  const FilterListWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Category currentCategory = state.filters[index];
        int taxonomyCount = currentCategory.taxonomies.length;
        List<Taxonomy> taxonomyList = currentCategory.taxonomies;
        List<Taxonomy> selectedFilters = state.selectedFilters;
        int count = FilterHelper.counter(selectedFilters, taxonomyList);
        return Card(
          shadowColor: Colors.transparent,
            child: ColoredBox(
          color: Colors.white,
          child: ExpansionTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Row(
                children: [
                  Text(
                    currentCategory.name,
                    style: ConstantTextStyles.headingStyle,
                  ),
                  if (count > 0) ...[
                    Text(
                      ' ($count)',
                      style: ConstantTextStyles.headingStyle
                          .copyWith(color: ConstantColors.kColorsPurple),
                    )
                  ]
                ],
              ),
            ),
            children: List.generate(taxonomyCount, (index) {
              bool isSelected = FilterHelper.taxonomyContains(
                  selectedFilters, taxonomyList[index]);
              return GestureDetector(
                onTap: () => isSelected
                    ? FilterHelper.remover(context, state, taxonomyList[index])
                    : context.read<FilterPageBloc>().add(AddFilterEvent(
                        addedTaxanomy: taxonomyList[index],
                        currentState: state)),
                child: RadioTile(
                    height: 35,
                    leading: MultipleSeletionRadio(
                      color: ConstantColors.kColorsPurple,
                      isSelected: isSelected,
                    ),
                    title: Text(
                      taxonomyList[index].name!,
                      style: ConstantTextStyles.radioTextStyle,
                    )),
              );
            }),
          ),
        ));
      },
      itemCount: state.filters.length,
    );
  }
}
