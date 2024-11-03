import 'package:flutter/material.dart';
import 'package:weather_app/shared/components.dart';
import 'package:weather_app/views/search_screen.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                child: Text(
                  "No weather available, click here to start searching🔎",
                  style: TextStyle(
                      color: getTime() ? Colors.black : Colors.white,
                      fontSize: 20),
                )),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Image.asset(
                  "assets/rainy-day.png",
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: 0.67,
                  child: Image.asset(
                    "assets/no-results.png",
                    fit: BoxFit.cover,
                    height: 180,
                    width: 180,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
