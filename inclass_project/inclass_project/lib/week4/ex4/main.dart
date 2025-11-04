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
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              children: [
                CustomCard(title: "OOP", color: Colors.blue.shade100),
                SizedBox(height: 20),
                CustomCard(title: "DART", color: Colors.blue.shade300),
                SizedBox(height: 20),
                CustomCard(
                  title: "FLUTTER",
                  color: Colors.blue.shade600,
                  gradient: Colors.blue.shade900,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Color color;
  final Color? gradient;
  const CustomCard({
    required this.title,
    required this.color,
    this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient != null
            ? LinearGradient(colors: [color, gradient!])
            : null,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
