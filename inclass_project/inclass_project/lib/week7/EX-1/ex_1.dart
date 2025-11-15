import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 300,
          child: Column(
            children: [
              Button(
              buttonColorWhenNotSelected: Colors.blue[50]!,
              buttonColorWhenSelected: Colors.blue[500]!,
              textColor: Colors.black,
              ),
              const SizedBox(height: 20),
              Button(
              buttonColorWhenNotSelected: Colors.green[50]!,
              buttonColorWhenSelected: Colors.green[500]!,
              textColor: Colors.black,
              ),
              const SizedBox(height: 20),
              Button(
              buttonColorWhenNotSelected: Colors.red[50]!,
              buttonColorWhenSelected: Colors.red[500]!,
              textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

class Button extends StatefulWidget {
  final Color buttonColorWhenNotSelected ;
  final Color buttonColorWhenSelected;
  final Color textColor;
  const Button({
    super.key,
    required this.buttonColorWhenNotSelected,
    required this.buttonColorWhenSelected,
    required this.textColor,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late String buttonText= 'Not Selected';
  late Color buttonColorWhenNotSelected;
  late Color buttonColorWhenSelected;
  late Color textColor;

  @override
  void initState() {
    super.initState();
    buttonColorWhenNotSelected = widget.buttonColorWhenNotSelected;
    buttonColorWhenSelected = widget.buttonColorWhenSelected;
    textColor = widget.textColor;
  }

  void changeText() {
    setState(() {
      if (buttonText == 'Not Selected') {
        buttonText = 'Selected';
        textColor = Colors.white;
        buttonColorWhenSelected = Colors.blue[500]!;
      } else {
        buttonText = 'Not Selected';
        textColor = Colors.black;
        buttonColorWhenNotSelected = Colors.blue[50]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => changeText(),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonText == 'Not Selected'
            ? buttonColorWhenNotSelected
            : buttonColorWhenSelected,
        foregroundColor: textColor,
        textStyle: const TextStyle(fontSize: 24),
      ),
      child: Center(child: Text(buttonText)),
    );
  }
}
