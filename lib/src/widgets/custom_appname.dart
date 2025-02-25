import 'package:flutter/material.dart';

class CustomAppName extends StatelessWidget {
  final double fontSize;

  const CustomAppName({
    super.key,
    required this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Z ",
            style: TextStyle(
              color: Colors.blue,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "A ",
            style: TextStyle(
              color: Colors.blue,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),TextSpan(
            text: "R ",
            style: TextStyle(
              color: Colors.blue,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),TextSpan(
            text: "I ",
            style: TextStyle(
              color: Colors.blue,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),TextSpan(
            text: "T ",
            style: TextStyle(
              color: Colors.blue,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),TextSpan(
            text: "Y ",
            style: TextStyle(
              color: Colors.blue,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}