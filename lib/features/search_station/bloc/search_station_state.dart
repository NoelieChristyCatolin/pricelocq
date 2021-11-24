import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pricelocq/features/search_station/models/station.dart';

part 'search_station_state.freezed.dart';

@freezed
class SearchStationState with _$SearchStationState{
  factory SearchStationState({
    @Default([]) List<Station> stations,
  }) = _SearchStationState;
}