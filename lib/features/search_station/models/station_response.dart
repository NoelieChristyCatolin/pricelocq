import 'package:pricelocq/features/search_station/models/station.dart';

class StationResponse {
  StationResponse({
    required this.data,
    required this.status,
  });
  final List<Station> data;
  final String status;

  factory StationResponse.fromJson(Map<String, dynamic> json) {
    var jsonChildren = json['data'] as List;
    return StationResponse(
      data: jsonChildren.map((object) => Station.fromJson(object)).toList(),
      status: json['status'],
    );
  }
}