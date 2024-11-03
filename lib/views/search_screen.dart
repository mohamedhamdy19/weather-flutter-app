import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search A City",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    BlocProvider.of<GetWeatherCubit>(context)
                        .getWeather(cityName: value);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter city name")),
                    );
                  }
                },
                decoration: const InputDecoration(
                  labelText: "Please Enter City Name",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/rainy-day.png",
                      height: 300,
                      width: 300,
                    ),
                    Image.asset(
                      "assets/sun.png",
                      height: 120,
                      width: 120,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
