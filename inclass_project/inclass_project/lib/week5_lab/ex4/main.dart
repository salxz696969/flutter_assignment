import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 50),
                WeatherWidget(
                  imagePath: "assets/ex4/cloudy.png",
                  leftGradient: const Color.fromARGB(255, 128, 215, 255),
                  rightGradient: const Color.fromARGB(255, 0, 140, 255),
                  minTemp: 10.0,
                  maxTemp: 30.0,
                  temp: 15.0,
                  cityName: "Phnom Penh",
                ),
                SizedBox(height: 30),
                WeatherWidget(
                  imagePath: "assets/ex4/sunny.png",
                  leftGradient: const Color.fromARGB(255, 255, 213, 128),
                  rightGradient: const Color.fromARGB(255, 255, 140, 0),
                  minTemp: 20.0,
                  maxTemp: 40.0,
                  temp: 25.0,
                  cityName: "Siem Reap",
                ),
                SizedBox(height: 30),
                WeatherWidget(
                  imagePath: "assets/ex4/sunnyCloudy.png",
                  leftGradient: const Color.fromARGB(255, 128, 182, 255),
                  rightGradient: const Color.fromARGB(255, 0, 61, 255),
                  minTemp: 15.0,
                  maxTemp: 25.0,
                  temp: 20.0,
                  cityName: "Sihanoukville",
                ),
                SizedBox(height: 30),
                WeatherWidget(
                  imagePath: "assets/ex4/veryCloudy.png",
                  leftGradient: const Color.fromARGB(255, 0, 150, 136),
                  rightGradient: const Color.fromARGB(255, 0, 255, 229),
                  minTemp: 5.0,
                  maxTemp: 15.0,
                  temp: 10.0,
                  cityName: "Battambang",
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final String imagePath;
  final Color leftGradient;
  final Color rightGradient;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String cityName;
  const WeatherWidget({
    super.key,
    required this.imagePath,
    required this.leftGradient,
    required this.rightGradient,
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 4,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [leftGradient, rightGradient],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: SizedBox(
          height: 175,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(imagePath),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cityName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Min ${minTemp.toStringAsFixed(1)}°C",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "Max ${maxTemp.toStringAsFixed(1)}°C",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "${temp.toStringAsFixed(1)}°C",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -125,
                top: -40,
                child: CircleAvatar(
                  radius: 175,
                  backgroundColor: Colors.white.withOpacity(0.30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
