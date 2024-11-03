class WeatherModel {
  const WeatherModel({
    required this.cityName,
    required this.temp,
    required this.status,
    required this.maxTemp,
    required this.minTemp,
    required this.windSpead,
    required this.lastUpdated,
    required this.sunSetTime,
    required this.sunRiseTime,
    required this.feelsLike,
    required this.humidity,
    required this.uv,
    required this.visibility,
    required this.airPressure,
  });
  final String cityName;
  final double temp;
  final String status;
  final double maxTemp;
  final double minTemp;
  final double windSpead;
  final DateTime lastUpdated;
  final String sunSetTime;
  final String sunRiseTime;
  final double feelsLike;
  final int humidity;
  final double uv;
  final double visibility;
  final double airPressure;

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      temp: json["current"]["temp_c"],
      status: json["current"]["condition"]["text"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      windSpead: json["current"]["wind_kph"],
      lastUpdated: DateTime.parse(json["current"]["last_updated"]),
      sunSetTime: json["forecast"]["forecastday"][0]["astro"]["sunset"],
      sunRiseTime: json["forecast"]["forecastday"][0]["astro"]["sunrise"],
      feelsLike: json["current"]["feelslike_c"],
      humidity: json["current"]["humidity"],
      uv: json["current"]["uv"],
      visibility: json["current"]["vis_km"],
      airPressure: json["current"]["pressure_mb"],
    );
  }
  void PrintMyData() {
    print(
        "$cityName \n $temp \n $maxTemp \n $minTemp \n $windSpead \n $lastUpdated \n $sunRiseTime \n $sunSetTime \n $humidity \n $uv \n $visibility \n $status \n $airPressure \n $feelsLike \n");
  }
}
