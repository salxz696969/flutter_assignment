import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ScoreBar(title: 'Score 1'),
                const SizedBox(height: 20),
                ScoreBar(title: 'Score 2'),
                const SizedBox(height: 20),
                ScoreBar(title: 'Score 3'),
                const SizedBox(height: 20),
                ScoreBar(title: 'Score 4'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreBar extends StatefulWidget {
  final String title;
  const ScoreBar({super.key, required this.title});

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  double scoreValue = 0.0;
  Color color=Colors.green[100]!;
  void increase() {
    setState(() {
      scoreValue = scoreValue == 1 ? 1 : scoreValue + 0.25;
      updateColor();
    });
  }

  void decrease() {
    setState(() {
      scoreValue = scoreValue == 0 ? 0 : scoreValue - 0.25;
      updateColor();
    });
  }

  void updateColor() {
    if (scoreValue <= 0.25) {
      color = Colors.green[400]!;
    } else if (scoreValue <= 0.5) {
      color = Colors.green[600]!;
    } else if (scoreValue <= 0.75) {
      color = Colors.green[800]!;
    } else {
      color = Colors.green[900]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.minimize, color: Colors.black),
                onPressed: () => decrease(),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () => increase(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 40,
            child: LinearProgressIndicator(
              value: scoreValue,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
