import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/shared/components.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SpecialText(
                  text: weatherModel.cityName,
                  size: 27,
                  fontweight: FontWeight.bold,
                ),
              ],
            ),
            const Icon(
              Icons.location_on_sharp,
              size: 15,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 85,
              child: MyIconImage(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SpecialText(
                  text: "${weatherModel.temp}°",
                  size: 90,
                  fontweight: FontWeight.bold,
                ),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: SpecialText(
                          text: weatherModel.status,
                          size: 25,
                          textOverflow: TextOverflow.ellipsis,
                        )))
              ],
            ),
            Row(
              children: [
                SpecialText(
                  text:
                      "min: ${weatherModel.minTemp}° / max:${weatherModel.maxTemp}°",
                  size: 16,
                ),
                const SizedBox(
                  width: 14,
                  child: SpecialText(
                    text: "/",
                    size: 15,
                  ),
                ),
                Expanded(
                  child: SpecialText(
                      text: "Air speed: ${weatherModel.windSpead} mi/h",
                      size: 15),
                )
              ],
            ),
            SpecialText(
              text:
                  "last updated: ${(weatherModel.lastUpdated.hour).toString()}:${(weatherModel.lastUpdated.minute).toString()}",
              size: 15,
            ),
            const SizedBox(
              height: 36,
            ),
            SunState(
                sunsetTime: weatherModel.sunSetTime,
                sunriseTime: weatherModel.sunRiseTime),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpecialText(
                text: "Weather details",
                fontcolor: Colors.grey.shade300,
                size: 14,
              ),
            ),
            TwoWidgetHolder(
                container1: WeatherDetail(
                    icon: Icons.thermostat_sharp,
                    text: "Feels like",
                    result: "${weatherModel.feelsLike}°"),
                container2: WeatherDetail(
                  icon: Icons.wind_power_outlined,
                  text: "SW wind",
                  result: "${weatherModel.windSpead} km/h",
                )),
            const SizedBox(
              height: 8,
            ),
            TwoWidgetHolder(
                container1: WeatherDetail(
                    icon: Icons.water_drop_outlined,
                    text: "Humidity",
                    result: "${weatherModel.humidity}%"),
                container2: WeatherDetail(
                  icon: Icons.wb_sunny_outlined,
                  text: "UV",
                  result: "${weatherModel.uv}",
                )),
            const SizedBox(
              height: 8,
            ),
            TwoWidgetHolder(
                container1: WeatherDetail(
                    icon: FontAwesomeIcons.eye,
                    text: "Visibility",
                    result: "${weatherModel.visibility}° km"),
                container2: WeatherDetail(
                  icon: FontAwesomeIcons.wind,
                  text: "Air pressure",
                  result: "${weatherModel.airPressure.toString()} mb",
                )),
            const SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
