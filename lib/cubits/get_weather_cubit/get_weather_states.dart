import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailedState extends WeatherState {
  final String errorMsg;

  WeatherFailedState({required this.errorMsg});
}

class WeatherInitialState extends WeatherState {}
