import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "c5fd91ad6255479aa1a163238240608";
  WeatherService(
    this.dio,
  );

  Future<WeatherModel> getCurrentWeather({required cityName}) async {
    try {
      final Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ?? "Opps! there was an error.";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Opps there was an error try later");
    }
  }
}
