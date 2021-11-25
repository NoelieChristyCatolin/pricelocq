import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pricelocq/api_service.dart';
import 'package:pricelocq/features/search_station/models/station.dart';
import 'package:pricelocq/features/search_station/models/station_response.dart';

class SearchStationRepository{
  SearchStationRepository({required this.apiService});

  final ApiService apiService;

  Future<List<Station>> getStationList() async{
    Response response = await apiService.getStationList();
    if (response.statusCode == 200) {
      StationResponse stationResponse = StationResponse.fromJson(response.data);
      List<Station> sortedStations = await sortStationByDistance(stationResponse.data);
      return sortedStations;
    }
    else{
      throw Exception('Failed to fetch');
    }
  }

  Future<List<Station>> sortStationByDistance(List<Station> stations) async {
    List<Station> sortedStations = [];
    Position currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    for (var element in stations)  {
      Station station = element;
      double distance = Geolocator.distanceBetween(currentLocation.latitude, currentLocation.longitude, double.parse(element.lat), double.parse(element.lng));
      station.distance = distance;
      sortedStations.add(station);
    }
    sortedStations.sort((a, b) => a.distance!.compareTo(b.distance as double));
    return sortedStations;
  }

}