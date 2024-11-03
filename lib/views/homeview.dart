import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/no_weather_body.dart';
import 'package:weather_app/screens/weather_info_body.dart';
import 'package:weather_app/shared/components.dart';
import 'package:weather_app/views/search_screen.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Weather ",
                  style:
                      TextStyle(color: getTime() ? Colors.black : Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: getBackColorTime()),
                  child: const Text(
                    "Check⛅",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
            backgroundColor: getBarColorTime()),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: colorGradient(),
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitialState) {
                return const NoWeatherBody();
              } else if (state is WeatherLoadedState) {
                return WeatherInfoBody(weatherModel: state.weatherModel);
              } else {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SpecialText(
                    text: "Sorry something went Wrong",
                    size: 15,
                  ),
                );
              }
            },
          ),
        ));
  }
}
