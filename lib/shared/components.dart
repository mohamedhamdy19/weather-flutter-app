import 'package:flutter/material.dart';

class SpecialText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontweight;
  final Color fontcolor;
  final TextOverflow textOverflow;
  const SpecialText(
      {super.key,
      required this.text,
      this.textOverflow = TextOverflow.ellipsis,
      this.fontweight = FontWeight.normal,
      this.size = 12,
      this.fontcolor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontweight,
          color: getTime() ? Colors.black : Colors.white),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String text;
  final String result;

  const WeatherDetail({
    super.key,
    required this.icon,
    required this.text,
    required this.result,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: weatherDetailTimeColor()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 28,
            color: getTime() ? Colors.black : Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SpecialText(
                text: text, fontcolor: Colors.grey.shade500, size: 20),
          ),
          SpecialText(
            text: result,
            size: 22,
            fontcolor: Colors.white,
            fontweight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}

class TwoWidgetHolder extends StatelessWidget {
  final Widget container1;
  final Widget container2;
  const TwoWidgetHolder(
      {super.key, required this.container1, required this.container2});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: container1),
          const SizedBox(
            width: 12,
          ),
          Expanded(child: container2)
        ],
      ),
    );
  }
}

class SunState extends StatelessWidget {
  final String sunsetTime;
  final String sunriseTime;

  const SunState(
      {super.key, required this.sunsetTime, required this.sunriseTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(myImage()), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 4, 11, 48)),
      child: Row(
        children: [
          Expanded(
              child: SunContainer(
                  alignment: CrossAxisAlignment.start,
                  mysunState: "SunSet",
                  icon: Icons.sunny,
                  time: sunsetTime)),
          Expanded(
              child: SunContainer(
                  alignment: CrossAxisAlignment.end,
                  mysunState: "Sunrise",
                  icon: Icons.sunny,
                  time: sunriseTime))
        ],
      ),
    );
  }
}

class SunContainer extends StatelessWidget {
  final String mysunState;
  final IconData icon;
  final String time;
  final CrossAxisAlignment alignment;
  const SunContainer(
      {super.key,
      required this.mysunState,
      required this.icon,
      required this.time,
      required this.alignment});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Text(
                mysunState,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )),
          Text(
            time,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}

String myImage() {
  final String path;
  if (getTime()) {
    path = "assets/sunrise2jpg.jpg";
  } else {
    path = "assets/sunsetrise.jpg";
  }
  return path;
}

class MyIconImage extends StatelessWidget {
  const MyIconImage({super.key});

  @override
  Widget build(BuildContext context) {
    return getTime()
        ? Image.asset("assets/sun.png")
        : Image.asset("assets/half-moon.png");
  }
}

bool getTime() {
  // true for daytime false for night time
  final int hour = TimeOfDay.now().hour;
  if (hour >= 6 && hour < 20) {
    return true;
  } else {
    return false;
  }
}

Color getBarColorTime() {
  if (getTime()) {
    return const Color.fromARGB(255, 193, 109, 45);
  } else {
    return const Color.fromARGB(255, 32, 53, 97);
  }
}

Color getBackColorTime() {
  if (getTime()) {
    return const Color.fromARGB(255, 249, 185, 136);
  } else {
    return const Color.fromARGB(255, 119, 136, 179);
  }
}

Color weatherDetailTimeColor() {
  if (getTime()) {
    return const Color.fromARGB(255, 254, 227, 198);
  } else {
    return const Color.fromARGB(255, 32, 53, 97);
  }
}

List<Color> colorGradient() {
  return getTime()
      ? const [
          Color.fromARGB(255, 193, 109, 45),
          Color.fromARGB(255, 249, 185, 136)
        ]
      : const [
          Color.fromARGB(255, 32, 53, 97),
          Color.fromARGB(255, 104, 151, 172),
        ];
}
