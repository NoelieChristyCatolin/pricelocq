import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_state.dart';
import 'package:pricelocq/features/search_station/models/station.dart';
import 'package:pricelocq/features/search_station/search_station_repository.dart';

class SearchStationCubit extends Cubit<SearchStationState>{
  SearchStationCubit({required this.searchStationRepository}): super(SearchStationState()){}

  final SearchStationRepository searchStationRepository;
  List<Station> _stations = [];

  void getStationList() async {
    print('getStationList');
    List<Station> stations = await searchStationRepository.getStationList();
    _stations = stations;
    emit(state.copyWith(stations: stations));
  }

  void searchStation(String searchKey){
    List<Station> searchResults = [];
    for (var element in _stations) {
      if (element.name.contains(searchKey.toUpperCase())){
        searchResults.add(element);
      }
      emit(state.copyWith(stations: searchResults));
    }
  }

  int convertDistance(double distance){
    return (distance/1000).ceil();
  }
}