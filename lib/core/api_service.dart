import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService{
  ApiService();

  Future<Response> login({required String mobile, required String password}) async{
    try{
      var response = await Dio().post("https://stable-api.pricelocq.com/mobile/v2/sessions", data: {'mobile': mobile, 'password': password});
      return response;
    }
    catch(e) {
      throw Exception('Failed to fetch');
    }
  }

  Future<Response> getStationList() async{
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken') ?? 0;

    try{
      var response = await Dio().get('https://stable-api.pricelocq.com/mobile/stations?all', options: Options(headers: {HttpHeaders.authorizationHeader: accessToken}));
      return response;
    }
    catch(e) {
      throw Exception('Failed to fetch');
    }
  }

}