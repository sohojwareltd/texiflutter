import 'package:flutter/material.dart';

class MediumButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;
  final Color strokeColor;
  final double strokeWidth;
  final VoidCallback? onPressed;

  const MediumButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.color,
    required this.strokeColor,
    required this.strokeWidth,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: StadiumBorder(
            side: BorderSide(
              color: strokeColor,
              width: strokeWidth,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

