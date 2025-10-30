import 'package:flutter/material.dart';
class GradientButton extends StatelessWidget {
  final String title;
  final Color gradient1;
  final Color gradient2;
  const GradientButton({
    required this.title,
    required this.gradient1,
    required this.gradient2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [gradient1, gradient2]),
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
