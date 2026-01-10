import 'package:flutter/material.dart';

class Completed extends StatelessWidget {
  final String label;

  const Completed({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // Define your logic for colors here
    Color bgColor;
    Color txtColor;

    if (label == "Canceled") {
      bgColor = const Color(0xFFF5B7B1); // Light Red
      txtColor = const Color(0xFF5D2523); // Dark Red
    } else if (label == "Pending") {
      bgColor = const Color(0xFFFFF4CC); // Light Yellow
      txtColor = const Color(0xFF856404); // Dark Brown/Gold
    } else {
      // Default to "Completed" Green
      bgColor = const Color(0xFFB5FCE6);
      txtColor = const Color(0xFF004D34);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: txtColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}