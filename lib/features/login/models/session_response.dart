import 'package:pricelocq/features/login/models/session.dart';

class SessionResponse {
  SessionResponse({
    required this.data,
    required this.status,
  });
  final Session data;
  final String status;

  factory SessionResponse.fromJson(Map<String, dynamic> json) {
    return SessionResponse(
      data: Session.fromJson(json['data']),
      status: json['status'],
    );
  }
}