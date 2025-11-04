import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                HobbyCard(
                  color: Colors.green,
                  hobbyName: 'Traveling',
                  iconData: Icons.travel_explore,
                ),
                SizedBox(height: 20),
                HobbyCard(
                  color: Colors.grey,
                  hobbyName: 'Skating',
                  iconData: Icons.skateboarding,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final Color color;
  final String hobbyName;
  final IconData iconData;
  const HobbyCard({
    super.key,
    required this.color,
    required this.hobbyName,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Icon(iconData, size: 30, color: Colors.white),
          ),
          Text(hobbyName, style: TextStyle(fontSize: 30, color: Colors.white)),
        ],
      ),
    );
  }
}
