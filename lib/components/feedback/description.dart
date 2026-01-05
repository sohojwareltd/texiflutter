import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String title;
  final String statusText;
  final IconData icon;
  final Color backgroundColor;
  final Color contentColor;
  final VoidCallback? onTap;

  const Description({
    super.key,
    required this.title,
    required this.statusText,
    this.icon = Icons.check,
    required this.backgroundColor,
    this.contentColor = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: contentColor,
              size: 24,
            ),

            const SizedBox(width: 16),


            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: contentColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Text(
              statusText,
              style: TextStyle(
                color: contentColor.withOpacity(0.9),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}