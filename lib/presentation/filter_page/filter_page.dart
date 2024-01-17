// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times/core/constants.dart';

import '../../application/filter_page_bloc/filter_page_bloc.dart';
import 'widgets/filter_list_widget.dart';
import 'widgets/selected_filters_widget.dart';
import 'widgets/sort_card.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  void initState() {
    context.read<FilterPageBloc>().add(FilterPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          ConstantText.title,
          style: ConstantTextStyles.titleStyle,
        ),
      ),
      body: BlocBuilder<FilterPageBloc, FilterPageState>(
        builder: (context, state) {
          return state is FilterPageLoaded
              ? Stack(children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        children: [
                          state.selectedFilters.isNotEmpty
                              ? SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .05,
                                  child: SelectedFiltersWidget(
                                    filterList: state.selectedFilters,
                                    currentState: state,
                                  ),
                                )
                              : const SizedBox(),
                          SortCard(state: state),
                          FilterListWidget(state: state),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: ConstantColors.kButtonColorDarkGray),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'SHOW 0 RESULTS',
                            style: ConstantTextStyles.buttonStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
