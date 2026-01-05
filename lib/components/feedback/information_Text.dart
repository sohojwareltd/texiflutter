import 'package:flutter/material.dart';

class InformationText extends StatelessWidget {
  final String text;
  final String? trailingText;
  final IconData icon;
  final Color backgroundColor;
  final Color contentColor;
  final Color? strokeColor;
  final double borderRadius;
  final VoidCallback? onTap;

  const InformationText({
    super.key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.contentColor,
    this.trailingText,
    this.strokeColor,
    this.borderRadius = 10.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: strokeColor != null
              ? Border.all(color: strokeColor!, width: 1.5)
              : null,
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
                text,
                style: TextStyle(
                  color: contentColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            if (trailingText != null) ...[
              const SizedBox(width: 8),
              Text(
                trailingText!,
                style: TextStyle(
                  color: contentColor.withOpacity(0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}