import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

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
        appBar: AppBar(title: Text('My Hobbies')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButton(
                  iconPosition: IconPosition.right,
                  type: ButtonType.primary,
                  icon: Icon(Icons.check, color: Colors.white),
                  label: 'Submit',
                ),
                SizedBox(height: 20),
                CustomButton(
                  type: ButtonType.secondary,
                  icon: Icon(Icons.watch_later_outlined, color: Colors.white),
                  label: 'Time',
                ),
                SizedBox(height: 20),
                CustomButton(
                  type: ButtonType.disabled,
                  icon: Icon(Icons.account_tree_outlined, color: Colors.white),
                  label: 'Account',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType type;
  final Icon icon;
  final String label;
  final IconPosition? iconPosition;

  const CustomButton({
    super.key,
    this.iconPosition,
    required this.type,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: type == ButtonType.primary
            ? Colors.blue
            : type == ButtonType.secondary
            ? Colors.green
            : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.right) ...[
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            icon,
          ] else ...[
            icon,
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
