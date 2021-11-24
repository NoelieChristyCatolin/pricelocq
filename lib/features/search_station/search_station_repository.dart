import 'package:dio/dio.dart';
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
      return stationResponse.data;
    }
    else{
      throw Exception('Failed to fetch');
    }
  }


}