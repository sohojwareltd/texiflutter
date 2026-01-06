import 'package:flutter/material.dart';

class Hire extends StatelessWidget {
  final String mainText;
  final String subText;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const Hire({
    super.key,
    required this.mainText,
    required this.subText,
    required this.backgroundColor, // Deep Green// Pinkish ring
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: backgroundColor, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Side: Bold Status Text
            Text(
              mainText.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),

            // Right Side: Action Text
            Text(
              subText,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}