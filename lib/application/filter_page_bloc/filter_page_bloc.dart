import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:times/core/data_fetching.dart';

import '../../../domain/models/models.dart';

part 'filter_page_event.dart';
part 'filter_page_state.dart';

class FilterPageBloc extends Bloc<FilterPageEvent, FilterPageState> {
  FilterPageBloc() : super(FilterPageInitial()) {
    on<FilterPageInitialEvent>((event, emit) async {
      emit(FilterPageLoading());
      final jsonData = await DataFetchControllers().loadJSONFromFile();
      DataModel dataModel = DataModel.fromJson(jsonData);
      Category sortList = dataModel.data.firstWhere(
        (element) => element.name.toLowerCase() == 'sort by',
      );
      final String defaultSortingSelection = sortList.taxonomies.first.name!;
      final List<Category> filterList = dataModel.data;
      filterList.removeWhere(
        (element) => element.name.toLowerCase() == 'sort by',
      );

      emit(FilterPageLoaded(
          selectedFilters: [],
          filters: filterList,
          sortList: sortList,
          selectedSorting: defaultSortingSelection));
    });
    on<SortingChangedEvent>((event, emit) {
      String newSorting = event.selectedSorting;
      emit(FilterPageLoaded(
          selectedFilters: event.selectedFilters,
          filters: event.filters,
          sortList: event.sortList,
          selectedSorting: newSorting));
    });
    on<AddFilterEvent>(
      (event, emit) {
        List<Taxonomy> currentList = event.currentState.selectedFilters;
        Taxonomy newTaxonomy = event.addedTaxanomy;
        currentList.add(newTaxonomy);
        emit(FilterPageLoaded(
            selectedFilters: currentList.reversed.toList(),
            filters: event.currentState.filters,
            sortList: event.currentState.sortList,
            selectedSorting: event.currentState.selectedSorting));
      },
    );
    on<RemeoveFilterEvent>((event, emit) {
      List<Taxonomy> currentList = event.currentState.selectedFilters;
      Taxonomy removeTaxonomy = event.removeTaxanomy;
      currentList.removeWhere((element) =>
          element.name == removeTaxonomy.name &&
          element.guid == removeTaxonomy.guid);
          emit(FilterPageLoaded(
            selectedFilters: currentList.reversed.toList(),
            filters: event.currentState.filters,
            sortList: event.currentState.sortList,
            selectedSorting: event.currentState.selectedSorting));
    });
  }
}
