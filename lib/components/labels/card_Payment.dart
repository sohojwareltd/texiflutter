import 'package:flutter/material.dart';

class CardPayment extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderRadius;

  const CardPayment({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF1E2F4D),
    this.foregroundColor = Colors.white,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 14, color: foregroundColor),
        label: Text(
          label,
          style: TextStyle(
            color: foregroundColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 6),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}