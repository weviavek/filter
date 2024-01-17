import 'package:flutter/material.dart';
import 'package:times/application/filter_page_bloc/filter_page_bloc.dart';
import 'package:times/core/filter_helper.dart';

import '../../../domain/models/models.dart';

class SelectedFiltersWidget extends StatelessWidget {
  final List<Taxonomy> filterList;
  final FilterPageLoaded currentState;
  const SelectedFiltersWidget({super.key, required this.filterList,required this.currentState});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.close,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(child: Text(filterList[index].name!)),
                  ],
                )),
            onTap: () =>
                FilterHelper.remover(context, currentState, filterList[index]),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: filterList.length,
        ),
      ),
    );
  }
}
