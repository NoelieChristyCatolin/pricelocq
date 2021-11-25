import 'package:dio/dio.dart';
import 'package:pricelocq/core/api_service.dart';
import 'package:pricelocq/features/login/models/session.dart';
import 'package:pricelocq/features/login/models/session_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  LoginRepository({required this.apiService});

  final ApiService apiService;


  Future<Session> login({required String mobile, required String password})  async {
    final prefs = await SharedPreferences.getInstance();
    Response response = await apiService.login(mobile: mobile, password: password);

    if (response.statusCode == 200) {
      SessionResponse sessionResponse = SessionResponse.fromJson(response.data);
      prefs.setString('accessToken', sessionResponse.data.accessToken);
      return sessionResponse.data;
    }
    else{
      throw Exception('Failed to fetch');
    }
  }
}