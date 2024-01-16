part of 'filter_page_bloc.dart';

@immutable
sealed class FilterPageEvent {}

class FilterPageInitialEvent extends FilterPageEvent {}

class AddFilterEvent extends FilterPageEvent {
  final Taxonomy addedTaxanomy;
  final FilterPageLoaded currentState;
  AddFilterEvent({required this.addedTaxanomy, required this.currentState});
}

class RemeoveFilterEvent extends FilterPageEvent {
  final Taxonomy removeTaxanomy;
  final FilterPageLoaded currentState;
  RemeoveFilterEvent(
      {required this.currentState, required this.removeTaxanomy});
}

class SortingChangedEvent extends FilterPageEvent {
  final List<Taxonomy> selectedFilters;
  final List<Category> filters;
  final Category sortList;
  final String selectedSorting;
  SortingChangedEvent({
    required this.selectedFilters,
    required this.filters,
    required this.sortList,
    required this.selectedSorting,
  });
}
