import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq/features/search_station/bloc/search_station_state.dart';
import 'package:pricelocq/features/search_station/models/station.dart';
import 'package:pricelocq/features/search_station/search_station_repository.dart';

class SearchStationCubit extends Cubit<SearchStationState>{
  SearchStationCubit({required this.searchStationRepository}): super(SearchStationState()){
    getStationList();
  }

  final SearchStationRepository searchStationRepository;

  void getStationList() async {
    List<Station> stations = await searchStationRepository.getStationList();
    emit(state.copyWith(stations: stations));
  }

  int convertDistance(double distance){
    return (distance/1000).ceil();
  }
}