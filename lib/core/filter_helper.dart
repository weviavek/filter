import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times/application/filter_page_bloc/filter_page_bloc.dart';
import 'package:times/domain/models/models.dart';

class FilterHelper {
  static bool taxonomyContains(
      List<Taxonomy> currentList, Taxonomy newTaxonmy) {
    for (final currentTaxonomy in currentList) {
      if (currentTaxonomy.name == newTaxonmy.name &&
          currentTaxonomy.guid == newTaxonmy.guid) {
        return true;
      }
    }
    return false;
  }

  static int counter(
      List<Taxonomy> selectedtaxonomy, List<Taxonomy> currentTaxonomy) {
    int count = 0;
    for (final selectedElement in selectedtaxonomy) {
      for (final currentElement in currentTaxonomy) {
        if (currentElement.name == selectedElement.name &&
            currentElement.guid == selectedElement.guid) {
          count++;
        }
      }
    }
    return count;
  }

  static void remover(BuildContext context, FilterPageLoaded currentState,
      Taxonomy removeTaxanomy) {
    context.read<FilterPageBloc>().add(RemeoveFilterEvent(
        currentState: currentState, removeTaxanomy: removeTaxanomy));
  }
}
