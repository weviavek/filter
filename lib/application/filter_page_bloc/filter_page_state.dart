part of 'filter_page_bloc.dart';

@immutable
sealed class FilterPageState {}

final class FilterPageInitial extends FilterPageState {}

final class FilterPageLoading extends FilterPageState {}

final class FilterPageLoaded extends FilterPageState {
  final List<Taxonomy> selectedFilters;
  final List<Category> filters;
  final Category sortList;
  final String selectedSorting;
  FilterPageLoaded(
      {required this.selectedFilters,
      required this.filters,
      required this.sortList,
      required this.selectedSorting});
}
