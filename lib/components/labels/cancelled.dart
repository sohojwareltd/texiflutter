import 'package:flutter/material.dart';

class Cancelled extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const Cancelled({
    super.key,
    required this.label,
    this.backgroundColor = const Color(0xFFBFFFE6),
    this.textColor = const Color(0xFF004D34),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}